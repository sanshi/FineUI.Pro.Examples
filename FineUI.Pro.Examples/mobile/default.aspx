<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FineUI.Pro.Examples.mobile._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .phonebg {
            position: absolute;
            top: 30px;
            left: 30px;
        }

        .myiframe {
            border-width: 10px;
            border-style: solid;
            border-radius: 10px;
            width: 320px;
            height: 568px;
            box-shadow: 0px 0px 8px #ccc;
            margin-bottom: 20px;
        }

        body.f-theme-darkbg .myiframe {
            box-shadow: 0px 0px 8px #333;
        }

        .qrcode {
            position: absolute;
            bottom: 0;
            left: 400px;
            margin-bottom: 20px;
        }

            .qrcode img {
                width: 180px;
                height: 180px;
                border: solid 1px #eee;
            }
            .qrcode .desc {
                font-size: 12px;
                text-align: center;
                padding-top: 5px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <div class="phonebg">
            <asp:Literal ID="litIFrame" runat="server"></asp:Literal>
            <div class="qrcode">
                <img src="../res/images/fineuipro_mobile.png?v2" />
                <div class="desc">
                    请打开手机，扫描二维码
                    <br />
                    移动示例支持 iOS、Android 系统
                </div>
            </div>
        </div>

    </form>
</body>
</html>
