<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板"
            BodyPadding="10px" EnableCollapse="true" IconFont="_VolumeUp">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText1" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText2" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnToolbarButton" Text="工具条按钮" runat="server" ClickHandler="onToolbarButtonClick">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText Text="工具条文本四" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel ID="ContentPanel1" Title="内容面板" ShowBorder="true" Height="200px" Icon="TagBlue"
                    BodyPadding="10px" EnableCollapse="true" ShowHeader="true" AutoScroll="true"
                    runat="server">
                    可以在此放置Asp.Net控件或者<a href="http://www.w3schools.com/html/" target="_blank">HTML</a>标签。
                </f:ContentPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="检查面板的折叠状态" runat="server" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button4" Text="更新面板的标题" runat="server" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" Text="展开/折叠内容面板" runat="server" OnClick="Button3_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button5" CssClass="marginr" Text="更新工具条文本一的值" runat="server" OnClick="Button5_Click">
        </f:Button>
        <f:Button ID="Button6" Text="显示/隐藏工具条文本一" runat="server" OnClick="Button6_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button7" Text="隐藏工具栏" CssClass="marginr" runat="server" OnClick="Button7_Click">
        </f:Button>
        <f:Button ID="Button8" Text="显示工具栏" runat="server" OnClick="Button8_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button9" Text="点击修改面板图标（在三个图标之前切换）" CssClass="marginr" runat="server" OnClick="Button9_Click">
        </f:Button>
        <f:Button ID="Button10" Text="清空面板图标" CssClass="marginr" runat="server" OnClick="Button10_Click">
        </f:Button>
    </form>
    <script>

        function onToolbarButtonClick(event) {
            F.alert({
                message: '你点击了工具栏按钮',
                messageIcon: 'information'
            });
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示面板的折叠、标题与图标更新，以及工具栏项目的显示和文字更新。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>折叠和更新面板</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="展开/折叠内容面板">展开/折叠内容面板</strong>。<br />结果：后台切换内容面板的展开状态，外层面板与其它工具栏项目继续保留。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="检查面板的折叠状态">检查面板的折叠状态</strong>。<br />结果：读取目标面板当前状态并显示提示。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button4").ClientID %>' title="更新面板的标题">更新面板的标题</strong>。<br />结果：后台替换面板标题文字，面板内容继续保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>更新工具栏项目</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="更新工具条文本一的值">更新工具条文本一的值</strong>。<br />结果：后台把新的时间文字写入原工具栏文本项。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button6").ClientID %>' title="显示/隐藏工具条文本一">显示/隐藏工具条文本一</strong>。<br />结果：切换文本项显示状态，其余项目重新分配空间。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button7").ClientID %>' title="隐藏工具栏">隐藏工具栏</strong>。<br />结果：隐藏整个工具栏；点击显示工具栏可恢复。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-pic" aria-hidden="true"></i>切换图标与可信文字</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button9").ClientID %>' title="点击修改面板图标（在三个图标之前切换）">点击修改面板图标（在三个图标之前切换）</strong>。<br />结果：在本页准备的三个图标之间切换；清空图标按钮可移除当前图标。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableCollapse</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：设为<code>true</code>，开启标题栏的折叠入口。</li>
        <li><code>Title</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板">面板</strong>）：初始设为<code>面板</code>，后台更新面板标题。</li>
        <li><code>Text</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolbarText1").ClientID %>' title="第 1 个ToolbarText">第 1 个ToolbarText</strong>）：初始设为<code>工具条文本一</code>，更新对应工具栏文本项的内容。</li>
    </ul>
</section>
</template>
</body>
</html>
