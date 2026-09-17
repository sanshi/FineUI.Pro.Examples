<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="FineUI.Pro.Examples.common.loading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        body.f-body {
            padding: 10px;
        }

        ul.loading {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

            ul.loading li {
                display: inline-block;
                margin: 5px;
                text-align: center;
                border-style: solid;
                border-width: 0;
                padding: 11px 6px;
                width: 150px;
                cursor: pointer;
            }

                ul.loading li.hover,
                ul.loading li.active {
                    border-width: 3px;
                    padding: 8px 3px;
                }

                ul.loading li .title {
                    margin-top: 10px;
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
            $('ul.loading li').hover(function () {
                $(this).addClass('hover');
            }, function () {
                $(this).removeClass('hover');
            }).click(function () {
                var loadingNumber = $(this).find('.title').text();

                // 禁用页面加载动画（CSS） + 启用GIF加载动画
                F.removeCookie('Loading_CSS');
                F.cookie('Loading', loadingNumber, {
                    expires: 100  // 单位：天
                });

                top.window.location.reload();
            });


            // 初始化
            var loadingNumber = F.cookie('Loading');
            if (!loadingNumber) {
                loadingNumber = '1';
            }
            $('ul.loading li').each(function () {
                var cnode = $(this);
                if (cnode.find('.title').text() === loadingNumber) {
                    cnode.addClass('active');
                } else {
                    cnode.removeClass('active');
                }
            });
        });
    </script>

</body>
</html>
