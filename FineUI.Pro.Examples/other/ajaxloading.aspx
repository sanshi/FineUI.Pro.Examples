<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajaxloading.aspx.cs" Inherits="FineUI.Pro.Examples.other.ajaxloading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AjaxLoadingType="Mask" runat="server" />
        <f:Button Text="不显示提示信息" EnableAjaxLoading="false" runat="server" ID="Button1"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="使用PageManager定义的提示信息" runat="server" ID="Button2" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="默认风格提示信息" AjaxLoadingType="Default" runat="server" ID="Button3"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="Mask风格提示信息" AjaxLoadingType="Mask" runat="server" ID="Button4"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="Mask风格提示信息（显示提示文本）" AjaxLoadingType="Mask" ShowAjaxLoadingMaskText="true" runat="server" ID="Button5"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="Mask风格提示信息（自定义提示文本）" AjaxLoadingType="Mask" ShowAjaxLoadingMaskText="true" AjaxLoadingMaskText="这是自定义提示文本" runat="server" ID="Button6"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：
        <ul>
            <li>为了观察Ajax提示信息，所有按钮动作在后台都会睡眠1秒钟。</li>
            <li>本示例仅作演示，实际应用中请在Web.config中增加这些配置项，以便在整个项目中保持统一。</li>
        </ul>
        

    </form>
</body>
</html>
