<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkall_customheadmenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkall_customheadmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .custom-arrow-down {
            position: absolute;
            cursor: pointer;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        <br />
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnSelectInverse" runat="server" Text="反选" ClickHandler="onSelectInverse"></f:MenuButton>
                <f:MenuSeparator runat="server"></f:MenuSeparator>
                <f:MenuButton ID="btnSelectOdd" runat="server" Text="选中奇数行" ClickHandler="onSelectOdd"></f:MenuButton>
                <f:MenuButton ID="btnSelectEven" runat="server" Text="选中偶数行" ClickHandler="onSelectEven"></f:MenuButton>
                <f:MenuSeparator runat="server"></f:MenuSeparator>
                <f:MenuButton ID="btnSelectAtSchool" runat="server" Text="选中在校的行" ClickHandler="onSelectAtSchool"></f:MenuButton>
                <f:MenuButton ID="btnSelectLargeThan2004" runat="server" Text="选中入学年份大于2004的行" ClickHandler="onSelectLargeThan2004"></f:MenuButton>
            </Items>
        </f:Menu>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var menu1ClientID = '<%= Menu1.ClientID %>';
        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onSelectInverse(event) {
            var grid1 = F(grid1ClientID),
                rows = [];
            var currentSelectedRows = grid1.getSelectedRows();
            grid1.resolveRow(function(rowData) {
                if ($.inArray(rowData.id, currentSelectedRows) < 0) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }

        function onSelectOdd(event) {
            var grid1 = F(grid1ClientID),
                rows = [];
            var rowIndex = 0;
            grid1.resolveRow(function(rowData) {
                if (rowIndex % 2 === 0) {
                    rows.push(rowData.id);
                }
                rowIndex++;
            });
            grid1.selectRows(rows);
        }

        function onSelectEven(event) {
            var grid1 = F(grid1ClientID),
                rows = [];
            var rowIndex = 0;
            grid1.resolveRow(function(rowData) {
                if (rowIndex % 2 !== 0) {
                    rows.push(rowData.id);
                }
                rowIndex++;
            });
            grid1.selectRows(rows);
        }

        function onSelectLargeThan2004(event) {
            var grid1 = F(grid1ClientID),
                rows = [];
            grid1.resolveRow(function(rowData) {
                var entranceYear = parseInt(rowData.values['EntranceYear'], 10);
                if (entranceYear > 2004) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }

        function onSelectAtSchool(event) {
            var grid1 = F(grid1ClientID),
                rows = [];
            grid1.resolveRow(function(rowData) {
                if (rowData.values['AtSchool'] === true) {
                    rows.push(rowData.id);
                }
            });
            grid1.selectRows(rows);
        }


        F.ready(function() {

            var grid1 = F(grid1ClientID);

            grid1.el.on('click', '.f-grid-colheader .custom-arrow-down', function(event) {
                F(menu1ClientID).show();

                // 阻止事件传播（不执行表头复选框的选中/反选事件）
                event.stopPropagation();
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在选择列表头增加菜单，按奇偶行或在校状态等条件批量选择记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>使用表头选择菜单</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>选择列表头的下拉图标，再选择<strong>选中奇数行</strong>或<strong>选中偶数行</strong>。<br />结果：浏览器按本页记录顺序计算目标主键并选中；打开菜单不会连带触发表头全选。</li>
                <li>再次打开菜单，尝试<strong>反选</strong>或<strong>选中在校生</strong>。<br />结果：选择结果按新的菜单条件更新，可用本页读取选择的按钮核对。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CheckBoxSelectWidth</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：为表头复选框和菜单图标预留宽度。</li>
                <li><code>selectRows</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：菜单把计算出的业务主键集合交给选择方法，不模拟逐行点击。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
