<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_selectall.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_selectall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（客户端全选）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" DataControlID="Grid1" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Panel ID="Panel7" runat="server" BodyPadding="10px" Width="650px" Height="300px" Hidden="true" ShowBorder="true" ShowHeader="false"
                            Layout="Fit">
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Bottom">
                                    <Items>
                                        <f:Button runat="server" Text="全选" ID="btnSelectAll" ClickHandler="onSelectAllClick"></f:Button>
                                        <f:Button runat="server" Text="全选化学系" ID="btnSelectHuaxue" ClickHandler="onSelectHuaxueClick"></f:Button>
                                        <f:Button runat="server" Text="全选物理系" ID="btnSelectWuli" ClickHandler="onSelectWuliClick"></f:Button>
                                        <f:Button runat="server" Text="全选材料系（保持已选中项）" ID="btnSelectCailiao" ClickHandler="onSelectSelectCailiaoClick">
                                        </f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Items>
                                <f:Grid ID="Grid1" BoxFlex="1" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                                    ShowBorder="true" ShowHeader="false" runat="server" EnableCheckBoxSelect="true">
                                    <Columns>
                                        <f:RowNumberField />
                                        <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                                        <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender"
                                            RendererFunction="renderGender" />
                                        <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                        <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                        <f:RenderField ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                    </Columns>
                                </f:Grid>
                            </Items>
                        </f:Panel>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var gridClientID = '<%= Grid1.ClientID %>';
        var dropDownBoxClientID = '<%= DropDownBox1.ClientID %>';


        function getRowIdsByMajor(majorName) {
            var grid = F(gridClientID),
                rows = [];
            $.each(grid.data, function(index, rowData) {
                if (rowData.values['Major'] == majorName) {
                    rows.push(rowData.id);
                }
            });
            return rows;
        }

        function onSelectAllClick(event) {
            F(gridClientID).selectAllRows();
            // 将数据控件中的值同步到输入框
            F(dropDownBoxClientID).syncToBox();
        }

        function onSelectHuaxueClick(event) {
            F(gridClientID).selectRows(getRowIdsByMajor('化学系'));
            // 将数据控件中的值同步到输入框
            F(dropDownBoxClientID).syncToBox();
        }

        function onSelectWuliClick(event) {
            F(gridClientID).selectRows(getRowIdsByMajor('物理系'));
            // 将数据控件中的值同步到输入框
            F(dropDownBoxClientID).syncToBox();
        }

        function onSelectSelectCailiaoClick(event) {
            F(gridClientID).selectRows(getRowIdsByMajor('材料科学与工程系'), {
                keep: true
            });
            // 将数据控件中的值同步到输入框
            F(dropDownBoxClientID).syncToBox();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过客户端按钮全选或按专业批量选择人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>按条件批量选择</h3>
            <ol>
                <li>
                    展开面板，点击<strong class="example-control-reference" data-example-control="<%= btnSelectHuaxue.ClientID %>" title="全选化学系">全选化学系</strong>。<br />
                    结果：客户端只选中专业为化学系的人员。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSelectCailiao.ClientID %>" title="全选材料系（保持已选中项）">全选材料系（保持已选中项）</strong>。<br />
                    结果：材料系人员加入已有选择，前面选中的化学系人员继续保留。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSelectAll.ClientID %>" title="全选">全选</strong>。<br />
                    结果：当前表格内可选人员全部选中。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>syncToBox()</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：脚本批量操作弹出数据控件后，把新的选择文字和值同步回下拉输入区。</li>
                <li><code>DataControlID</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：指定弹出面板中提供选择数据的控件。 本页声明值为 <code>Grid1</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
