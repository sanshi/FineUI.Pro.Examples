<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_multiactions_column_menubutton.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_multiactions_column_menubutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
    <style>
        .f-grid-cell-Actions .action {
            display: inline-block;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
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
                <f:TemplateField Width="150px" ColumnID="Actions">
                    <ItemTemplate>
                        <a class="action editit" href="#">
                            <img class="f-grid-imagefield" src="../res/icon/pencil.png">
                        </a>
                        &nbsp;&nbsp;
                        <a class="action deleteit" href="#">
                            <img class="f-grid-imagefield" src="../res/icon/delete.png">
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="action btncontainer"></div>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
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

        function getRowDataViaMenuItem(menuItem) {
            // menu: menuItem.parent
            // button: menuItem.parent.target
            var button = menuItem.parent.target;
            var rowEl = button.el.parents('.f-grid-row');
            var rowData = F(gridClientID).getRowData(rowEl);
            return [rowEl.index(), rowData.id, rowData.text];
        }

        function doCustomEditPostBack(menuItem, actionName) {
            var data = getRowDataViaMenuItem(menuItem);
            F.customEvent('Grid1_CustomEdit', {
                actionName: actionName,
                rowIndex: data[0],
                rowId: data[1],
                rowText: data[2]
            });
        }


        // 公共菜单
        var menu1 = F.create({
            type: 'Menu', id: 'menu1',
            items: [{
                type: 'MenuItem', text: '操作一', icon: '../res/icon/tag_green.png',
                handler: function () {
                    doCustomEditPostBack(this, 'Action1');
                }
            }, {
                type: 'MenuItem', text: '操作二', icon: '../res/icon/tag_blue.png',
                handler: function () {
                    doCustomEditPostBack(this, 'Action2');
                }
            }, {
                type: 'MenuItem', text: '操作三', icon: '../res/icon/tag_red.png',
                handler: function () {
                    doCustomEditPostBack(this, 'Action3');
                }
            }]

           
        });


        // 表格数据加载完毕
        function onGridDataLoad(event) {
            var grid = this;

            grid.bodyEl.find('.f-grid-cell-Actions .btncontainer').each(function () {
                var btncontainer = $(this);
                F.create({
                    type: 'Button',
                    renderTo: btncontainer,
                    text: 'More',
                    menu: menu1
                });
            });

            // 动态创建的按钮会导致表格内内容错位，需要重新布局
            grid.doLayout();
        }

        F.ready(function () {

            var grid = F(gridClientID);
            var wnd = F(windowClientID);

            grid.el.on('click', '.f-grid-cell-Actions .action.editit', function (event) {
                event.preventDefault();
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


            grid.el.on('click', '.f-grid-cell-Actions .action.deleteit', function (event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    messageIcon: 'warning',
                    target: '_top',
                    ok: function () {
                        F.customEvent('Grid1_CustomDelete', {
                            rowIndex: rowEl.index(),
                            rowId: rowData.id,
                            rowText: rowData.text
                        });
                    }
                });

            });



        });

    </script>
</body>
</html>
