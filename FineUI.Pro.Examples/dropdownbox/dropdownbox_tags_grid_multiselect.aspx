<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tags_grid_multiselect.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tags_grid_multiselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉表格（多选）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择"
                    EnableMultiSelect="true" MultiSelectMode="Tags" MatchFieldWidth="false" Values="105,108">
                    <PopPanel>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" Width="550px" Height="300px" Hidden="true"
                            DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true"
                            EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:TemplateField ColumnID="expander" RenderAsRowExpander="true">
                                    <ItemTemplate>
                                        <div class="expander">
                                            <p>
                                                <strong>姓名：</strong><%# Eval("Name") %>
                                            </p>
                                            <p>
                                                <strong>简介：</strong><%# Eval("Desc") %>
                                            </p>
                                        </div>
                                    </ItemTemplate>
                                </f:TemplateField>
                            </Columns>
                        </f:Grid>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" CssClass="marginr" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
                <f:Button ID="btnReset" Text="重置表单" runat="server" ClickHandler="onResetClick">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        注：如果表格分页，则需要同时指定 Values 和 Text 属性来设置下拉框的初始值。
    </form>
    <script>

        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
</body>
</html>
