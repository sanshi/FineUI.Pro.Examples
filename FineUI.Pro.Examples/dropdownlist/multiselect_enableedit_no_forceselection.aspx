<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiselect_enableedit_no_forceselection.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.multiselect_enableedit_no_forceselection" %>

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
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true" EnableEdit="true" ForceSelection="false" >
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
            <p>在下拉面板中多项选择，允许列表之外的自由输入。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>保留用户输入</h3>
            <ol>
                <li>
                    在输入区填写列表中没有的“自定义输入”，然后按 Enter 或移开焦点。<br />
                    结果：输入区保留这段文字，不要求它已经存在于选项列表中；可用获取按钮核对当前文字。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>：允许直接在输入区键入筛选文本。 本页声明值为 true。</li>
                <li><code>ForceSelection</code>：为 false 时允许保存列表之外的用户输入；为 true 时需要匹配现有选项。 本页声明值为 false。</li>
            </ul>
        </section>
    </template>
</body>
</html>
