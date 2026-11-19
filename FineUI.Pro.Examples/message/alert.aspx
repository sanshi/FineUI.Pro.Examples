<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert.aspx.cs" Inherits="FineUI.Pro.Examples.message.alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" runat="server" Title="创建对话框" LabelWidth="150px" BodyPadding="10px">
            <Items>
                <f:GroupPanel ID="GroupPanel2" Layout="Anchor" Title="常用属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxMessage" Required="true" ShowRedStar="true" Label="消息提示" Text="你好 FineUI！">
                        </f:TextBox>
                        <f:TextBox runat="server" ID="tbxTitle" Label="对话框标题" Text="">
                        </f:TextBox>
                        <f:CheckBox runat="server" ID="cbxEnableClose" Checked="true" Label="是否可关闭"></f:CheckBox>
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
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button Text="点击弹出对话框" runat="server" ID="btnHello" ValidateForms="SimpleForm1" OnClick="btnHello_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>

        <br />
        <br />


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过配置表单创建提示对话框，对照消息、标题、图标、大小和显示层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>按表单配置创建提示框</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMessage").ClientID %>'
                        title="消息提示">消息提示</strong>输入 <code>本次测试内容</code>，在<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxTitle").ClientID %>' title="对话框标题">对话框标题</strong>输入
                    <code>自定义标题</code>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>'
                        title="点击弹出对话框">点击弹出对话框</strong>。<br />结果：按钮回发，后台读取当前字段，新对话框显示填写的消息和标题。
                </li>
                <li>更改本页的图标、宽度或弹出位置，再次点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>'
                        title="点击弹出对话框">点击弹出对话框</strong>。<br />结果：新创建的对话框采用修改后的配置，已有对话框不作为输入字段被同步修改。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Message / Title</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxMessage").ClientID %>'
                        title="消息提示">消息提示</strong>）：从消息与标题字段取值，作为新创建对话框的正文和标题。</li>
            </ul>
        </section>
    </template>
</body>
</html>
