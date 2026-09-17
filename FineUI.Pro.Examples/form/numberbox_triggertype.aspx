<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_triggertype.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_triggertype" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .text-align-center input {
            text-align: center;
        }
        .text-align-right input {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Right" EnableCollapse="false"
            Title="简单表单" runat="server" LabelWidth="100px">
            <Items>
                <f:NumberBox Label="Stack" ID="NumberBox1" NoDecimal="true" NoNegative="true" TriggerType="Stack" Text="100" runat="server" />
                <f:NumberBox Label="Tile" ID="NumberBox2" NoDecimal="true" NoNegative="true" TriggerType="Tile" Text="20" runat="server" />
                <f:NumberBox Label="None" ID="NumberBox3" NoDecimal="true" NoNegative="true" ShowTrigger="false" Text="20" runat="server" />
                <f:NumberBox Label="Separate" ID="NumberBox4" CssClass="text-align-center" NoDecimal="true" NoNegative="true" TriggerType="Separate" Width="200px" Text="1" runat="server" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
