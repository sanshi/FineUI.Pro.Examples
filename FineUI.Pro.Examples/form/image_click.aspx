<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="image_click.aspx.cs" Inherits="FineUI.Pro.Examples.form.image_click" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .myimage img {
            width: 36px;
            height: 36px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Image ID="Image1" runat="server" CssClass="myimage" ImageUrl="~/res/icon/cake.png">
        </f:Image>
        <br />
        <f:Button runat="server" Text="改变图片" ID="Button1" OnClick="Button1_Click">
        </f:Button>


    </form>
    <script>

        var image1ClientID = '<%= Image1.ClientID %>';

        F.ready(function () {

            F(image1ClientID).el.on('click', function (event) {
                F.alert('当前图片的地址是：' + $(this).find('img').attr('src'));
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示图片点击提示，以及更换图片后继续使用同一个点击处理器。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>点击与切换图片</h3>
            <ol>
                <li>
                    点击页面中的图片。<br />
                    结果：客户端图片点击处理显示提示。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>" title="改变图片">改变图片</strong>，再点击图片。<br />
                    结果：回发后，后台在蛋糕和地球图片之间切换；图片点击行为仍然可用。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：在 <code>F.ready</code> 中注册图片的点击事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnClick</code>（<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>" title="改变图片">改变图片</strong>）：<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>" title="改变图片">改变图片</strong>按钮回发更新图片地址。</li>
            </ul>
        </section>
    </template>
</body>
</html>
