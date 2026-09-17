<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_form.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Panel1" IsFluid="true" Title="表单（Layout=VBox）" runat="server" Height="400px"
            LabelAlign="Right"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true" 
            Layout="VBox" BoxConfigChildMargin="0 0 5 0" BoxConfigLastChildMargin="0" RemoveFieldsMargin="true">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" Label="姓名" ShowRedStar="true" Required="true"></f:TextBox>
                <f:DropDownList ID="DropDownList1" Label="性别" ShowRedStar="true" Required="true" runat="server">
                    <f:ListItem Text="男" Value="男" Selected="true" />
                    <f:ListItem Text="女" Value="女" />
                </f:DropDownList>
                <f:TextArea ID="TextArea1" Label="个人简介" runat="server" BoxFlex="1"></f:TextArea>
            </Items>
        </f:Form>
        <br />
        <br />
        注：为表单设置 RemoveFieldsMargin="true" 来移除表单字段的底部外边距。
    </form>
</body>
</html>
