<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_space.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_space" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>VBox 子项间隔</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <%-- 两个容器使用相同尺寸和内边距，便于直接比较两种间隔配置的结果。 --%>
        <f:Panel runat="server" ID="PanelSpace" IsFluid="true" Layout="VBox" Height="210" BodyPadding="10" BoxConfigSpace="10" Title='推荐写法：BoxConfigSpace="10"'>
            <Items>
                <f:Panel runat="server" ID="SpaceItem1" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项一</Content>
                </f:Panel>
                <f:Panel runat="server" ID="SpaceItem2" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项二</Content>
                </f:Panel>
                <f:Panel runat="server" ID="SpaceItem3" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项三</Content>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="PanelMargins" IsFluid="true" Layout="VBox" Height="210" BodyPadding="10" BoxConfigChildMargin="0 0 10 0"
            BoxConfigLastChildMargin="0" Title='等效写法：普通子项边距 + 末项边距'>
            <Items>
                <f:Panel runat="server" ID="MarginsItem1" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项一</Content>
                </f:Panel>
                <f:Panel runat="server" ID="MarginsItem2" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项二</Content>
                </f:Panel>
                <f:Panel runat="server" ID="MarginsItem3" BoxFlex="1" ShowHeader="false" BodyPadding="4">
                    <Content>子项三</Content>
                </f:Panel>
            </Items>
        </f:Panel>
        <p>VBox 中的子项纵向间隔为 10px，最后一个可见子项不留尾部间隔。父容器的 BodyPadding 负责四周留白，子项自身的 Margin 仍可覆盖布局边距。</p>
    </form>
</body>
</html>
