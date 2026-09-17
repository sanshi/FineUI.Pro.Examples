<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" MatchFieldWidth="false" OnTextChanged="DropDownBox1_TextChanged"
                    EnableMultiSelect="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" Hidden="true" Width="550px"
                            Height="300px" EnableMultiSelect="false">
                            <Columns>
                                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'>
                                        </asp:Label>--%>
                                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
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
        <f:Label runat="server" ID="labResult2">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>选中一项，会触发下拉框的 TextChanged 事件</li>
            <li>点击[重置表单]按钮</li>
            <li>点击[获取下拉框的选中值]，会同时触发下拉框的 TextChanged 和按钮的 Click 事件</li>
        </ul>
    </form>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
</body>
</html>
