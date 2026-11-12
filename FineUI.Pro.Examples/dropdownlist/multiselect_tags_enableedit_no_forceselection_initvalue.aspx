<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiselect_tags_enableedit_no_forceselection_initvalue.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.multiselect_tags_enableedit_no_forceselection_initvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（多选，可编辑，用户输入值）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true" MultiSelectMode="Tags" EnableEdit="true" ForceSelection="false" >
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" Selected="true" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="可选择项9" Value="Value9" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />

                </f:DropDownList>
                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
        <br />
        <br />
    </form>

    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在初次加载时显示列表之外的自定义文字，以及真实选项与自定义初值的组合。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>查看后台提供的初始文字</h3>
            <ol>
                <li>
                    初次打开页面。<br />
                    结果：输入区显示“可选项<code>1</code>, 可选项<code>4</code>, 初始自定义值<code>1</code>”，即使尚未选择列表项也保留这段初始文字。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：后台设置选中值；获取按钮读取本次提交的当前选择。</li>
                <li><code>ForceSelection</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：为 <code>false</code> 时允许保存列表之外的用户输入；为 <code>true</code> 时需要匹配现有选项。 本页声明值为 <code>false</code>。</li>
                <li><code>Text</code>（<strong class="example-control-reference" data-example-control="<%= btnSelectItem6.ClientID %>" title="选中[可选项6]">选中[可选项6]</strong>、<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取此下拉列表的选中项">获取此下拉列表的选中项</strong>）：提供本页的初始显示文字。</li>
            </ul>
        </section>
    </template>
</body>
</html>
