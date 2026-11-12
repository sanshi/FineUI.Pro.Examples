<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_focus.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_focus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="简单下拉列表" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" FocusOnPageLoad="true">
                    <f:ListItem Text="可选项1" Value="Value1"/>
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                    <f:ListItem Text="一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value11" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>页面加载后自动聚焦下拉列表，随后仍可正常选择并读取结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-keyboard" aria-hidden="true"></i>页面加载后自动聚焦</h3>
            <ol>
                <li>
                    初次打开页面后直接使用键盘操作。<br />
                    结果：下拉列表已取得焦点，可以继续打开选项并选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：页面加载完毕后，下拉列表默认获取焦点。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FocusOnPageLoad</code>：页面加载后主动聚焦该下拉字段。 本页声明值为 true。</li>
            </ul>
        </section>
    </template>
</body>
</html>
