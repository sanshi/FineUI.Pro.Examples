<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_twousercontrols.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.dropdownbox_grid_twousercontrols" %>

<%@ Register Src="~/usercontrol/SelectUserControl.ascx" TagPrefix="uc1" TagName="SelectUserControl" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/SelectUserControl.ascx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（复杂布局）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" Label="用户甲" ID="DropDownBox1" EmptyText="多选" DataControlID="Grid1" EnableMultiSelect="true"
                    MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector runat="server">
                            <uc1:SelectUserControl runat="server" ID="SelectUserControl1" EnableGridMultiSelect="true" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:DropDownBox runat="server" Label="用户乙" ID="DropDownBox2" EmptyText="单选，仅可从[材料物理与化学]专业中选取" DataControlID="Grid1" EnableMultiSelect="false"
                    MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector ID="UserControlConnector1" runat="server">
                            <uc1:SelectUserControl runat="server" ID="SelectUserControl2" EnableGridMultiSelect="false" GridMajor="材料物理与化学" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>在同一表单中使用两个包含独立用户控件的下拉表格，分别限制多选与单选范围。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>从下拉表格选择记录</h3>
    <ul>
        <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="用户甲">用户甲</strong>，选择多条记录，再点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetSelection").ClientID %>' title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />结果：后台把对应文字与标识显示到结果标签；没有选择时显示下拉框为空。</li>
        <li>再从<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox2").ClientID %>' title="用户乙">用户乙</strong>选择一条记录并重新读取。<br />结果：用户乙只可在指定专业内单选，<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="用户甲">用户甲</strong>的多选结果保留，两份用户控件不互相覆盖。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="用户甲">用户甲</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox2").ClientID %>' title="用户乙">用户乙</strong>）：初始为 <code>true</code>、<code>false</code>，允许同时选择多个选项。</li>
        <li><code>DataControlID</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="用户甲">用户甲</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox2").ClientID %>' title="用户乙">用户乙</strong>）：初始为 <code>Grid1</code>，指定下拉面板内实际提供选项数据的控件。</li>
        <li><code>MatchFieldWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="用户甲">用户甲</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox2").ClientID %>' title="用户乙">用户乙</strong>）：初始为 <code>false</code>，控制弹出区域是否与输入框等宽。</li>
    </ul>
</section>
</template>
</body>
</html>
