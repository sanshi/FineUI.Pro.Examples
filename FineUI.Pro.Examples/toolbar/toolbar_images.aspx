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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示工具栏图片加载完成后重新布局，使图片与按钮按实际尺寸排列。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>核对图片加载后的排列</h3>
    <ul>
        <li>打开页面，对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>内图片及相邻按钮的位置。<br />结果：本页脚本等待工具栏图片加载完成，再重新布局面板，避免使用未加载时的图片尺寸。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>由于页面布局时图片尚未加载，所以会造成布局错乱</li>
        <li>需要自己通过脚本在所有图片加载完毕后，重新对面板进行布局</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>load</code>（<strong>工具栏图片</strong>）：图片完成加载后才统计当前尺寸。</li>
        <li><code>doLayout()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：重新计算包含工具栏的面板布局。</li>
    </ul>
</section>
</template>
</body>
</html>
