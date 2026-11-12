<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.tabstrip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" ShowBorder="true" TabPosition="Top"
            EnableTabCloseMenu="false" ActiveTabIndex="1" runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" Layout="Fit" runat="server">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" ShowBorder="false"
                            ShowHeader="false" Title="SimpleForm1" LabelWidth="120px" runat="server">
                            <Items>
                                <f:Label ID="Label1" Label="文本" Text="三生石上" CssClass="highlight" runat="server" />
                                <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                                <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DatePicker ID="DatePicker1" runat="server" Label="日期选择器"
                                    Required="true" ShowRedStar="true">
                                </f:DatePicker>
                                <f:TextArea ID="TextArea2" Label="多行文本输入框" runat="server" Required="true" Height="100px" ShowRedStar="true" />
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:Tab>
                <f:Tab TitleRawHtml="<span class='highlight'>标签二（高亮）</span>" BodyPadding="10px"
                    runat="server">
                    <Items>
                        <f:Button ID="Button1" Text="点击显示提示对话框" OnClick="Button1_Click" runat="server">
                        </f:Button>
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" CssClass="highlight" Text="第三个标签的内容（已经应用了高亮样式）" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="Button2" CssClass="marginr" ValidateForms="SimpleForm1"
            Text="验证第一个标签中的表单" runat="server">
        </f:Button>
        <f:Button ID="Button3" Text="打开下一个标签" OnClick="Button3_Click" runat="server">
        </f:Button>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示切换选项卡、显示各自内容，以及通过按钮切页和验证标签内的表单。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>切换内容</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>点击<code>标签一</code>和<code>标签二</code>。<br />结果：浏览器切换内容区，各标签中的控件和已输入内容分别保留。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="打开下一个标签">打开下一个标签</strong>。<br />结果：激活下一个可用标签，并显示它的内容。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>验证标签内表单</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="验证第一个标签中的表单">验证第一个标签中的表单</strong>。<br />结果：先检查第一个标签内的必填字段；未填完整时显示验证错误，通过后才执行本页配置的处理。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ActiveTabIndex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：指定首次激活的标签，索引从 <code>0</code> 开始。 本页使用<code>1</code>。</li>
        <li><code>TabPosition</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：指定标签标题栏所在边缘，本页位于顶部。 本页使用<code>Top</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
