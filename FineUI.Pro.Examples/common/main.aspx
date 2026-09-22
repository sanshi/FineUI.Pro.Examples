<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="FineUI.Pro.Examples.common.main" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/index.aspx;~/res/css/index.css;~/res/js/index.js;~/res/js/index-examples.js;~/code/PageBase.cs" />
    <style>
        .important {
            border-style: solid;
            border-width: 3px;
            display: inline-block;
            padding: 20px;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .weixin {
            position: fixed;
            bottom: 10px;
            right: 10px;
            text-align: center;
            border: solid 1px #ddd;
            padding: 10px;
            background-color: #efefef;
        }


        ul.list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

            ul.list li {
                margin-bottom: 5px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <h2 style="margin-top: 0;">FineUI.Pro</h2>
        .NET 企业级全栈 UI 框架
                                        
        <br />
        <h2>FineUI的使命</h2>
        创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序
                                        
        <br />
        <h2>支持的浏览器</h2>
        Chrome、Firefox、Safari、Edge

        <br />
        <h2>授权协议</h2>
        商业授权
                                            
        <br />
        <h2>相关链接</h2>
        <ul class="list">
            <li>首页：<a target="_blank" href="http://fineui.com/pro/">http://fineui.com/pro/</a>
            </li>
            <li>文档：<a target="_blank" href="http://fineui.com/pro/api/">http://fineui.com/pro/api/</a>
            </li>
            <li>更新：<a target="_blank" href="http://fineui.com/versions/">http://fineui.com/versions/</a>
            </li>
            <li>示例：<a target="_blank" href="https://fineui.com/pro/demo/">https://fineui.com/pro/demo/</a>
            </li>
            <li>JS文档：<a target="_blank" href="http://fineui.com/js/api/">http://fineui.com/js/api/</a>
            </li>
        </ul>
        <br />
        <div style="font-size: 11px;">
            <!--
            * 推荐使用 Chrome、Edge、Safari、Firefox 浏览器的最新版本，以获取最好的性能。
			
            <div style="margin: 10px 8px; opacity: 0.6;">
                IE8.0 浏览器有限支持，存在如下已知问题：
                <ul style="margin-top: 2px; padding-left: 20px;">
                    <li>相比其他现代浏览器，性能最差</li>
                    <li>不支持圆角，以及其他一些 CSS3 特性</li>
                    <li>选项卡控件不支持左侧和右侧标题栏</li>
                    <li>IFrame 交互时，可能会随机出现字体图标丢失的问题</li>
                </ul>
            </div>
			-->
        </div>
        <br />


    </form>
</body>
</html>
