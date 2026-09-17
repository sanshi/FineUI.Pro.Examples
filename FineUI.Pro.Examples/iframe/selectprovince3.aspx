<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince3.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.selectprovince3" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/selectprovince3_child.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" IsFluid="true" Title="表单"  BodyPadding="10px"
        runat="server" EnableCollapse="false">
        <Items>
            <f:DropDownList ID="ddlSheng" Label="请选择省份" runat="server">
            </f:DropDownList>
            <f:Button ID="Button1" runat="server" Text="从弹出窗体中选择" ClickHandler="onOpenWindow1Click">
            </f:Button>
        </Items>
    </f:SimpleForm>
    <f:Window ID="Window1" Title="选择省份" Hidden="true" EnableIFrame="true" runat="server"
        EnableMaximize="true" EnableResize="true" Target="Parent" IsModal="true" 
		Width="562px" Height="470px"
        OnClose="Window1_Close" >
    </f:Window>
    <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
    </f:Label>
    <br />
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(Window1ClientID).show('<%= ResolveUrl("~/iframe/selectprovince3_child.aspx") %>');
        }

    </script>
</body>
</html>
