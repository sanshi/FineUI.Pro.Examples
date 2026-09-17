<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading_css.aspx.cs" Inherits="FineUI.Pro.Examples.common.loading_css" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        body.f-body {
            padding: 10px;
        }

        ul.main {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

            ul.main li {
                display: inline-block;
                margin: 5px;
                border-width: 0;
                padding: 10px;
                border-radius: 10px;
                text-align: center;
                cursor: pointer;
            }

                ul.main li.f-state-hover,
                ul.main li.f-state-active {
                    border-style: solid;
                    border-width: 3px;
                    padding: 7px;
                }


                ul.main li .title {
                    text-align: center;
                    font-size: 13px;
                    margin-top: 10px;
                }

                ul.main li.f-state-active .title {
                    font-weight: bold;
                }

                ul.main li > .f-widget-content {
                    padding: 30px;
                    display: inline-block;
                    border-radius: 5px;
                    box-shadow: 2px 2px 5px 0 rgba(0, 0, 0, 0.2);
                }

                ul.main li.f-state-hover > .f-widget-content,
                ul.main li.f-state-active > .f-widget-content {
                    box-shadow: none;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <asp:Literal EnableViewState="false" runat="server" ID="litIcons"></asp:Literal>
    </form>

    <script>
        F.ready(function () {
            // 选择主题窗口
            $('ul.main li').hover(function () {
                $(this).addClass('f-state-hover');
            }, function () {
                $(this).removeClass('f-state-hover');
            }).click(function () {
                var loadingNumber = $(this).find('.title').text();

                F.removeCookie('Loading');
                F.cookie('Loading_CSS', loadingNumber, {
                    expires: 100  // 单位：天
                });

                top.window.location.reload();
            });


            // 初始化
            var loadingNumber = F.cookie('Loading_CSS');
            if (!loadingNumber) {
                loadingNumber = '1';
            }
            $('ul.main li').each(function () {
                var cnode = $(this);
                if (cnode.find('.title').text() === loadingNumber) {
                    cnode.addClass('f-state-active');
                } else {
                    cnode.removeClass('f-state-active');
                }
            });
        });
    </script>

</body>
</html>
