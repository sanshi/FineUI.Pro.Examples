<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_update.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.checkboxlist_update" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="120px" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true" Title="简单表单">
            <Items>
                <f:CheckBoxList ID="CheckBoxList1" Label="列表一" runat="server">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                </f:CheckBoxList>
                <f:Button ID="btnUpdateList1" CssClass="marginr" Text="更新列表一" OnClick="btnUpdateList1_Click" runat="server">
                </f:Button>
                <f:Button ID="btnCheckedItemsList1" Text="获取列表一的选中项" OnClick="btnCheckedItemsList1_Click" runat="server">
                </f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（竖排）" ColumnNumber="3" ColumnVertical="true" runat="server">
                </f:CheckBoxList>
                <f:Button ID="btnUpdateList2" CssClass="marginr" Text="更新列表二" OnClick="btnUpdateList2_Click" runat="server">
                </f:Button>
                <f:Button ID="btnCheckedItemsList2" Text="获取列表二的选中项" OnClick="btnCheckedItemsList2_Click" runat="server">
                </f:Button>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:CheckBoxList ID="CheckBoxList4" Label="列表四" ColumnNumber="3" ColumnVertical="false" runat="server">
                </f:CheckBoxList>
                <f:Button ID="btnUpdateList4" CssClass="marginr" Text="更新列表四（可反复操作）" OnClick="btnUpdateList4_Click" runat="server">
                </f:Button>
                <f:Button ID="btnCheckedItemsList4" Text="获取列表四的选中项" OnClick="btnCheckedItemsList4_Click" runat="server">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        <f:CheckBoxList ID="CheckBoxList3" Width="700px" Label="列表三" ColumnNumber="3" ColumnVertical="false" runat="server">
            <f:CheckItem Text="可选项 1" Value="value1" />
            <f:CheckItem Text="可选项 2" Value="value2" />
            <f:CheckItem Text="可选项 3" Value="value3" />
            <f:CheckItem Text="可选项 4" Value="value4" />
            <f:CheckItem Text="可选项 5" Value="value5" Selected="true" />
            <f:CheckItem Text="可选项 6" Value="value6" Selected="true" />
            <f:CheckItem Text="可选项 7" Value="value7" Selected="true" />
            <f:CheckItem Text="可选项 8" Value="value8" />
        </f:CheckBoxList>
        <br />
        <f:Button ID="btnUpdateList3" CssClass="marginr" Text="更新列表三" OnClick="btnUpdateList3_Click" runat="server">
        </f:Button>
        <f:Button ID="btnCheckedItemsList3" Text="获取列表三的选中项" OnClick="btnCheckedItemsList3_Click" runat="server">
        </f:Button>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示替换复选框列表的选项、同步指定选中项，以及反复填充和清空列表。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>更新后读取选择</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnUpdateList1.ClientID %>" title="更新列表一">更新列表一</strong>。<br />
                    结果：回发后由后台将原来的 <code>3</code> 项替换为 <code>4</code> 项“数据绑定值”，并选中第一项和第三项。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnCheckedItemsList1.ClientID %>" title="获取列表一的选中项">获取列表一的选中项</strong>。<br />
                    结果：回发后由后台显示 <code>value1</code>、<code>value3</code>，读取的是更新后的选择。
                </li>
                <li>
                    分别点击<strong class="example-control-reference" data-example-control="<%= btnUpdateList2.ClientID %>" title="更新列表二">更新列表二</strong>和<strong class="example-control-reference" data-example-control="<%= btnUpdateList3.ClientID %>" title="更新列表三">更新列表三</strong>。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= CheckBoxList2.ClientID %>" title="列表二（竖排）">列表二</strong>变为 <code>6</code> 项并选中第 <code>1</code>、<code>3</code>、<code>6</code> 项；<strong class="example-control-reference" data-example-control="<%= CheckBoxList3.ClientID %>" title="列表三">列表三</strong>变为 <code>9</code> 项并选中第 <code>1</code>、<code>2</code>、<code>6</code>、<code>7</code> 项。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>反复填充和清空</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= CheckBoxList4.ClientID %>" title="列表四">列表四</strong>为空时，点击<strong class="example-control-reference" data-example-control="<%= btnUpdateList4.ClientID %>" title="更新列表四（可反复操作）">更新列表四（可反复操作）</strong>。<br />
                    结果：回发后由后台填充 <code>6</code> 个选项，并选中前两项。
                </li>
                <li>
                    再次点击同一个按钮。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= CheckBoxList4.ClientID %>" title="列表四">列表四</strong>的选项全部清空；继续点击又可填充，无需重新打开页面。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataTextField</code>（本页全部复选框列表，如<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>）：指定显示文字字段，本例为 <code>Name</code>。</li>
                <li><code>DataValueField</code>（本页全部复选框列表，如<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>）：指定选项值字段，本例为 <code>Id</code>。</li>
                <li><code>DataSource</code>（本页全部复选框列表，如<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>）：提供新数据，绑定后替换原来的选项。</li>
                <li><code>Items.Clear()</code>（<strong class="example-control-reference" data-example-control="<%= CheckBoxList4.ClientID %>" title="列表四">列表四</strong>）：<strong class="example-control-reference" data-example-control="<%= CheckBoxList4.ClientID %>" title="列表四">列表四</strong>已有内容时清空全部选项。</li>
            </ul>
        </section>
    </template>
</body>
</html>
