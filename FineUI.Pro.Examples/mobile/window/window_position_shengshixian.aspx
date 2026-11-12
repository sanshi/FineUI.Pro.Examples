<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_shengshixian.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_shengshixian" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            .mybgpanel>.f-panel-bodyct>.f-panel-body {
                background-color: #FEF3D5;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>');
                background-position: right bottom;
                background-repeat: no-repeat;
            }

            .mywindow,
            .mywindow>.f-panel-bodyct>.f-panel-body {
                background-image: none;
                background-color: transparent;
                -moz-box-shadow: none;
                -webkit-box-shadow: none;
                box-shadow: none;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mybgpanel" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="选择省市县" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" CssClass="mywindow" ShowHeader="false" ShowBorder="false" Hidden="true" HideOnMaskClick="true" IsModal="true"
            BodyPadding="10px" Layout="VBox" BoxConfigSpace="5" PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:SimpleForm runat="server" ID="SimpleForm1" ShowBorder="true" ShowHeader="false" BodyPadding="10px" CssClass="f-corner-all" Layout="VBox"
                    MessageTarget="None" LabelAlign="Right">
                    <Items>
                        <f:DropDownList ID="ddlSheng" Label="省份" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择省份！" runat="server" OnSelectedIndexChanged="ddlSheng_SelectedIndexChanged">
                        </f:DropDownList>
                        <f:DropDownList ID="ddlShi" Label="地区市" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择地区市！" runat="server" OnSelectedIndexChanged="ddlShi_SelectedIndexChanged" Enabled="false">
                        </f:DropDownList>
                        <f:DropDownList ID="ddlXian" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择县区市！" Label="县区市" runat="server" Enabled="false">
                        </f:DropDownList>
                        <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox">
                            <Items>
                                <f:Button runat="server" ID="Button3" Width="100px" Text="取消" MarginRight="10px" ClickHandler="onCloseWindow1Click"></f:Button>
                                <f:Button runat="server" ID="Button1" BoxFlex="1" Text="选择" ValidateForms="SimpleForm1" ValidateMessageBoxPlain="true"
                                    OnClick="Button1_Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>

            </Items>
        </f:Window>

    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在底部面板中逐级选择省、市、县，并验证后读取最终组合。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>按上级选择加载下级</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>' title="选择省市县">选择省市县</strong>。<br />结果：底部面板显示三个联动下拉框。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlSheng").ClientID %>' title="省份">省份</strong>选择<code>安徽</code>，再选择需要的地区市与县区市。<br />结果：省或市变化时回发，后台按当前上级读取下级数据并更新可用状态。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="选择">选择</strong>。<br />结果：先验证本页需要的选择，通过后显示省市县名称组合。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlSheng").ClientID %>' title="省份">省份</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlShi").ClientID %>' title="地区市">地区市</strong>）：各组分别设为<code>ddlSheng_SelectedIndexChanged</code>、<code>ddlShi_SelectedIndexChanged</code>，省、市变化时更新下一层数据。</li>
        <li><code>DataValueField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlSheng").ClientID %>' title="省份">省份</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlShi").ClientID %>' title="地区市">地区市</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlXian").ClientID %>' title="县区市">县区市</strong>）：用稳定的地区代码关联上下级数据。</li>
        <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="选择">选择</strong>）：初始为<code>SimpleForm1</code>，选择按钮先检查当前组合。</li>
    </ul>
</section>
</template>
</body>
</html>
