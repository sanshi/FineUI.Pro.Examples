<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_prefix.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_prefix" %>

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
                <f:NumberBox Label="人民币" ID="NumberBox1" NoDecimal="true" NoNegative="true" Text="3000000" EnableCommas="true"
                    Required="true" ShowRedStar="true" runat="server" NumberPrefix="￥" />
                <f:NumberBox Label="美元" ID="NumberBox2" NoDecimal="true" NoNegative="true" Text="100000" EnableCommas="true"
                    Required="true" ShowRedStar="true" runat="server" NumberPrefix="$" />
                <f:NumberBox Label="百分比" ID="NumberBox3" NoNegative="true" Text="42.567" DecimalPrecision="2"
                    Required="true" ShowRedStar="true" runat="server" NumberSuffix="%" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
</body>
</html>
