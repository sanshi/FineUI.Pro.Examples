<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_dynamic.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/toolbar/menu.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板"  EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server">
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>

        // 工具栏按钮是按 XML 配置在服务端循环生成的，共用这一个处理函数；
        // 各自要打开的地址挂在按钮的 data-tag 上（代码后置里设 AttributeDataTag）。
        function onOpenUrlClick(event) {
            window.open(this.getAttr('data-tag'), '_blank');
        }

    </script>
</body>
</html>
