<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist" %>

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
                <f:DropDownList runat="server" ID="DropDownList1">
                    <f:ListItem Text="可选项1" Value="Value1" />
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
            <p>在下拉面板中单项选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-radio-button-checked" aria-hidden="true"></i>选择并读取当前项</h3>
            <ol>
                <li>
                    展开<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>，选择<code>可选择项8</code>。<br />
                    结果：输入区显示该选项，原来的单选项被替换。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取此下拉列表的选中项">获取此下拉列表的选中项</strong>。<br />
                    结果：回发后由后台显示当前文字和选中值，其中包含 <code>Value8</code>；后台读取本次选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>通过按钮更新选择</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSelectItem6.ClientID %>" title="选中[可选项6]">选中[可选项6]</strong>。<br />
                    结果：回发后由后台用按钮指定的选项替换当前选择，输入区同步显示对应文字。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：列表项的值不能为空字符串。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValue</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：后台设置选中值；获取按钮读取本次提交的当前选择。</li>
            </ul>
        </section>
    </template>
</body>
</html>
