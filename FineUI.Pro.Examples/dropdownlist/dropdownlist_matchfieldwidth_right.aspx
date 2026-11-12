<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_matchfieldwidth_right.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_matchfieldwidth_right" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BodyPadding="10px" BoxConfigPosition="End" BoxConfigAlign="Start" ShowHeader="true"
            Title="面板（Layout=HBox BoxConfigPosition=End）">
            <Items>
                <f:SimpleForm ID="SimpleForm1" BodyPadding="10px" runat="server" Width="400px" EnableCollapse="false"
                    ShowBorder="true" Title="下拉列表（MatchFieldWidth）" ShowHeader="true">
                    <Items>
                        <f:DropDownList runat="server" ID="DropDownList1" MatchFieldWidth="false">
                            <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                            <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                            <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                            <f:ListItem Text="可选项4" Value="Value4" />
                            <f:ListItem Text="可选项5" Value="Value5" />
                            <f:ListItem Text="可选项6" Value="Value6" />
                            <f:ListItem Text="可选择项7" Value="Value7" />
                            <f:ListItem Text="可选择项8" Value="Value8" />
                            <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                            <f:ListItem Text="一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value11" />
                            <f:ListItem Text="二个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value12" />
                            <f:ListItem Text="三个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value13" />
                            <f:ListItem Text="四个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value14" />
                            <f:ListItem Text="五个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value15" />
                            <f:ListItem Text="六个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value16" />
                            <f:ListItem Text="七个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value17" />
                            <f:ListItem Text="八个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value18" />
                            <f:ListItem Text="九个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value19" />
                            <f:ListItem Text="十个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value20" />
                        </f:DropDownList>

                        <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                            CssClass="marginr">
                        </f:Button>
                        <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                        </f:Button>
                        <f:Label runat="server" ID="labResult">
                        </f:Label>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示下拉面板与输入框的宽度关系，以及侧边空间不足时的定位。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>查看下拉面板宽度</h3>
            <ol>
                <li>
                    展开下拉列表，查看较长的选项文字。<br />
                    结果：弹出面板不被强制限制为字段宽度；靠近视口右边缘时调整展开位置，避免向右越界。
                </li>
                <li>
                    缩窄浏览器，再展开靠右侧的下拉面板。<br />
                    结果：可以对照右侧空间不足时弹层相对输入框的水平位置。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MatchFieldWidth</code>：为 false 时弹出面板可以宽于字段，空间不足时由控件调整位置。 本页声明值为 false。</li>
            </ul>
        </section>
    </template>
</body>
</html>
