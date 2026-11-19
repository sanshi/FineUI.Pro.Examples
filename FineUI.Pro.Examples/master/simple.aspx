<%@ Page Title="" Language="C#" MasterPageFile="~/master/Simple.Master" AutoEventWireup="true" CodeBehind="simple.aspx.cs" Inherits="FineUI.Pro.Examples.master.simple" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCPH" runat="server">
    <meta name="sourcefiles" content="~/master/Simple.Master" />
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让母版页的导航树与内容页交互，并从内容页调用自身脚本。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-link" aria-hidden="true"></i>母版与内容页分别处理</h3>
            <ul>
                <li>点击母版左侧树的一个节点。<br />结果：内容页的结果标签显示所点母版树节点的文字。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="点击调用内容页中的脚本">点击调用内容页中的脚本</strong>。<br />结果：执行内容页具名函数，显示对应通知。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Master / ClientID</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="位于内容页中">位于内容页中</strong>）：内容页通过母版提供的接口接收节点事件，脚本使用内容控件的真实客户端标识。</li>
            </ul>
        </section>
    </template>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Panel ID="Panel1" Title="位于内容页中" BoxFlex="1" Margin="0" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="true">
        <Items>
            <f:Label ID="labResult" runat="server" Text="左侧树尚未选中">
            </f:Label>
            <f:Button runat="server" ID="Button1" Text="按钮的初始文本，在脚本中修改" ClickHandler="onButton1Click"></f:Button>
        </Items>
    </f:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptCPH" runat="server">
    <script>
        function onButton1Click(event) {
            F.notify({
                message: '你点击了内容页中的按钮',
                messageIcon: 'information',
                target: '_top',
                header: false,
                displayMilliseconds: 2000,
                positionX: 'center',
                positionY: 'center'
            });
        }

        var button1ClientID = '<%= Button1.ClientID %>';

        F.ready(function() {

            // 修改按钮的初始文本
            F(button1ClientID).setText('点击调用内容页中的脚本');

        });

    </script>
</asp:Content>
