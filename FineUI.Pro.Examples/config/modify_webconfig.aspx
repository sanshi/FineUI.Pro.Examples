<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modify_webconfig.aspx.cs" Inherits="FineUI.Pro.Examples.config.modify_webconfig" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ol li,
        ul li {
            margin-bottom: 5px;
        }

        pre {
            border: none;
            margin: 0;
            padding: 10px 5px;
            font-family: Consolas, Courier New, monospace;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server"></f:PageManager>
        <div>
            在开发项目之前请配置好 Web.config：
        </div>
        <ol>
            <li><strong>设置 configuration 配置节：</strong>
                <br />
                <pre>
    &lt;configSections&gt;
        &lt;section name="FineUI.Pro" type="FineUI.Pro.ConfigSection, FineUI.Pro"/&gt;
    &lt;/configSections&gt;

    &lt;!-- 可用的配置项（这里列的都是默认值）:
            Theme="Default" 
            Language="zh_CN" 
            DebugMode="false"
            FormMessageTarget="Qtip" 
            FormOffsetRight="0" 
            FormLabelWidth="100" 
            FormLabelSeparator="：" 
            FormLabelAlign="Left" 
            FormRedStarPosition="AfterText"  
            EnableAjax="true" 
            AjaxTimeout="120" 
            EnableAjaxLoading="true" 
            AjaxLoadingType="Default" 
            AjaxLoadingText="" 
            ShowAjaxLoadingMaskText=false
            AjaxLoadingMaskText="" 
            CustomTheme="" 
            IconBasePath="~/res/icon/"
            CustomThemeBasePath="~/res/themes/"
            DisplayMode="Normal"
            MobileAdaption="false"
            EnableAnimation="false"
    --&gt;
    &lt;FineUI.Pro DebugMode="false" /&gt;
            </pre>
                FineUI.Pro 配置节中的参数：
            <br />
                <ul>
                    <li>Theme: 样式主题，内置 10 种主题（默认值：Pure_Black）
                        <ul style="padding-top: 8px;">
                            <li>
                                Pure 主题：Pure_Black, Pure_Green, Pure_Blue, Pure_Purple, Pure_Orange
                            </li>
                            <li>
                                jQueryUI 主题：Cupertino, Start, Dark_Hive, Flick, South_Street
                            </li>
                        </ul>
                    </li>
                    <li>CustomTheme: 自定义样式主题（custom_default，源代码位于官网示例 /res/themes/ 目录）</li>
                    <li>Language: 控件语言（en/zh_CN/zh_TW，默认值：zh_CN）</li>
                    <li>FormMessageTarget: 表单字段错误提示信息的显示位置（Title/Side/Qtip，默认值：Side）</li>
                    <li>FormLabelWidth: 表单字段标签的宽度（默认值：100px）</li>
                    <li>FormLabelAlign: 表单字段标签的位置（Left/Right/Top，默认值：Left）</li>
                    <li>FormRedStarPosition: 表单字段红色星号的位置（AfterText/BeforeText/AfterSeparator，默认值：AfterText）</li>
                    <li>FormLabelSeparator: 表单字段标签与内容的分隔符（默认值："："）</li>
                    <li>EnableAjax: 是否启用AJAX（默认值：true）</li>
                    <li>AjaxTimeout: Ajax超时时间（单位：秒，默认值：120s）</li>
                    <li>DebugMode: 是否开发模式，启用时格式化页面输出的JavaScript代码，便于调试（默认值：false）</li>
                    <li>EnableAjaxLoading: 是否启用Ajax提示（默认值：true）</li>
                    <li>AjaxLoadingType: Ajax提示类型，默认在页面顶部显示黄色提示框（Default/Mask，默认值：Default）</li>
                    <li>DisplayMode: 显示模式（Compact/Small/Normal/Large/LargeSpace，默认值：Normal）</li>
                    <li>MobileAdaption: 是否启用移动浏览器自适应（默认值：false）</li>
                    <li>EnableAnimation: 是否启用动画（Chrome，Firefox，Edge，Safari浏览器支持动画）（默认值：false）</li>
                </ul>
                <br />
                <br />
                <div style="margin-bottom: 5px;">
                    注 1：移动端（Android,iOS）网站需要启用DisplayMode和MobileAdaption属性（Web.config）：
					<br/>
					<br/>
					&lt;FineUI.Pro DisplayMode="Large" MobileAdaption="true" EnableAnimation="true" /&gt;
                </div>
				<br />
                <%--<div style="margin-bottom: 5px;">
                    注 2：IE8需要启用JSLibrary属性（Web.config）：
					<br/>
					<br/>
					&lt;FineUI.Pro JSLibrary="JQv1" /&gt;
                </div>
                <br />
                <br />--%>
            </li>
            <li><strong>设置 system.web 配置节：</strong>
                <pre>
&lt;system.web&gt;
    &lt;pages&gt;
      &lt;controls&gt;
        &lt;add assembly="FineUI.Pro" namespace="FineUI.Pro" tagPrefix="f"/&gt;
      &lt;/controls&gt;
    &lt;/pages&gt;
    
    &lt;httpModules&gt;
      &lt;add name="FineUI.ProScriptModule" type="FineUI.Pro.ScriptModule, FineUI.Pro"/&gt;
    &lt;/httpModules&gt;

    &lt;httpHandlers&gt;
      &lt;add verb="GET" path="res.axd" type="FineUI.Pro.ResourceHandler, FineUI.Pro" validate="false"/&gt;
    &lt;/httpHandlers&gt;
&lt;system.web&gt;
        </pre>
            </li>
            <li><strong>完成。</strong></li>
        </ol>
        <br />
        <hr />
        <br />
        <div style="font-weight: bold;">
            常见问题：
        </div>
        <ul>
            <li>
                <strong>Net4.0以上的项目，一定要为Web.config中&lt;page&gt;标签添加controlRenderingCompatibilityVersion和clientIDMode两个属性。
                </strong>
                <pre>
&lt;pages controlRenderingCompatibilityVersion="4.0" clientIDMode="AutoID"&gt;
    &lt;controls&gt;
    &lt;add assembly="FineUI.Pro" namespace="FineUI.Pro" tagPrefix="f" /&gt;
    &lt;/controls&gt;
&lt;/pages&gt;
</pre>
                <br />
            </li>
            <li>
                <strong>IIS集成模式（VS2013、VS2015的默认设置）</strong>
                <br />
                <br />
                IIS集成模式下，需要将 httpModules 和 httpHandlers 从 system.web 中删除，并更新 system.webServer，如下所示：
                <pre>
&lt;system.webServer&gt;
    &lt;modules&gt;
        &lt;add name="FineUI.ProScriptModule" type="FineUI.Pro.ScriptModule, FineUI.Pro"/&gt;
    &lt;/modules&gt;
    &lt;handlers&gt;
        &lt;add name="FineUI.ProResourceHandler" verb="GET" path="res.axd" type="FineUI.Pro.ResourceHandler, FineUI.Pro"/&gt;
    &lt;/handlers&gt;
&lt;/system.webServer&gt;
                </pre>
                更多详细信息，请阅读官网论坛的<a href="http://fineui.com/bbs/forum.php?mod=viewthread&tid=655">常见问题</a>。
                <br />
                <br />
            </li>
            <li>
                <strong>如果项目中使用了表单认证，需要添加 res.axd 的例外</strong>
                <br />
                <br />
                如果在 system.web 下有类似如下的表单验证配置：
                <pre>
&lt;system.web&gt;
    &lt;authentication mode="Forms"&gt;
        &lt;forms name=".ASPXFORMSAUTH" loginUrl="~/default.aspx" timeout="120" defaultUrl="~/main.aspx" protection="All" path="/"/&gt;
    &lt;/authentication&gt;
    &lt;authorization&gt;
        &lt;deny users="?"/&gt;
    &lt;/authorization&gt;
&lt;/system.web&gt;</pre>
                <br />
                则需要添加 res.axd 例外，否则所有的图标字体都显示不了：
                <pre>
&lt;/system.web&gt;

&lt;location path="res.axd"&gt;
    &lt;system.web&gt;
        &lt;authorization&gt;
            &lt;allow users ="*" /&gt;
        &lt;/authorization&gt;
    &lt;/system.web&gt;
&lt;/location&gt;</pre>
                <br />
				同样，静态资源目录也无需表单认证，添加例外如下：
				<pre>
&lt;location path="res"&gt;
    &lt;system.web&gt;
      &lt;authorization&gt;
        &lt;allow users="*" /&gt;
      &lt;/authorization&gt;
    &lt;/system.web&gt;
&lt;/location&gt;</pre>
<br />
            </li>
            <li>
                <strong>
					使用 Visual Studio 的 NuGet 下载最新的 JSON 库
                </strong>
                <br />
                <br />
                FineUI.Pro.dll只有一个版本，无论你的项目是2.0、3.5、4.0、4.5，都只需要引用同一个FineUI.Pro.dll即可。
                <br />
                <br />
                Newtonsoft.Json.dll 在不同的 .Net 版本有不同的 DLL，建议您使用 Visual Studio 的 NuGet 工具下载最新的 JSON 库：
                <br />
                <br />
                <img src="../res/images/json.net.1.png" alt="Json.NET" />
                <br />
                <br />
                <img src="../res/images/json.net.2.png" alt="Json.NET" />
                <br />
                <br />
                注：使用 NuGet 安装时，VS 会自动修改 Web.config 文件并增加相关信息，无需手工配置！
            </li>
        </ul>

        <hr />
        <br />
        <div style="font-weight: bold; color: Red;">
            更多常见问题：<a href="http://fineui.com/bbs/forum.php?mod=viewthread&tid=655" target="_blank">http://fineui.com/bbs/forum.php?mod=viewthread&tid=655</a>
        </div>
        <br />

        <div style="font-weight: bold; color: Red;">
            从开源版升级到FineUI.Pro，请按照升级指南一步一步操作：<a href="http://fineui.com/pro/upgrade.html" target="_blank">http://fineui.com/pro/upgrade.html</a>
        </div>
        <br />
        <br />
    </form>
</body>
</html>
