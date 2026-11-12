<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_dynamic2.aspx.cs"
    Inherits="FineUI.Pro.Examples.toolbar.menu_dynamic2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" ClientIDMode="Static" IsFluid="true" ShowBorder="true" Title="面板" BodyPadding="10px" Height="300px"  EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" ClickHandler="onOpenNewWindowClick"
                            Text="点击打开新窗体（内联按钮）" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script type="text/javascript">

        function onOpenNewWindowClick(event) {
            window.open('https://fineui.com/pro/demo/', '_blank');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示向工具栏追加按钮，并读取包含新增项的当前项目数量。</p>
    <h3><i class="f-iconfont f-iconfont-edit" aria-hidden="true"></i>读取追加后的项目数</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="面板">面板</strong>点击文字为获取工具栏中的按钮数的按钮。<br />结果：当前提示显示工具栏实际项目数量；追加按钮与原有项目都属于同一集合。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Items</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar1").ClientID %>' title="工具栏">工具栏</strong>）：本页工具栏包含原有项目和追加的按钮。</li>
        <li><code>Items.Add()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar1").ClientID %>' title="工具栏">工具栏</strong>）：把新按钮加入已有工具栏，不替换原项目。</li>
    </ul>
</section>
</template>
</body>
</html>
