<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_dynamic2.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.menu_dynamic2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" ShowBorder="true" Title="面板" BodyPadding="10px" Height="300px"  EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" ClickHandler="onOpenNewWindowClick"
                            Text="点击打开新窗体（内联按钮）" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script type="text/javascript">

        function onOpenNewWindowClick(event) {
            window.open('https://fineui.com/pro/demo/', '_blank');
        }

    </script>
</body>
</html>
