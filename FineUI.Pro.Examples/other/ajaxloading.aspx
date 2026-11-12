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
        <f:Button Text="回发时保持按钮可用" DisableControlBeforePostBack="false" runat="server" ID="Button7"
            OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：

        

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>分别配置回发期间的顶部提示、遮罩及按钮禁用行为。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>对照回发期间的提示</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="不显示提示信息">不显示提示信息</strong>。<br />结果：请求进行期间不显示加载提示。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="使用PageManager定义的提示信息">使用PageManager定义的提示信息</strong>。<br />结果：请求进行时显示当前按钮或页面配置的加载提示，请求结束后消失。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="默认风格提示信息">默认风格提示信息</strong>。<br />结果：请求进行时显示当前按钮或页面配置的加载提示，请求结束后消失。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="Mask风格提示信息">Mask风格提示信息</strong>。<br />结果：请求进行时显示遮罩，请求结束后撤去。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="Mask风格提示信息（显示提示文本）">Mask风格提示信息（显示提示文本）</strong>。<br />结果：请求进行时显示遮罩及提示文字，请求结束后撤去。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>' title="Mask风格提示信息（自定义提示文本）">Mask风格提示信息（自定义提示文本）</strong>。<br />结果：请求进行时显示遮罩和自定义提示文字，请求结束后撤去。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>' title="回发时保持按钮可用">回发时保持按钮可用</strong>。<br />结果：请求期间按钮保持可用，区别于默认的临时禁用。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
            <li>为了观察Ajax提示信息，所有按钮动作在后台都会睡眠1秒钟。</li>
            <li>本示例仅作演示，实际应用中请在Web.config中增加这些配置项，以便在整个项目中保持统一。</li>
        </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableAjaxLoading</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="不显示提示信息">不显示提示信息</strong>）：初始为 <code>false</code>，指定本次回发是否显示加载提示。</li>
        <li><code>AjaxLoadingType</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="默认风格提示信息">默认风格提示信息</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="Mask风格提示信息">Mask风格提示信息</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="Mask风格提示信息（显示提示文本）">Mask风格提示信息（显示提示文本）</strong>）：初始为 <code>Default</code>、<code>Mask</code>，选择顶部提示或遮罩形式的加载状态。</li>
        <li><code>ShowAjaxLoadingMaskText</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="Mask风格提示信息（显示提示文本）">Mask风格提示信息（显示提示文本）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>' title="Mask风格提示信息（自定义提示文本）">Mask风格提示信息（自定义提示文本）</strong>）：初始为 <code>true</code>，控制遮罩中是否显示加载文字。</li>
        <li><code>AjaxLoadingMaskText</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>' title="Mask风格提示信息（自定义提示文本）">Mask风格提示信息（自定义提示文本）</strong>）：初始为 <code>这是自定义提示文本</code>，指定遮罩中的自定义提示文字。</li>
        <li><code>DisableControlBeforePostback</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>' title="回发时保持按钮可用">回发时保持按钮可用</strong>）：初始为 <code>false</code>，控制发起请求后是否临时禁用当前按钮，请求结束后恢复。</li>
    </ul>
</section>
</template>
</body>
</html>
