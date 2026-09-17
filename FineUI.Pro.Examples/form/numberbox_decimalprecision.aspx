<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_decimalprecision.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_decimalprecision" %>

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
                <f:NumberBox ID="NumberBox1" runat="server" EmptyText="精度为 2，比如 0.35" Label="0 到 1 之间的小数"
                    MaxValue="1" MinValue="0" NoDecimal="false" NoNegative="true" DecimalPrecision="2" Required="true" ShowRedStar="true" Increment="0.01"
                    TrimEndZero="false">
                </f:NumberBox>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="修改精度为 1" OnClick="Button1_Click">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="修改精度为 2" OnClick="Button2_Click">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="修改精度为 3" OnClick="Button3_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        注：为数字输入框设置了TrimEndZero=false，所以不会去掉末尾的零（比如精度为3时，会显示0.360，而不是0.36）。
    </form>
</body>
</html>
