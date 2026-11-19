<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_singleselect.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.dropdownbox_grid_singleselect" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择（单选）" DataControlID="Grid1" EnableMultiSelect="false"
                    MatchFieldWidth="false">
                    <PopPanel>
                        <f:UserControlConnector runat="server">
                            <uc1:SelectUserControl runat="server" EnableGridMultiSelect="false" ID="SelectUserControl1" />
                        </f:UserControlConnector>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把用户控件中的表格放入下拉框，只允许选择一条记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>从下拉表格选择记录</h3>
            <ul>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>'
                        title="请从下拉表格中选择（单选）">请从下拉表格中选择（单选）</strong>，选择一条记录，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnGetSelection").ClientID %>'
                        title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />结果：后台把对应文字与标识显示到结果标签；没有选择时显示下拉框为空。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>'
                        title="请从下拉表格中选择（单选）">请从下拉表格中选择（单选）</strong>）：初始为 <code>false</code>，允许同时选择多个选项。</li>
                <li><code>DataControlID</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>'
                        title="请从下拉表格中选择（单选）">请从下拉表格中选择（单选）</strong>）：初始为 <code>Grid1</code>，指定下拉面板内实际提供选项数据的控件。</li>
                <li><code>MatchFieldWidth</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>'
                        title="请从下拉表格中选择（单选）">请从下拉表格中选择（单选）</strong>）：初始为 <code>false</code>，控制弹出区域是否与输入框等宽。</li>
            </ul>
        </section>
    </template>
</body>
</html>
