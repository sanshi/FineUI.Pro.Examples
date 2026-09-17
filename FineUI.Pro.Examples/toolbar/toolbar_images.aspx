<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_images.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.toolbar_images" %>

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
                        <f:Image ID="Image1" CssClass="toobar-img" runat="server" Icon="ArrowRight">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button1" Text="按钮一"
                            ClickHandler="onButton1Click">
                        </f:LinkButton>
                        <f:Image ID="Image2" CssClass="toobar-img" runat="server" Icon="World">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button2" Text="按钮二"
                            ClickHandler="onButton2Click">
                        </f:LinkButton>
                        <f:Image ID="Image3" CssClass="toobar-img" runat="server" Icon="Cake">
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
            <li>需要自己通过脚本在所有图片加载完毕后，重新对面板进行布局</li>
        </ul>
    </form>
    <script>

        // 布局时图片尚未加载，所以需要在图片完成加载后重新布局
        var panelClientID = '<%= Panel1.ClientID %>';
        F.ready(function () {
            
            // 返回 Deferred 对象数组
            var imagdefs = $('.toobar-img img').map(function() {
                var imgEl = $(this);
                return $.Deferred(function(def) {
                    imgEl.on('load', function () {
                        def.resolve();
                    });
                }).promise();
            });

            // 等工具栏上的全部图片加载完毕后，再重新布局
            $.when.apply($, $.makeArray(imagdefs)).done(function () {
                F(panelClientID).doLayout();
            });

        });



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
