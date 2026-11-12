<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_checkboxlist_enableedit.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_checkboxlist_enableedit" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" EnableMultiSelect="true" Values="js,php" EnableEdit="true">
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
            <p>在下拉面板内多选编程语言，允许输入列表之外的文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入列表之外的文字</h3>
            <ol>
                <li>
                    先取消现有选择，再在输入区键入“自定义说明”，收起面板或离开字段。<br />
                    结果：输入区保留用户输入文字，不把它误认为某个已有的业务值；获取时按用户输入值处理。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：允许输入列表之外的文字，选中项与自由输入按不同方式读取。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
