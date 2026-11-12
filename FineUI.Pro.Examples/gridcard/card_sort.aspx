<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_sort.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_sort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id" Height="500px"
            DisplayType="Card" CardRendererFunction="renderCard" AllowSorting="true" SortField="Gender" SortDirection="ASC" OnSort="Grid1_Sort">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText ID="btnSortLabel" EncodeText="false" runat="server"></f:ToolbarText>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Sort" ID="btnSort" ShowMenuIcon="false" runat="server">
                            <Menu runat="server">
                                <Items>
                                    <f:MenuCheckBox Text="姓名" AttributeDataTag="Name" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="性别" AttributeDataTag="Gender" Checked="true" GroupName="MenuColumnName" AutoPostBack="false"
                                        runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="入学年份" AttributeDataTag="EntranceYear" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="入学日期" AttributeDataTag="EntranceDate" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="是否在校" AttributeDataTag="AtSchool" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="所学专业" AttributeDataTag="Major" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuSeparator runat="server"></f:MenuSeparator>
                                    <f:MenuCheckBox Text="升序" AttributeDataTag="ASC" Checked="true" IconFont="_Ascend" GroupName="MenuSortDirection"
                                        AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="降序" AttributeDataTag="DESC" IconFont="_Descend" GroupName="MenuSortDirection" AutoPostBack="false"
                                        runat="server">
                                    </f:MenuCheckBox>
                                </Items>
                                <Listeners>
                                    <f:Listener Event="checkchange" Handler="onSortMenuCheckChange" />
                                </Listeners>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" SortField="Name" HeaderText="姓名"></f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" SortField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" SortField="EntranceYear" FieldType="Int" HeaderText="入学年份"></f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" SortField="EntranceDate" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" SortField="AtSchool" HeaderText="是否在校"></f:RenderCheckField>
                <f:RenderField ColumnID="Major" DataField="Major" SortField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var btnSortClientID = '<%= btnSort.ClientID %>';
        var btnSortLabelClientID = '<%= btnSortLabel.ClientID %>';

        // https://fineui.com/js/api/F.Menu.html#event:checkchange
        function onSortMenuCheckChange(event, item, checked) {
            var menu = F(btnSortClientID).menu;
            var grid = F(Grid1ClientID);

            var sortFieldMenuItem = menu.getCheckedItem('MenuColumnName');
            var sortDirectionMenuItem = menu.getCheckedItem('MenuSortDirection');

            var sortField = sortFieldMenuItem.getAttr('data-tag');
            var sortDirection = sortDirectionMenuItem.getAttr('data-tag');

            // 更新当前排序提示文字
            updateSortLabel();
            // 更新表格的排序状态
            grid.setSortField(sortField, sortDirection);
            // 触发表格的排序行为（触发表格默认的排序回发事件）
            grid.trigger('sorting', [event, sortField, sortDirection]);
        }


        // 更新当前排序提示文字
        function updateSortLabel() {
            var menu = F(btnSortClientID).menu;

            var sortFieldMenuItem = menu.getCheckedItem('MenuColumnName');
            var sortDirectionMenuItem = menu.getCheckedItem('MenuSortDirection');

            F(btnSortLabelClientID).setText(F.formatString('排序字段：<strong>{0}</strong>  排序方向：<strong>{1}</strong>', sortFieldMenuItem.getText(),
                sortDirectionMenuItem.getText()));
        }

        F.ready(function() {
            updateSortLabel();
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在卡片模式下选择排序字段与方向，重排卡片。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>通过排序菜单重排卡片</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSort").ClientID %>'
                        title="排序（排序图标）">排序（排序图标）</strong>，把字段选为<strong>姓名</strong>，再切换升序或降序。<br />结果：字段和方向交给后台重新排序并绑定，卡片顺序及排序说明同步更新。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SortField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Gender</code>，保存当前排序字段。
                </li>
                <li><code>SortDirection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>ASC</code>，保存升降序，菜单切换后使用新的方向。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
