<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiselect_tags_autopostback_enableedit.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.multiselect_tags_autopostback_enableedit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉列表（多选）"
            ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true" MultiSelectMode="Tags" EnableEdit="true"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>


            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
    </form>

    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示输入匹配并确认列表项时的选择变化回发。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>响应选择变化</h3>
            <ol>
                <li>
                    在下拉面板增加或取消一项。<br />
                    结果：选择变化后自动回发，后台用本次选择更新结果；无需再点获取按钮。
                </li>
                <li>
                    从初始状态输入<code>可选项5</code>，等待筛选项出现后按 <code>Enter</code> 确认。<br />
                    结果：后台变化事件显示新选中的可选项<code>5</code>，无需再点击获取按钮。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：允许直接在输入区键入筛选文本。 本页声明值为 <code>true</code>。</li>
                <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：选择变化时处理当前值；<code>Pro</code> 中是否主动回发还受 <code>AutoPostBack</code> 控制。 本页声明值为
                    <code>DropDownList1</code><code>_SelectedIndexChanged</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
