<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shengshixian.aspx.cs" Inherits="FineUI.Pro.Examples.data.shengshixian" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" Title="中国省市县联动">
            <Items>
                <f:DropDownList ID="ddlSheng" Label="省份" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                    CompareMessage="请选择省份！" runat="server" OnSelectedIndexChanged="ddlSheng_SelectedIndexChanged">
                </f:DropDownList>
                <f:DropDownList ID="ddlShi" Label="地区市" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                    CompareMessage="请选择地区市！" runat="server" OnSelectedIndexChanged="ddlShi_SelectedIndexChanged" Enabled="false">
                </f:DropDownList>
                <f:DropDownList ID="ddlXian" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual" CompareMessage="请选择县区市！"
                    Label="县区市" runat="server" Enabled="false">
                </f:DropDownList>
                <f:Button ID="btnSubmit" runat="server" Text="获取选中的省市县" ValidateForms="SimpleForm1" ValidateTarget="Top" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" runat="server" ShowLabel="false" CssStyle="font-weight:bold;">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从省份逐级加载<strong class="example-control-reference" data-example-control="<%= ddlShi.ClientID %>" title="地区市">地区市</strong>和县区，切换上级后重置下级选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>逐级选择地区</h3>
            <ol>
                <li>
                    先选择省份“安徽”。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= ddlShi.ClientID %>" title="地区市">地区市</strong>列表加载安徽的数据并变为可选；原来的下级选择被清除。
                </li>
                <li>
                    选择<code>合肥市</code>，再选择<code>包河区</code>，点击提交按钮。<br />
                    结果：结果显示“您选择的省市县：安徽 | 合肥市 | 包河区”。
                </li>
                <li>
                    切换到另一个省份。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= ddlShi.ClientID %>" title="地区市">地区市</strong>和县区按新省份重新加载，不再保留安徽的下级选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control="<%= ddlSheng.ClientID %>" title="省份">省份</strong>、<strong class="example-control-reference" data-example-control="<%= ddlShi.ClientID %>" title="地区市">地区市</strong>）：上级选择改变后回发，后台重新加载下级选项，并切换下级可用状态。</li>
                <li><code>SelectedValue</code>（<strong class="example-control-reference" data-example-control="<%= ddlSheng.ClientID %>" title="省份">省份</strong>、<strong class="example-control-reference" data-example-control="<%= ddlShi.ClientID %>" title="地区市">地区市</strong>、<strong class="example-control-reference" data-example-control="<%= ddlXian.ClientID %>" title="县区市">县区市</strong>）：后台设置选中值；获取按钮读取本次提交的当前选择。</li>
            </ul>
        </section>
    </template>
</body>
</html>
