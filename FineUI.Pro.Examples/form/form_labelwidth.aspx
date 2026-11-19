<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_labelwidth.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_labelwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form BodyPadding="10px" ID="Form1" IsFluid="true" LabelWidth="120px" LabelAlign="Right" EnableCollapse="false" runat="server"
            Title="表单（LabelWidth=120 LabelAlign=Right）">
            <Rows>
                <f:FormRow ColumnWidths="50% 50%">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" LabelWidth="150px" LabelAlign="Left" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="50% 50%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Required="true" LabelWidth="150px" LabelAlign="Left" ShowRedStar="true"
                            AutoSelectFirstItem="false" Label="下拉列表（长标签）">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel1" runat="server" CssStyle="text-align: right;" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button runat="server" Text="验证此表单并提交" ValidateForms="Form1" ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示表单级标签宽度和对齐方式，以及字段级设置如何覆盖它们。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对比继承与覆盖</h3>
            <ul>
                <li>
                    对照<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>" title="标签">标签</strong><strong
                        class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表（长标签）">下拉列表（长标签）</strong>与<strong
                        class="example-control-reference" data-example-control="<%= TextBox1.ClientID %>" title="文本框">文本框</strong>的标签区域。<br />
                    结果：表单默认标签宽 <code>120</code> 像素且靠右；前两个字段单独改为 <code>150</code> 像素并靠左，<strong class="example-control-reference"
                        data-example-control="<%= TextBox1.ClientID %>" title="文本框">文本框</strong>仍使用表单默认值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表单字段定义的 <code>LabelWidth</code> 和 <code>LabelAlign</code> 属性会覆盖 Form 的同名属性</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>LabelWidth</code>（<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>" title="标签">标签</strong>）：表单为
                    <code>120</code>，特定字段覆盖为 <code>150</code>。
                </li>
                <li><code>LabelAlign</code>（<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>"
                        title="标签">标签</strong>）：字段级配置覆盖表单级配置。</li>
            </ul>
        </section>
    </template>
</body>
</html>
