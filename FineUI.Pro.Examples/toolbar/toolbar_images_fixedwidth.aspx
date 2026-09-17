<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_images_fixedwidth.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.toolbar_images_fixedwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" IsFluid="true" Title="面板" Height="250px"
            EnableIFrame="true" IFrameName="main" EnableCollapse="false">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Image ID="Image1" runat="server" ImageWidth="16px" Icon="ArrowRight">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button1" Text="按钮一"
                            ClickHandler="onButton1Click">
                        </f:LinkButton>
                        <f:Image ID="Image2" runat="server" ImageWidth="16px" Icon="World">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button2" Text="按钮二"
                            ClickHandler="onButton2Click">
                        </f:LinkButton>
                        <f:Image ID="Image3" runat="server" ImageWidth="16px" Icon="Cake">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button3" Text="按钮三"
                            ClickHandler="onButton3Click">
                        </f:LinkButton>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <br />
        注：
        <ul>
            <li>由于页面布局时图片尚未加载，所以会造成布局错乱</li>
            <li>可以为 Image 控件设置固定宽度来解决</li>
        </ul>
    </form>
    <script type="text/javascript">

        function onButton1Click(event) {
            alert('Button1');
        }

        function onButton2Click(event) {
            alert('Button2');
        }

        function onButton3Click(event) {
            alert('Button3');
        }

    </script>
</body>
</html>
