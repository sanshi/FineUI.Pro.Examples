<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_textchange.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_textchange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Top" EnableCollapse="false" Title="简单表单" runat="server" LabelWidth="120px">
            <Items>
                <f:NumberBox Label="非负整数" ID="NumberBox3" runat="server" EmptyText="比如 99" OnTextChanged="NumberBox3_TextChanged" NoDecimal="true"
                    NoNegative="true" Required="true" ShowRedStar="true" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：手工输入数字，或者点击右侧上下箭头都会自动回发页面。
    </form>
</body>
</html>
