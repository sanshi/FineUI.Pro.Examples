<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox_tooltip.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkbox_tooltip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单" runat="server">
            <Items>
                <f:CheckBox ID="CheckBox1" ShowLabel="true" runat="server" Label="标签一" Text="复选框 1" Checked="true">
                </f:CheckBox>
                <f:CheckBox ID="CheckBox2" ShowLabel="false" runat="server" Text="复选框 2" Checked="true">
                </f:CheckBox>
            </Items>
        </f:SimpleForm>

    </form>

</body>
</html>
