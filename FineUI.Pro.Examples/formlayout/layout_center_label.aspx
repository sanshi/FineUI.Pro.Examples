<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_center_label.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_center_label" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .formtitle .f-field-body {
            text-align: center;
            font-size: 20px;
            line-height: 1.2em;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form IsFluid="true" BodyPadding="10px" ID="Form1" LabelWidth="100px" EnableCollapse="false"
            runat="server" ShowHeader="false" Title="表单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label2" CssClass="formtitle f-widget-header" runat="server" Text="这是表单标题">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Center">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" CssClass="mybutton" ValidateForms="Form1"
                            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnResetForm1" CssClass="mybutton" Text="重置表单"
                            runat="server" ClickHandler="onResetForm1Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
    </form>
    <script>

        var Form1ClientID = '<%= Form1.ClientID %>';

        function onResetForm1Click(event) {
            F(Form1ClientID).reset();
        }

    </script>
    
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用普通 Label 构造水平居中的表单标题。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照标题或按钮布局</h3>
            <ul>
                <li>
                    查看表单顶端<strong class="example-control-reference" data-example-control="<%= Label2.ClientID %>" title="这是表单标题">这是表单标题</strong>。<br />
                    结果：默认表单标题栏隐藏，自定义 Label 横跨表单并居中显示。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control="<%= Label2.ClientID %>" title="这是表单标题">这是表单标题</strong>）：<code>formtitle</code> 和主题标题类构造自定义标题。</li>
            </ul>
        </section>
    </template>
</body>
</html>
