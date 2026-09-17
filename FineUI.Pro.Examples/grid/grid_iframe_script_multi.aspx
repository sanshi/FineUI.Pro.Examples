<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_script_multi.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_iframe_script_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格"  EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            PageSize="3" runat="server" EnableCheckBoxSelect="true"
            DataIDField="Id" DataTextField="Name">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnApprove" Text="审批数据" Icon="ApplicationEdit" runat="server" ClickHandler="onApproveClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
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
                <f:LinkButtonField ColumnID="Approve" Width="50px" Icon="Pencil" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：选择多行数据，然后点击[审批数据]按钮。

        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Target="Top" OnClose="Window1_Close"
            IsModal="true" Width="850px" Height="500px">
        </f:Window>
    </form>

    <script>
        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var windowClientID = '<%= Window1.ClientID %>';

        function onApproveClick(event) {
            var grid = F(gridClientID);
            var wnd = F(windowClientID);
            
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return;
            }

            var selectedRows = grid.getSelectedRows(true);

            // DataIDField
            var selectedRowIds = $.map(selectedRows, function (item, index) {
                return item.id;
            }).join(',');

            // DataTextField
            var selectedRowTexts = $.map(selectedRows, function (item, index) {
                return item.text;
            }).join(',');

            // 编码后：grid_iframe_window.aspx?id=104,107,109&name=%E5%88%98%E5%9B%BD%2C%E9%BB%84%E5%A9%B7%E5%A9%B7%2C%E6%9D%A8%E5%A9%B7%E5%A9%B7
            // 解码后：grid_iframe_window.aspx?id=104,107,109&name=刘国,黄婷婷,杨婷婷
            var iframeUrl = basePath + 'grid_iframe_window.aspx?id=' + selectedRowIds + '&name=' + encodeURIComponent(selectedRowTexts);
            // 显示窗体
            wnd.show(iframeUrl, '审批 - ' + selectedRowTexts);
        }


        F.ready(function () {

            var grid = F(gridClientID);
            var wnd = F(windowClientID);

            grid.el.on('click', '.f-grid-cell-Approve a', function (event) {
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid.getRowData(rowEl);
                var rowId = rowData.id;
                var rowText = rowData.text;

                // grid_iframe_window.aspx?id=104&name=刘国
                var iframeUrl = basePath + 'grid_iframe_window.aspx?id=' + rowId + '&name=' + encodeURIComponent(rowText);
                // 显示窗体
                wnd.show(iframeUrl, '审批 - ' + rowText);
            });

        });

    </script>
</body>
</html>
