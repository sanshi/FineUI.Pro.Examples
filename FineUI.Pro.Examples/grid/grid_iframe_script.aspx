<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_script.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_iframe_script" %>

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

        <f:Window ID="Window1" Title="审批" Hidden="true" EnableIFrame="true" runat="server"
            EnableMaximize="true" EnableResize="true" Target="Top" OnClose="Window1_Close"
            IsModal="true" Width="850px" Height="500px">
        </f:Window>
    </form>

    <script>
        var basePath = '<%= PageContext.ResolveUrl("~/grid/") %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var windowClientID = '<%= Window1.ClientID %>';


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
