<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tags_checkboxlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tags_checkboxlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉复选框列表" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" EnableMultiSelect="true" MultiSelectMode="Tags" Values="js,php">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择编程语言："></f:Label>
                                <f:CheckBoxList ID="RadioButtonList1" ColumnNumber="3" runat="server">
                                    <f:CheckItem Text="C#" Value="csharp" />
                                    <f:CheckItem Text="JavaScript" Value="js" />
                                    <f:CheckItem Text="JAVA" Value="java" />
                                    <f:CheckItem Text="Ruby" Value="ruby" />
                                    <f:CheckItem Text="PHP" Value="php" />
                                    <f:CheckItem Text="Objective-C" Value="objc" />
                                    <f:CheckItem Text="Python" Value="python" />
                                    <f:CheckItem Text="Perl" Value="perl" />
                                    <f:CheckItem Text="C++" Value="cplusplus" />
                                    <f:CheckItem Text="Basic" Value="basic" />
                                    <f:CheckItem Text="Go" Value="go" />
                                    <f:CheckItem Text="Swift" Value="swift" />
                                </f:CheckBoxList>
                            </Items>
                        </f:SimpleForm>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnSelectItem6" Text="选中[php,basic]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
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
            <p>在下拉面板内多选编程语言，以可移除标签显示选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>移除一个选择标签</h3>
            <ol>
                <li>
                    先在下拉面板选择两个可用项，再点击其中一个标签右侧的关闭图标。<br />
                    结果：对应业务值与面板中的选择被取消，其它已选项保持不变。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MultiSelectMode</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：<code>Tags</code>/<code>tags</code> 将选中的每项显示为可单独移除的标签。 本页声明值为 <code>Tags</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
