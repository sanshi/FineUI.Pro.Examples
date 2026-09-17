<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="textarea_autogrow.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.textarea_autogrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            Title="简单表单" LabelAlign="Top" ShowHeader="true">
            <Items>
                <f:TextArea runat="server" ID="TextArea1" EmptyText="文本框的高度会自动扩展" Label="自动扩展高度的文本输入框"
                    AutoGrowHeight="true" AutoGrowHeightMin="100" AutoGrowHeightMax="600">
                </f:TextArea>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
</body>
</html>
