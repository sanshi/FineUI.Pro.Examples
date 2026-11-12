<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_radiobuttonlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_radiobuttonlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉单选框列表" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" Value="js" EnableMultiSelect="false">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择一种编程语言："></f:Label>
                                <f:RadioButtonList ID="RadioButtonList1" ColumnNumber="1" runat="server">
                                    <f:RadioItem Text="C#" Value="csharp" />
                                    <f:RadioItem Text="JavaScript" Value="js" />
                                    <f:RadioItem Text="JAVA" Value="java" />
                                    <f:RadioItem Text="Ruby" Value="ruby" />
                                </f:RadioButtonList>
                            </Items>
                        </f:SimpleForm>
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在下拉面板内单选编程语言。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-radio-button-checked" aria-hidden="true"></i>从面板选择编程语言</h3>
            <ol>
                <li>
                    点击下拉箭头展开面板，选择<code>Ruby</code>。<br />
                    结果：<code>Ruby</code> 替换原来的单选项，对应值为 <code>ruby</code>。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />
                    结果：回发后由后台显示包含 <code>Ruby</code> 和 <code>ruby</code> 的当前选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：列表项的值不能为空字符串。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataControlID</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：指定弹出面板中提供选择数据的控件。 本页声明值为 <code>RadioButtonList1</code>。</li>
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：决定<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>保留单个值还是多个值。 本页声明值为 <code>false</code>。</li>
                <li><code>Value</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：指定初始单选值或多选值数组。 本页声明值为 <code>js</code>。</li>
                <li><code>ColumnNumber</code>（<strong class="example-control-reference" data-example-control="<%= RadioButtonList1.ClientID %>" title="单选框列表">单选框列表</strong>）：控制弹出单选或复选列表的列数。 本页声明值为 <code>1</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
