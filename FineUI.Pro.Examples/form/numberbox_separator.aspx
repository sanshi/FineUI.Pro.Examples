<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_separator.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_separator" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Top" EnableCollapse="false"
            Title="简单表单" runat="server" LabelWidth="120px">
            <Items>
                <f:NumberBox Label="小数" ID="NumberBox1" runat="server" Text="-1234567.809" EnableCommas="true"
                    Required="true" ShowRedStar="true" DecimalPrecision="2" CommaSeparator="'" />
                <f:NumberBox Label="正整数" ID="NumberBox2" NoDecimal="true" NoNegative="true" Text="987654321"
                    EnableCommas="true" ShowTrigger="false" runat="server" CommaSeparator=" " />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
</body>
</html>
