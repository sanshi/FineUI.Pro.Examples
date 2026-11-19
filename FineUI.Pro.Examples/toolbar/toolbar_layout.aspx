<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_layout.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.toolbar_layout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar ID="ToolbarExample1" runat="server" Layout="HBox">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" BoxFlex="1" MarginRight="5px"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="按钮二" BoxFlex="1"></f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="Fit">
                    <Items>
                        <f:ButtonGroup runat="server" Layout="HBox">
                            <f:Button ID="Button5" runat="server" Text="按钮三" BoxFlex="1"></f:Button>
                            <f:Button ID="Button7" runat="server" Text="按钮四" BoxFlex="1"></f:Button>
                            <f:Button ID="Button9" runat="server" Text="按钮五" BoxFlex="1"></f:Button>
                        </f:ButtonGroup>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="HBox">
                    <Items>
                        <f:ButtonGroup runat="server" MarginRight="10px">
                            <f:Button ID="Button3" runat="server" Text="按钮三"></f:Button>
                            <f:Button ID="Button4" runat="server" Text="按钮四"></f:Button>
                            <f:Button ID="Button6" runat="server" Text="按钮五"></f:Button>
                        </f:ButtonGroup>
                        <f:CheckBoxList ID="CheckBoxList3" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Layout="HBox">
                    <Items>
                        <f:ButtonGroup runat="server" Width="300px" Layout="HBox" MarginRight="10px">
                            <f:Button ID="Button8" runat="server" IconFont="_Apple" Text="按钮六" BoxFlex="1"></f:Button>
                            <f:Button ID="Button10" runat="server" IconFont="_Windows" Text="按钮七" BoxFlex="1"></f:Button>
                            <f:Button ID="Button11" runat="server" Icon="Book" Text="按钮八" BoxFlex="1"></f:Button>
                        </f:ButtonGroup>
                        <f:CheckBoxList ID="CheckBoxList2" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Layout="HBox">
                    <Items>
                        <f:TextBox ID="TextBox2" runat="server" EmptyText="文本输入框" Width="100px" MarginRight="5px"></f:TextBox>
                        <f:TextBox ID="TextBox1" runat="server" EmptyText="文本输入框" Width="100px" MarginRight="10px"></f:TextBox>
                        <f:CheckBoxList ID="CheckBoxList1" runat="server" BoxFlex="1">
                            <f:CheckItem Text="可选项 1" Value="value1" />
                            <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                            <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                        </f:CheckBoxList>
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
            <p>演示工具栏中组合按钮组、输入字段和可伸展项目，通过 <code>HBox</code> 分配同一行空间。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较组合项目的宽度</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>'
                        title="面板">面板</strong>及其它工具栏中对照固定宽度输入框、按钮组和可伸展项目，再改变浏览器宽度。<br />结果：固定宽度项目保留自身尺寸，可伸展项目分配剩余宽度；按钮组内的按钮仍保持整体排列。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（本页各工具栏，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarExample1").ClientID %>' title="第 1 个工具栏">第 1
                        个工具栏</strong>）：各组分别设为<code>HBox</code>、<code>Fit</code>，本页工具栏使用 <code>HBox</code> 或指定布局组织复杂子项。</li>
                <li><code>BoxFlex</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="按钮一">按钮一</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="按钮二">按钮二</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="第 3 个按钮（按钮三）">第 3 个按钮（按钮三）</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>'
                        title="第 4 个按钮（按钮四）">第 4 个按钮（按钮四）</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button9").ClientID %>' title="第 5 个按钮（按钮五）">第 5 个按钮（按钮五）</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("CheckBoxList3").ClientID %>'
                        title="第 1 个复选框列表">第 1 个复选框列表</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button8").ClientID %>' title="按钮六">按钮六</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button10").ClientID %>'
                        title="按钮七">按钮七</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button11").ClientID %>' title="按钮八">按钮八</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("CheckBoxList2").ClientID %>'
                        title="第 2 个复选框列表">第 2 个复选框列表</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("CheckBoxList1").ClientID %>' title="第 3 个复选框列表">第 3
                        个复选框列表</strong>）：初始为<code>1</code>，为对应项目分配剩余宽度的比例。</li>
            </ul>
        </section>
    </template>
</body>
</html>
