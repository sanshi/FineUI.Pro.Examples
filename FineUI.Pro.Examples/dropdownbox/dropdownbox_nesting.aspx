<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_nesting.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_nesting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉框嵌套"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" DataControlID="Grid1" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Panel ID="Panel1" Width="550px" Height="300px" ShowHeader="false" BodyPadding="5" Layout="VBox" Hidden="true" runat="server">
                            <Items>
                                <f:Form runat="server" LabelWidth="50px" LabelAlign="Right" ShowBorder="false" ShowHeader="false">
                                    <Rows>
                                        <f:FormRow ColumnWidths="150px 100%" runat="server">
                                            <Items>
                                                <f:DropDownList Label="性别" EmptyText="请选择" runat="server" ID="ddlGender" AutoSelectFirstItem="false"
                                                    AutoShowClearIcon="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    <f:ListItem Text="男" Value="1" />
                                                    <f:ListItem Text="女" Value="0" />
                                                </f:DropDownList>
                                                <f:DropDownBox Label="专业" EmptyText="请选择" runat="server" ID="ddbMajor" DataControlID="CheckBoxList1"
                                                    MatchFieldWidth="true" EnableMultiSelect="true" AutoShowClearIcon="true"
                                                    OnTextChanged="DropDownBox2_TextChanged">
                                                    <PopPanel>
                                                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true" ShowBorder="true"
                                                            ShowHeader="false" Hidden="true">
                                                            <Items>
                                                                <f:Label ID="Label1" runat="server" Text="请选择专业："></f:Label>
                                                                <f:CheckBoxList ID="CheckBoxList1" ColumnNumber="2" runat="server">
                                                                    <f:CheckItem Text="化学系" Value="化学系" />
                                                                    <f:CheckItem Text="数学系" Value="数学系" />
                                                                    <f:CheckItem Text="物理系" Value="物理系" />
                                                                    <f:CheckItem Text="自动化系" Value="自动化系" />
                                                                    <f:CheckItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                                                </f:CheckBoxList>
                                                            </Items>
                                                        </f:SimpleForm>
                                                    </PopPanel>
                                                </f:DropDownBox>
                                            </Items>
                                        </f:FormRow>
                                    </Rows>
                                </f:Form>
                                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" BoxFlex="1"
                                    EnableMultiSelect="false">
                                    <Columns>
                                        <f:RenderField DataField="Name" HeaderText="姓名" />
                                        <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                        <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                    </Columns>
                                </f:Grid>
                            </Items>
                        </f:Panel>
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
            <p>在外层选人面板内嵌套性别和专业下拉框，筛选人员后回填外层选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>先筛专业，再选人员</h3>
            <ol>
                <li>
                    展开外层下拉框，再展开里面的<strong class="example-control-reference" data-example-control="<%= ddbMajor.ClientID %>" title="专业">专业</strong>下拉框，勾选<code>化学系</code>。<br />
                    结果：内层保留所选专业；收起专业面板后按化学系过滤外层表格。
                </li>
                <li>
                    在过滤结果中选择<code>陈飞</code>，再点击面板外空白处收起，点击获取值按钮。<br />
                    结果：外层结果显示陈飞，业务值为 <code>102</code>。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>通过性别继续筛选</h3>
            <ol>
                <li>
                    重新展开外层面板，在<strong class="example-control-reference" data-example-control="<%= ddlGender.ClientID %>" title="性别">性别</strong>中选择<code>女</code>。<br />
                    结果：表格只显示满足当前性别与专业条件的人员；内层面板的选择不直接成为外层人员值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataControlID</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>、<strong class="example-control-reference" data-example-control="<%= ddbMajor.ClientID %>" title="专业">专业</strong>）：指定弹出面板中提供选择数据的控件。 本页声明值为 <code>Grid1</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
