<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validateforvalue.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_validateforvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm IsFluid="true" BodyPadding="10px" ID="SimpleForm1" runat="server" Title="表单">
            <Items>
                <f:DropDownList ID="DropDownList1" Label="List1" runat="server" ShowRedStar="true"
                    Required="true" MinLength="3">
                    <f:ListItem Text="甲" Value="301"></f:ListItem>
                    <f:ListItem Text="老大乙" Value="201"></f:ListItem>
                    <f:ListItem Text="老大丙" Value="101"></f:ListItem>
                </f:DropDownList>
                <f:DropDownList ID="DropDownList3" Label="List2" runat="server" ShowRedStar="true"
                    Required="true" MinLength="3" ValidateForValue="true">
                    <f:ListItem Text="老大甲（Value=0）" Value="0"></f:ListItem>
                    <f:ListItem Text="老大乙（Value=201）" Value="201"></f:ListItem>
                    <f:ListItem Text="老大丙（Value=101）" Value="101"></f:ListItem>
                </f:DropDownList>
                <f:Button ID="btnSubmit" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmit_Click"
                    ValidateForms="SimpleForm1">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
