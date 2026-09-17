<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_trimend.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_trimend" %>

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
                <f:NumberBox Label="小数（两位精度，初始值：1.20，TrimEndZero=true）" ID="NumberBox1" runat="server" Text="1.20" DecimalPrecision="2" TrimEndZero="true" Required="true" ShowRedStar="true" />
                <f:NumberBox Label="小数（两位精度，初始值：1.20，TrimEndZero=false）" ID="NumberBox2" runat="server" Text="1.20" DecimalPrecision="2" TrimEndZero="false" Required="true" ShowRedStar="true" />                
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
</body>
</html>
