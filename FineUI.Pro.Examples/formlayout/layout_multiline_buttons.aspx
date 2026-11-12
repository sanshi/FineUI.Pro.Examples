<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_multiline_buttons.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_multiline_buttons" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm IsFluid="true" BodyPadding="10px" ID="Form1" LabelWidth="100px" EnableCollapse="false"
            runat="server" Title="表单">
            <Items>
                <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                </f:Label>
                <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                </f:CheckBox>
                <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                    <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                    <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                </f:DropDownList>
                <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                    Text="">
                </f:TextBox>
                <f:Panel ID="Panel1" runat="server" CssClass="f-field" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Button runat="server" CssClass="marginr" Text="按钮一">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" CssClass="marginr" Text="按钮二">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="Form1"
                            ID="Button1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnReset" CssClass="marginr" Text="重置表单"
                            runat="server" ClickHandler="onResetClick">
                        </f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:SimpleForm>


    </form>
    <script>

        var Form1ClientID = '<%= Form1.ClientID %>';

        function onResetClick(event) {
            F(Form1ClientID).reset();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示表单中多组按钮的换行和排列方式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照标题或按钮布局</h3>
            <ul>
                <li>
                    对照字段区域和底部操作按钮。<br />
                    结果：两组按钮分别占一行，都使用 f-field 保持字段间距。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：第一行按钮所在的面板设置了样式：CssClass="f-field"。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>：f-field 为指定按钮容器提供与字段一致的间距。</li>
            </ul>
        </section>
    </template>
</body>
</html>
