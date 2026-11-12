<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anchor.aspx.cs" Inherits="FineUI.Pro.Examples.layout.anchor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel3" IsFluid="true" Title="面板一（Height=300px)" runat="server" Height="300px" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true">
            <Items>
                <f:Panel ID="Panel1" runat="server" ShowBorder="true" Margin="0 0 5 0" BodyPadding="10px" ShowHeader="false" Title="面板">
                    <Items>
                        <f:Label ID="Label5" Text="Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Form ID="Form3" runat="server" ShowBorder="true" BodyPadding="10px" ShowHeader="false" Title="表单">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:Label ID="Label2" Label="文本" Text="文本内容" runat="server">
                                </f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox2" Label="输入框" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button2" Text="按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="300px" ShowBorder="true" EnableCollapse="false" BodyPadding="10px" Layout="Anchor"
            ShowHeader="true" Title="面板二（Height=300px Width=750px Layout=Anchor）">
            <Items>
                <f:Panel ID="Panel4" AnchorValue="60% 30%" runat="server" Margin="0 0 5 0" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" Text="AnchorValue=60% 30% Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Form ID="Form2" AnchorValue="100% 70%" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:Label ID="Label1" Text="AnchorValue=100% 70%" runat="server">
                                </f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox1" Label="输入框" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button7" Text="按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel5" IsFluid="true" Title="面板三（Width=750px）" runat="server" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true">
            <Items>
                <f:Form ID="Form4" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox3" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button6" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel6" ShowBorder="true" ShowHeader="false" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <f:Button ID="Button4" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button5" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid1" Title="表格" PageSize="3" ShowBorder="false" ShowHeader="false" runat="server"
                            EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                                    RendererFunction="renderMajor" />
                                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel7" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" ShowBorder="true" ShowHeader="true" Height="350px"
            Title="面板四（Width=750px Height=350px Layout=Anchor）" Layout="Anchor">
            <Items>
                <f:Form ID="Form5" ShowBorder="false" AnchorValue="100%" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox5" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox8" Label="所在班级" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox6" Label="所在年级" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button11" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel8" ShowBorder="true" ShowHeader="false" AnchorValue="100% -72" Layout="Fit" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="Button8" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button9" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid2" Title="Grid2" PageSize="3" ShowBorder="false" ShowHeader="false" runat="server"
                            EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                                    RendererFunction="renderMajor" />
                                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <br />
        <strong>【推荐】</strong>使用VBox布局实现与上例相同的界面：
        <br />
        <hr />
        <br />
        <f:Panel ID="Panel9" IsFluid="true" runat="server" Layout="VBox" EnableCollapse="false" BodyPadding="10px" BoxConfigSpace="0" ShowBorder="true"
            ShowHeader="true" Height="350px" Title="面板五（Layout=VBox BoxConfigSpace=0）">
            <Items>
                <f:Form ID="Form6" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox4" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox7" Label="所在班级" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox9" Label="所在年级" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button10" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel10" ShowBorder="true" ShowHeader="false" BoxFlex="1" Layout="Fit" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar3" runat="server">
                            <Items>
                                <f:Button ID="Button12" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button13" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid3" Title="Grid3" PageSize="3" ShowBorder="false" ShowHeader="false" runat="server"
                            EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                                    RendererFunction="renderMajor" />
                                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示用锚点比例让字段随父容器宽高变化。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="面板一（Height=300px)">面板一（Height=300px)</strong>中缩小和放大浏览器，比较字段与容器边缘的距离。<br />结果：设置锚点的字段按对应比例伸缩，固定尺寸项目保持自身尺寸。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板二（Height=300px Width=750px Layout=Anchor）">面板二（Height=300px Width=750px Layout=Anchor）</strong>）：父容器使用本页对应的布局方式，决定其直接子项的排列。 本页各组分别使用<code>Anchor</code>、<code>Fit</code>、<code>VBox</code>。</li>
        <li><code>AnchorValue</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="第 4 个面板">第 4 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Form2").ClientID %>' title="第 2 个表单">第 2 个表单</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Form5").ClientID %>' title="第 4 个表单">第 4 个表单</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel8").ClientID %>' title="第 8 个面板">第 8 个面板</strong>）：子项按本页锚点比例随父容器尺寸变化。 本页各组分别使用<code>60% 30%</code>、<code>100% 70%</code>、<code>100%</code>、<code>100% -72</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
