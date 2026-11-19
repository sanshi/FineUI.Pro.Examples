<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo_layout.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.userinfo_layout" %>

<%@ Register Src="UserInfoControl.ascx" TagName="UserInfoControl" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/UserInfoControl.ascx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:Panel runat="server" ID="Panel1" IsFluid="true" EnableCollapse="false" Height="300px" Layout="VBox" BodyPadding="10px" BoxConfigSpace="5"
            Title="面板一">
            <Items>
                <f:UserControlConnector ID="UserControlConnector1" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl1" UserName="陈萍萍" UserAge="20" UserCountry="合肥" runat="server" />
                </f:UserControlConnector>
                <f:Panel runat="server" ID="Panel3" BodyPadding="10px" BoxFlex="1" Title="面板二">
                    <Items>
                        <f:Label runat="server" Text="胡斐今年22岁，住在驻马店。">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel2" IsFluid="true" EnableCollapse="false" Height="300px" Layout="VBox" BodyPadding="10px" BoxConfigSpace="5"
            Title="面板三">
            <Items>
                <f:UserControlConnector ID="UserControlConnector2" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl2" UserName="陈萍萍" BoxFlex="1" UserAge="20" UserCountry="合肥" runat="server" />
                </f:UserControlConnector>
                <f:UserControlConnector ID="UserControlConnector3" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl3" Margin="0" BoxFlex="1" UserName="胡斐" UserAge="22" UserCountry="驻马店" runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel5" IsFluid="true" EnableCollapse="false" Height="300px" Layout="HBox" BodyPadding="10px" BoxConfigSpace="5"
            Title="面板三">
            <Items>
                <f:UserControlConnector ID="UserControlConnector5" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl6" UserName="陈萍萍" BoxFlex="1" UserAge="20" UserCountry="合肥" runat="server" />
                </f:UserControlConnector>
                <f:UserControlConnector ID="UserControlConnector6" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl7" Margin="0" BoxFlex="1" UserName="胡斐" UserAge="22" UserCountry="驻马店" runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
        <br />
        <%--<f:Panel runat="server" ID="Panel4" IsFluid="true" EnableCollapse="false"
            Height="300px" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start"
            BodyPadding="10px" BoxConfigSpace="5" Title="面板四">
            <Items>
                <f:UserControlConnector ID="UserControlConnector4" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl4" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                    <uc1:UserInfoControl ID="UserInfoControl5" UserName="胡斐" UserAge="22" UserCountry="驻马店" Margin="0" BoxFlex="1"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>--%>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把用户控件加入纵向和横向布局，分别分配各子区域的空间。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照容器中的用户资料</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="用户控件">用户控件</strong>和其它面板中的用户资料，再调整浏览器尺寸。<br />结果：用户控件按纵横布局和空间比例排列，资料和其它子面板一起布局。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="用户控件">用户控件</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>'
                        title="面板三">面板三</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板三">面板三</strong>）：初始为
                    <code>VBox</code>、<code>HBox</code>，规定容器内子控件的排列和空间分配方式。
                </li>
                <li><code>UserControlConnector</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="用户控件">用户控件</strong>）：把用户控件连接到 FineUI
                    的子项布局中；普通内容面板也可以直接嵌入用户控件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
