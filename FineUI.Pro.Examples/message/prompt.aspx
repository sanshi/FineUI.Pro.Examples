<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prompt.aspx.cs" Inherits="FineUI.Pro.Examples.message.prompt" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" runat="server" Title="创建输入对话框" LabelWidth="150px" BodyPadding="10px">
            <Items>
                <f:GroupPanel ID="GroupPanel2" Layout="Anchor" Title="常用属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxMessage" Required="true" ShowRedStar="true" Label="消息提示" Text="请输入你的住址？">
                        </f:TextBox>
                        <f:TextBox runat="server" ID="tbxDefaultValue" Label="输入框缺省值" Text="这是缺省地址">
                        </f:TextBox>
                        <f:TextBox runat="server" ID="tbxTitle" Label="对话框标题" Text="请输入">
                        </f:TextBox>
                        <f:CheckBox runat="server" ID="cbxEnableClose" Checked="true" Label="是否可关闭"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxRequired" Checked="false" Label="是否必填项"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxIsMultiLine" Checked="true" OnCheckedChanged="cbxIsMultiLine_CheckedChanged" Label="是否多行输入框">
                        </f:CheckBox>
                        <f:NumberBox runat="server" ID="nbMultiLineHeight" NoDecimal="true" NoNegative="true" Label="多行输入框高度" MinValue="80" MaxValue="300"
                            Text="100"></f:NumberBox>
                        <f:CheckBox runat="server" ID="cbxIsPassword" Checked="false" Hidden="true" Label="是否密码输入框"></f:CheckBox>
                        <f:RadioButtonList ID="rblMessageBoxIcon" Label="消息图标" ColumnNumber="3" runat="server">
                            <f:RadioItem Value="None" Text="无图标" Selected="true" />
                            <f:RadioItem Value="Information" Text="消息" />
                            <f:RadioItem Value="Warning" Text="警告" />
                            <f:RadioItem Value="Question" Text="问题" />
                            <f:RadioItem Value="Error" Text="错误" />
                            <f:RadioItem Value="Success" Text="成功" />
                        </f:RadioButtonList>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel ID="GroupPanel1" Layout="Anchor" Title="其它属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxID" Label="对话框ID"></f:TextBox>
                        <f:NumberBox runat="server" ID="nbWidth" NoDecimal="true" NoNegative="true" Label="对话框宽度" MinValue="200" MaxValue="900"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMinWidth" NoDecimal="true" NoNegative="true" Label="对话框最小宽度"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMaxWidth" NoDecimal="true" NoNegative="true" Label="对话框最大宽度"></f:NumberBox>
                        <f:RadioButtonList ID="rblTarget" Label="弹出位置" ColumnNumber="3" runat="server">
                            <f:RadioItem Value="Self" Text="当前页面" Selected="true" />
                            <f:RadioItem Value="Parent" Text="父页面" />
                            <f:RadioItem Value="Top" Text="顶层页面" />
                        </f:RadioButtonList>
                    </Items>
                </f:GroupPanel>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button Text="点击弹出输入对话框" runat="server" ID="btnHello" ValidateForms="SimpleForm1" OnClick="btnHello_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>

        <br />
        <br />


    </form>
    <script>
        function promptOKCallback(message) {
            var encodedMessage = F.htmlEncode(message).replace(/\r\n/ig, '\n').replace(/\r/ig, '\n').replace(/\n/ig, '<br/>');
            F.notify(F.rawHtml('你输入的住址是：' + encodedMessage));
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>通过配置表单创建输入对话框，对照多行、单行、必填和回调取值。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>按表单配置创建输入框</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMessage").ClientID %>' title="消息提示">消息提示</strong>输入 <code>本次测试内容</code>，在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxTitle").ClientID %>' title="对话框标题">对话框标题</strong>输入 <code>自定义标题</code>，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>' title="点击弹出输入对话框">点击弹出输入对话框</strong>。<br />结果：按钮回发，后台读取当前字段，新对话框显示填写的消息和标题。</li>
        <li>更改本页的图标、宽度或弹出位置，再次点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>' title="点击弹出输入对话框">点击弹出输入对话框</strong>。<br />结果：新创建的对话框采用修改后的配置，已有对话框不作为输入字段被同步修改。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换输入方式并返回内容</h3>
    <ul>
        <li>切换<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxIsMultiLine").ClientID %>' title="是否多行输入框">是否多行输入框</strong>。<br />结果：多行模式显示高度配置；单行模式显示密码选项。</li>
        <li>填写<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxDefaultValue").ClientID %>' title="输入框缺省值">输入框缺省值</strong>并打开输入框，在弹出的输入区修改内容后点击确定。<br />结果：输入框先显示缺省值，确定后通过客户端回调把输入内容显示在通知中；取消不提交该内容。</li>
        <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxRequired").ClientID %>' title="是否必填项">是否必填项</strong>后重新打开，清空弹出的输入内容并点击确定。<br />结果：必填验证阻止空内容确认，保留输入框供继续填写。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Message / Title</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMessage").ClientID %>' title="消息提示">消息提示</strong>）：从消息与标题字段取值，作为新创建对话框的正文和标题。</li>
        <li><code>Required / MultiLine / DefaultValue</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>' title="点击弹出输入对话框">点击弹出输入对话框</strong>）：分别控制弹出输入区的必填、多行模式和初始输入内容。</li>
    </ul>
</section>
</template>
</body>
</html>
