<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="column_scrollbar.aspx.cs" Inherits="FineUI.Pro.Examples.layout.column_scrollbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" AutoScroll="true" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" Layout="Column" ShowHeader="true" Title="面板（高度变小时可能出现纵向滚动条）">
            <Items>
                <f:Panel ID="Panel24" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel25" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel26" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel27" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel28" ColumnWidth="33%" runat="server"
                    ShowBorder="false" ShowHeader="false" Margin="0 5px 0 0">
                    <Items>
                        <f:Panel ID="Panel29" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel30" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel31" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel32" ColumnWidth="34%" runat="server"
                    ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Panel ID="Panel33" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel34" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true" MarginBottom="5px">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                        <f:Panel ID="Panel35" runat="server"
                            BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                            <Content>
                                我的面板<br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </Content>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在列布局中为较多内容提供纵向滚动。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（高度变小时可能出现纵向滚动条）">面板（高度变小时可能出现纵向滚动条）</strong>中缩小可用高度，再向下滚动列布局内容。<br />结果：列宽规则保持不变，超出高度的内容可滚动查看。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（高度变小时可能出现纵向滚动条）">面板（高度变小时可能出现纵向滚动条）</strong>）：父容器使用本页对应的布局方式，决定其直接子项的排列。 本页使用<code>Column</code>。</li>
        <li><code>ColumnWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel24").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel28").ClientID %>' title="第 6 个面板">第 6 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel32").ClientID %>' title="第 10 个面板">第 10 个面板</strong>）：规定当前子项占用的列宽。 本页各组分别使用<code>33%</code>、<code>34%</code>。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（高度变小时可能出现纵向滚动条）">面板（高度变小时可能出现纵向滚动条）</strong>）：内容超出该容器时允许滚动查看。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
