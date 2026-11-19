<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_autopostback_enableedit_noforceselection.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_autopostback_enableedit_noforceselection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="简单下拉列表（自动回发，可编辑，用户输入值）"
            ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" EnableEdit="true"
                    ForceSelection="false">
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
        <br />
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示自由输入确认或失焦时的选择变化回发。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>响应选择变化</h3>
            <ol>
                <li>
                    在下拉面板改选另一项。<br />
                    结果：选择变化后自动回发，后台用本次选择更新结果；无需再点获取按钮。
                </li>
                <li>
                    从初始状态在输入区输入<code>自己的选项</code>，按 <code>Enter</code> 确认。<br />
                    结果：后台变化事件显示本次提交的自定义文字，无需再点击获取按钮。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>测试用例：</p>
            <ul>
                <li> 初始文本：可选项<code>1</code>；在文本输入框依次删除：<code>1</code>，项；<strong>不会</strong>触发回发事件 </li>
                <li> 初始文本：可选项<code>1</code>；在文本输入框依次删除：<code>1</code>，项；然后在页面上点击一下，使得文本框失去焦点；显示文本：可选；触发回发事件（<strong>用户输入值：可选</strong>） </li>
                <li> 初始文本：可选项<code>1</code>；在文本输入框依次删除：<code>1</code>，项；然后再依次输入：项，<code>5</code>；按回车键；显示文本：可选项<code>5</code>；触发回发事件（<strong>选中项：可选项5（值：Value5）</strong>）
                </li>
                <li> 初始文本：可选项<code>1</code>；在文本输入框依次删除：<code>1</code>，项；然后再依次输入：项，<code>5</code>；然后在页面上点击一下，使得文本框失去焦点；显示文本：可选项<code>5</code>；触发回发事件（<strong>选中项：可选项5（值：Value5）</strong>）
                </li>
                <li> 初始文本：可选项<code>1</code>；点击触发图标，显示<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>；点击：可选项<code>5</code>；显示文本：可选项<code>5</code>；触发回发事件 </li>
                <li> 初始文本：可选项<code>1</code>；点击按钮：<strong class="example-control-reference" data-example-control="<%= btnSelectItem6.ClientID %>"
                        title="选中[可选项6]">选中[可选项6]</strong>；显示文本：可选项<code>6</code>；<strong>不会</strong>触发回发事件 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：允许直接在输入区键入筛选文本。 本页声明值为 <code>true</code>。</li>
                <li><code>ForceSelection</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：为 <code>false</code> 时允许保存列表之外的用户输入；为 <code>true</code> 时需要匹配现有选项。 本页声明值为 <code>false</code>。</li>
                <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：选择变化时处理当前值；<code>Pro</code> 中是否主动回发还受 <code>AutoPostBack</code> 控制。 本页声明值为
                    <code>DropDownList1</code><code>_SelectedIndexChanged</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
