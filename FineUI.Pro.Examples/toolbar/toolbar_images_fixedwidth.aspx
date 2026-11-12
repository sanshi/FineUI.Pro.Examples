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
<template id="example-description">
<section aria-label="页面描述">
    <p>演示给工具栏图片预留固定宽度，避免图片加载时改变按钮位置。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>核对图片加载后的排列</h3>
    <ul>
        <li>打开页面，对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>内图片及相邻按钮的位置。<br />结果：图片加载前后使用同一预留宽度，相邻按钮不会等待图片自然宽度再重新分配位置。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>由于页面布局时图片尚未加载，所以会造成布局错乱</li>
        <li>可以为 <code>Image</code> 控件设置固定宽度来解决</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ImageWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Image1").ClientID %>' title="第 1 个图片">第 1 个图片</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Image2").ClientID %>' title="第 2 个图片">第 2 个图片</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Image3").ClientID %>' title="第 3 个图片">第 3 个图片</strong>）：初始为<code>16px</code>，为各图片明确预留宽度。</li>
    </ul>
</section>
</template>
</body>
</html>
