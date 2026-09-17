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
        <br />
        <br />
        注：在 F.ready 中注册图片的点击事件。
    </form>
    <script>

        var image1ClientID = '<%= Image1.ClientID %>';

        F.ready(function () {

            F(image1ClientID).el.on('click', function (event) {
                F.alert('当前图片的地址是：' + $(this).find('img').attr('src'));
            });

        });

    </script>
</body>
</html>
