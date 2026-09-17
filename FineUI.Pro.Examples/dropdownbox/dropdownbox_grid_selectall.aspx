<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_selectall.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_selectall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉表格（客户端全选）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" DataControlID="Grid1" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Panel ID="Panel7" runat="server" BodyPadding="10px" Width="650px" Height="300px" Hidden="true"
                            ShowBorder="true" ShowHeader="false" Layout="Fit">
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Bottom">
                                    <Items>
                                        <f:Button runat="server" Text="全选" ID="btnSelectAll" ClickHandler="onSelectAllClick"></f:Button>
                                        <f:Button runat="server" Text="全选化学系" ID="btnSelectHuaxue" ClickHandler="onSelectHuaxueClick"></f:Button>
                                        <f:Button runat="server" Text="全选物理系" ID="btnSelectWuli" ClickHandler="onSelectWuliClick"></f:Button>
                                        <f:Button runat="server" Text="全选材料系（保持已选中项）" ID="btnSelectCailiao" ClickHandler="onSelectSelectCailiaoClick"></f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Items>
                                <f:Grid ID="Grid1" BoxFlex="1"
                                    DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                                    ShowBorder="true" ShowHeader="false"
                                    runat="server" EnableCheckBoxSelect="true">
                                    <Columns>
                                        <f:RowNumberField />
                                        <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}"
                                            HeaderText="姓名" />
                                        <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </f:TemplateField>
                                        <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                        <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                        <f:BoundField ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
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
    <script>

        var gridClientID = '<%= Grid1.ClientID %>';
        var dropDownBoxClientID = '<%= DropDownBox1.ClientID %>';
        

        function getRowIdsByMajor(majorName) {
            var grid = F(gridClientID), rows = [];
            $.each(grid.data, function (index, rowData) {
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
            F(gridClientID).selectRows(getRowIdsByMajor('材料科学与工程系'), { keep: true });
            // 将数据控件中的值同步到输入框
            F(dropDownBoxClientID).syncToBox();
        }

    </script>
</body>
</html>
