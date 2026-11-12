<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_no_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" EnableImplicitChangeEvents="true" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="简单下拉列表（不自动回发，定义了回发事件）"
            ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" AutoSelectFirstItem="false" AutoPostBack="false"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <f:ListItem Text="可选项1" Value="Value1" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>


        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示选项变化先留在浏览器，借其它按钮请求再处理后台变化事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>借按钮请求处理变化</h3>
            <ol>
                <li>
                    先选择“可选择项8”。<br />
                    结果：此时不主动回发。
                </li>
                <li>
                    点击“获取此下拉列表的选中项”。<br />
                    结果：请求处理当前选择，并由隐式变化事件触发下拉列表的后台回调。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本页通过 PageManager.EnableImplicitChangeEvents=true 专门保留 WebForms 的历史兼容行为：下拉列表不自动回发（AutoPostBack=false），但定义了 SelectedIndexChanged 事件。可以尝试进行如下操作：</p>
            <ul>
                <li> 改变下拉列表的选择项，比如选中[可选项4]； </li>
                <li> 点击按钮[获取此下拉列表的选中项]，此时会触发下拉列表的SelectedIndexChanged事件。 </li>
            </ul>
            <ul>
                <li> 点击按钮[选中[可选项6]]； </li>
                <li> 点击按钮[获取此下拉列表的选中项]，此时不会触发下拉列表的SelectedIndexChanged事件。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnSelectedIndexChanged</code>：选择变化时处理当前值；Pro 中是否主动回发还受 AutoPostBack 控制。 本页声明值为 DropDownList1_SelectedIndexChanged。</li>
                <li><code>AutoPostBack</code>：决定下拉列表是否在用户改变选择时主动回发。 本页声明值为 false。</li>
            </ul>
        </section>
    </template>
</body>
</html>
