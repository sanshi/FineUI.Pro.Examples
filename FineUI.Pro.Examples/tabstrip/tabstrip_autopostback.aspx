<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_autopostback.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" OnTabIndexChanged="TabStrip1_TabIndexChanged" ShowBorder="true" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="10px" Layout="Fit" runat="server">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" ShowBorder="false" ShowHeader="false" Title="SimpleForm1" runat="server">
                            <Items>
                                <f:Label ID="Label1" CssClass="highlight" Label="文本" Text="初始文本" runat="server" />
                                <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                                <f:TextBox ID="TextBox1" Label="文本框" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DatePicker ID="DatePicker1" runat="server" Label="日期选择器" Text="2008-05-09" Required="true" ShowRedStar="true">
                                </f:DatePicker>
                                <f:TextArea ID="TextArea2" Label="多行文本框" runat="server" Required="true" ShowRedStar="true" />
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label2" CssClass="highlight" Text="初始文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label3" CssClass="highlight" Text="初始文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="Button2" CssClass="marginr" ValidateForms="SimpleForm1" Text="验证第一个标签中的表单" runat="server">
        </f:Button>
        <f:Button ID="Button3" Text="选中下一个标签" OnClick="Button3_Click" runat="server">
        </f:Button>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示切换选项卡时回发，并由后台更新新激活标签中的内容。</p>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换后读取当前标签</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>从<code>标签二</code>切到<code>标签三</code>。<br />结果：切换事件回发，后台读取当前标签位置，并把回发时间写入对应内容标签。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnTabIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：激活标签改变时处理当前标签。</li>
        <li><code>ActiveTabIndex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：初始设为<code>1</code>，后台据此区分当前激活的标签，索引从 <code>0</code> 开始。</li>
    </ul>
</section>
</template>
</body>
</html>
