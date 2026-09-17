<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_clearicon.aspx.cs" Inherits="FineUI.Pro.Examples.form.triggerbox_clearicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            ShowBorder="true" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="false" runat="server" Text="默认值" TriggerIcon="Clear" AutoShowClearIcon="true">
                </f:TriggerBox>
                <f:Button ID="btnSubmit" Text="提交表单" OnClick="btnSubmit_Click" runat="server"></f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
