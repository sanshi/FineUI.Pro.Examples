<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="umeditor_tabstrip.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.aspnet.umeditor_tabstrip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" TabPosition="Top" EnableTabCloseMenu="false" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="选项卡一" BodyPadding="10px" Layout="Anchor" runat="server">
                    <Items>
                        <f:HtmlEditor runat="server" Label="编辑器一" ID="HtmlEditor1" Editor="UMEditor" BasePath="~/res/third-party/umeditor/" ToolbarSet="Full"
                            Height="300px">
                        </f:HtmlEditor>
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="选项卡二" BodyPadding="10px" Layout="Fit" runat="server">
                    <Items>
                        <f:HtmlEditor runat="server" Label="编辑器二" ID="HtmlEditor2" Editor="UMEditor" BasePath="~/res/third-party/umeditor/" ToolbarSet="Basic">
                        </f:HtmlEditor>
                    </Items>
                </f:Tab>
            </Tabs>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom">
                    <Items>
                        <f:Button runat="server" Text="获取编辑器的值" ID="Button1" OnClick="Button1_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:TabStrip>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把两个 UMEditor 放在不同选项卡，验证切换、布局和内容相互独立。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>切换后保持各自内容</h3>
            <ol>
                <li>切换到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>'
                        title="选项卡二">选项卡二</strong>，在<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>' title="编辑器二">编辑器二</strong>追加
                    <code>第二页内容</code>。<br />结果：<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>'
                        title="编辑器二">编辑器二</strong>显示并接受输入；填充布局使用当前标签的可用区域。
                </li>
                <li>切回选项卡一，再切到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>'
                        title="选项卡二">选项卡二</strong>。<br />结果：两个编辑器分别保留自己的内容，切换不重新清空。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>' title="选项卡一">选项卡一</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>'
                        title="选项卡二">选项卡二</strong>）：初始为 <code>Anchor</code>、<code>Fit</code>，规定容器内子控件的排列和空间分配方式。</li>
                <li><code>ToolbarSet</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor1").ClientID %>' title="编辑器一">编辑器一</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("HtmlEditor2").ClientID %>'
                        title="编辑器二">编辑器二</strong>）：初始为 <code>Full</code>、<code>Basic</code>，选择编辑器的工具栏组合。</li>
            </ul>
        </section>
    </template>
</body>
</html>
