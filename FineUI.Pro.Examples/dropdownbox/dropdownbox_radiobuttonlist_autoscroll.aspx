<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_radiobuttonlist_autoscroll.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_radiobuttonlist_autoscroll" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉单选框列表（滚动条）" ShowHeader="true">
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
                                    <f:RadioItem Text="PHP" Value="php" />
                                    <f:RadioItem Text="Objective-C" Value="objc" />
                                    <f:RadioItem Text="Python" Value="python" />
                                    <f:RadioItem Text="Perl" Value="perl" />
                                    <f:RadioItem Text="C++" Value="cplusplus" />
                                    <f:RadioItem Text="Basic" Value="basic" />
                                    <f:RadioItem Text="Go" Value="go" />
                                    <f:RadioItem Text="Swift" Value="swift" />
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
            <p>在下拉面板内单选编程语言，选项较多时可在容器内滚动。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>选择末尾语言</h3>
            <ol>
                <li>
                    展开面板，找到末尾的“Swift”；面板内容超出可见范围时向下滚动，再选择它。<br />
                    结果：仍能选中末尾项；读取结果包含 Swift 和 swift。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AutoScroll</code>：弹出容器内容超出可见范围时允许内部滚动；是否出现滚动条取决于当前可用高度。</li>
            </ul>
        </section>
    </template>
</body>
</html>
