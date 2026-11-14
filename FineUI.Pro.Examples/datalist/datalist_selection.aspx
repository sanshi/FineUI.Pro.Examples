<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_selection.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_selection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>选择与清空</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="1000" ShowHeader="false" ShowBorder="false" Layout="Block" BlockConfigSpace="20"
            MarginBottom="20">
            <Items>
                <f:Panel ID="PanelSingle" runat="server" Block="12" BlockMD="4" Title="单选" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListSingle" runat="server" EnableSelect="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelMulti" runat="server" Block="12" BlockMD="4" Title="多选（按住 Ctrl 连选）" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListMulti" runat="server" EnableSelect="true" EnableMultiSelect="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelKeep" runat="server" Block="12" BlockMD="4" Title="多选（保持当前选择）" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListKeep" runat="server" EnableSelect="true" EnableMultiSelect="true" KeepCurrentSelection="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Button ID="btnRead" runat="server" Text="读取当前选择" OnClick="btnRead_Click" CssClass="marginr" />
        <f:Button ID="btnAssign" runat="server" Text="后台赋值" OnClick="btnAssign_Click" CssClass="marginr" />
        <f:Button ID="btnClear" runat="server" Text="清空选择" OnClick="btnClear_Click" />
        <br />
        <f:Label ID="labResult" runat="server" Text="请读取当前选择。" />
        <p>单选每次保留一个城市；普通多选按住 Ctrl 连选，保持当前选择模式无需按键。后台赋值替换选择，ClearSelection 清空选择后可以再次回发读取。</p>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示数据列表的单选、多选和保留选择，并由后台统一读取、赋值或清空选择。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>比较三种选择规则</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListSingle").ClientID %>' title="第 1 个数据列表">第 1 个数据列表</strong>依次点击两个城市，再在其它两组列表连续点击城市。<br />结果：单选只保留一个项目；多选按点击及按键规则更新，保持选择的一组可连续累加。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRead").ClientID %>' title="读取当前选择">读取当前选择</strong>。<br />结果：读取各组当前项值，结果文字分别显示单选和多选集合。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListSingle").ClientID %>' title="第 1 个数据列表">第 1 个数据列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListMulti").ClientID %>' title="第 2 个数据列表">第 2 个数据列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListKeep").ClientID %>' title="第 3 个数据列表">第 3 个数据列表</strong>）：初始为<code>true</code>，开启列表项目选择。</li>
        <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListMulti").ClientID %>' title="第 2 个数据列表">第 2 个数据列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListKeep").ClientID %>' title="第 3 个数据列表">第 3 个数据列表</strong>）：初始为<code>true</code>，为本页对应列表开启多选。</li>
        <li><code>KeepCurrentSelection</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListKeep").ClientID %>' title="第 3 个数据列表">第 3 个数据列表</strong>）：初始为<code>true</code>，保持选择的一组开启此属性，连续点击不清除之前的项目。</li>
        <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListSingle").ClientID %>' title="第 1 个数据列表">第 1 个数据列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListMulti").ClientID %>' title="第 2 个数据列表">第 2 个数据列表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DataListKeep").ClientID %>' title="第 3 个数据列表">第 3 个数据列表</strong>）：保存多选列表的稳定项值集合。</li>
    </ul>
</section>
</template>
</body>
</html>
