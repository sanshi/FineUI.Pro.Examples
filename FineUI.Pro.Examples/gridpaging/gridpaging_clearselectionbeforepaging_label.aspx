<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_clearselectionbeforepaging_label.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_clearselectionbeforepaging_label" %>

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

        function updateLabelResult() {
            var selectedRowIds = F(Grid1ClientID).getSelectedRows();

            if (!selectedRowIds.length) {
                F(labResultClientID).setText('尚未选中行');
            } else {
                var result = [];
                $.each(selectedRowIds, function (index, item) {
                    var rowId = item, rowData = cachedRows[rowId];

                    // Pro版本中，rowData.values['Major']是单元格渲染后的HTML片段，比如：<a href=\"http://gsa.ustc.edu.cn/\" target=\"_blank\" data-qtip=\"国际经济与贸易\">国际经济与贸易</a>
                    var majorText = $(rowData.values['Major']).text();

                    result.push(`${rowData.text}（${rowId}，${majorText}）`);
                });
                F(labResultClientID).setText(`选中了 <strong>${result.length}</strong> 行：${result.join(', ')}`);
            }
        }

        // 缓存当前页选中行的数据
        function cacheCurrentPage() {
            // 数据库分页，并且启用了跨页保持选中行，注意如下区别：
            // getSelectedRows()：返回所有分页选中行标识符数组，例如：['104', '108', '113']
            // getSelectedRows(true)：返回当前页选中行数据数组，例如：[{"id":"113","text":"曹飞","values":{"Name":"曹飞","Gender":1,"EntranceYear":2008,"Major":"信息工程"}}]
            $.each(F(Grid1ClientID).getSelectedRows(true), function (index, item) {
                var rowId = item.id;
                if (!cachedRows[rowId]) {
                    cachedRows[rowId] = item;
                }
            });
        }

        function onGrid1SelectionChange(event) {
            cacheCurrentPage();
            updateLabelResult();
        }

        function onGrid1DataLoad(event) {
            cacheCurrentPage();
            updateLabelResult();
        }

    </script>
</body>
</html>
