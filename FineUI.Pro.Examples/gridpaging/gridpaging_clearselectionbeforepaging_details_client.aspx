<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_clearselectionbeforepaging_details_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_clearselectionbeforepaging_details_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格（跨页选中行）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true"
            DataTextField="Name" KeepCurrentSelection="true"
            DataIDField="Id" ClearSelectionBeforePaging="false" KeepPagedSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGrid1DataLoad"></f:Listener>
                <f:Listener Event="selectionchange" Handler="onGrid1SelectionChange"></f:Listener>
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行的详细数据" ClickHandler="onShowSelectedRowIdsClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li><strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong></li>
            <li>注意设置属性：
                <ul>
                    <li>DataIDField=Id：行标识符字段</li>
                    <li>ClearSelectionBeforePaging=false：分页前清空选中项（客户端）</li>
                    <li>KeepPagedSelection=true：多选时保持分页中已选中行（客户端）</li>
                    <li>KeepCurrentSelection=true：多选时保持当前已选中行（客户端）</li>
                </ul>
            </li>
            <li>SelectedRowIndexArray属性已废弃；跨页保持选中项请使用稳定的SelectedRowIDArray属性。</li>
        </ul>
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';
        

        // 缓存的行数据
        var cachedRows = {};

        function onShowSelectedRowIdsClick(event) {
            var selectedRowIds = F(Grid1ClientID).getSelectedRows();

            if (!selectedRowIds.length) {
                F.alert('没有选中项！');
                return;
            }

            var result = ['<table class="result">'];
            result.push('<tr>');
            result.push('<th>ID</th>');
            result.push('<th>Text</th>');
            result.push('<th>性别</th>');
            result.push('<th>专业</th>');
            result.push('</tr>');


            $.each(selectedRowIds, function (index, item) {
                var rowId = item, rowData = cachedRows[rowId];

                // Pro版本中，rowData.values['Gender']是单元格渲染后的HTML片段，比如：<div class=\"f-grid-tpl\" id=\"Grid1_ftpl_103_2\"><span id=\"Grid1_ftpl_103_2_Label2\">女</span></div>
                var genderText = $(rowData.values['Gender']).text();
                var majorText = $(rowData.values['Major']).text();

                result.push('<tr>');
                result.push('<td>' + rowId + '</td>');
                result.push('<td>' + rowData.text + '</td>');
                result.push('<td>' + genderText + '</td>');
                result.push('<td>' + majorText + '</td>');
                result.push('</tr>');
            });
            result.push('</table>');

            F(labResultClientID).setValue(result.join(''));
        }

        // 缓存当前页选中行的数据
        function cacheCurrentPage() {
            $.each(F(Grid1ClientID).getSelectedRows(true), function (index, item) {
                var rowId = item.id;
                if (!cachedRows[rowId]) {
                    cachedRows[rowId] = item;
                }
            });
        }

        function onGrid1SelectionChange(event) {
            cacheCurrentPage();
        }

        function onGrid1DataLoad(event) {
            cacheCurrentPage();
        }

    </script>
</body>
</html>
