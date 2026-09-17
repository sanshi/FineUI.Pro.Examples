<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aspnet.aspx.cs" Inherits="FineUI.Pro.Examples.aspnet.aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .marginb {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AjaxAspnetControls="aspBox" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" BodyPadding="10px"
            ShowBorder="true" ShowHeader="true" Title="内容面板">
            <f:TextBox runat="server" Width="300px" ID="extBox" EmptyText="FineUI TextBox">
            </f:TextBox>
            <div class="marginb">
                <asp:TextBox runat="server" Width="300px" ID="aspBox"></asp:TextBox>
            </div>
            <div class="marginb">
                <f:Button ID="Button1" runat="server" CssClass="marginr" Text="FineUI 按钮"
                    OnClick="Button1_Click">
                </f:Button>
            </div>
            <div class="marginb">
                <f:Button ID="Button2" runat="server" Text="FineUI 按钮（禁用AJAX）" EnableAjax="false" OnClick="Button2_Click">
                </f:Button>
            </div>
            <div>
                <asp:Button ID="Button3" Text="ASP.NET 按钮（UseSubmitBehavior=false）" runat="server" OnClick="Button3_Click" UseSubmitBehavior="false" />
            </div>
        </f:ContentPanel>
        <br />
        注意：ASP.NET 按钮必须设置属性 UseSubmitBehavior=false，否则会出现未知错误！
    </form>
</body>
</html>
