<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_button_badge.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_button_badge" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-toolbar .f-panel-body>.f-btn {
            margin: 5px 0;
        }

        .f-toolbar.toolbar2 .f-panel-body>.f-btn {
            margin: 10px 20px 10px 0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" Height="500px" ShowBorder="true" BodyPadding="10px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" Badge="true"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二" Badge="true" BadgeType="Error"></f:Button>
                        <f:Button ID="Button3" runat="server" Text="按钮三" Badge="true" BadgeType="Success" BadgeAnimationType="Fade"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar CssClass="toolbar2" runat="server">
                    <Items>
                        <f:Button ID="Button4" runat="server" Text="按钮四" Badge="true" BadgeText="10" BadgeType="Success"></f:Button>
                        <f:Button ID="Button5" runat="server" Text="按钮五" Badge="true" BadgeText="new"></f:Button>
                        <f:Button ID="Button6" runat="server" Text="按钮六" Badge="true" BadgeText="999+" BadgeType="Success" BadgeAnimationType="Processing">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone
                    4S后的第二天与世长辞。
                </p>
            </Content>
        </f:Panel>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示工具栏按钮上的数字或文字徽标，以及不同类型和动画。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照徽标内容和动画</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>'
                        title="面板">面板</strong>中各按钮旁的徽标。<br />结果：徽标分别显示圆点、数字、<code>new</code> 或 <code>999</code>+ 等内容；本页部分徽标还具有淡入或处理中动画。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Badge</code>（本页各按钮，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="按钮一">按钮一</strong>）：初始为<code>true</code>，为本页按钮启用徽标。</li>
                <li><code>BadgeText</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="按钮四">按钮四</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>'
                        title="按钮五">按钮五</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>'
                        title="按钮六">按钮六</strong>）：各组分别设为<code>10</code>、<code>new</code>、<code>999+</code>，提供指定徽标的数字或文字。</li>
                <li><code>BadgeType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="按钮二">按钮二</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="按钮三">按钮三</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="按钮四">按钮四</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>'
                        title="按钮六">按钮六</strong>）：各组分别设为<code>Error</code>、<code>Success</code>，选择对应状态样式。</li>
                <li><code>BadgeAnimationType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="按钮三">按钮三</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>'
                        title="按钮六">按钮六</strong>）：各组分别设为<code>Fade</code>、<code>Processing</code>，为指定按钮的徽标配置动画。</li>
            </ul>
        </section>
    </template>
</body>
</html>
