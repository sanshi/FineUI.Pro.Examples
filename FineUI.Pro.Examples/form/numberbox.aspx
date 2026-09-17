<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox" %>

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
                <f:NumberBox Label="0 到 9 的整数" ID="NumberBox1" runat="server" MaxValue="9" MinValue="0"
                    NoDecimal="true" NoNegative="true" Required="true" EmptyText="比如 8" ShowRedStar="true" />
                <f:NumberBox Label="非负整数" ID="NumberBox3" runat="server" EmptyText="比如 99"
                    NoDecimal="true" NoNegative="true" Required="true"
                    ShowRedStar="true" />
                <f:NumberBox ID="NumberBox4" runat="server" EmptyText="精度为 2，比如 0.35" Label="0 到 1 之间的小数（Increment=0.01）"
                    MaxValue="1" MinValue="0" NoDecimal="false" NoNegative="true" DecimalPrecision="2" Required="true" ShowRedStar="true" Increment="0.01">
                </f:NumberBox>
                <f:NumberBox Label="任意整数（ShowTrigger=false）" ID="NumberBox5" NoDecimal="true" ShowTrigger="false" runat="server" />
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
