<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_center_button.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_center_button" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-panel.mypanel {
            padding-top: 10px;
            margin-top: 10px;
            border-left-width: 0;
            border-right-width: 0;
            border-bottom-width: 0;
            border-radius: 0;
        }

    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form IsFluid="true" BodyPadding="10px" ID="Form1" LabelWidth="100px" EnableCollapse="false" runat="server" Title="表单">
            <Rows>
                <f:FormRow ColumnWidths="40% 60%" CssClass="FormRow1">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel1" runat="server" ShowBorder="true" CssClass="mypanel" ShowHeader="false" Layout="HBox" BoxConfigPosition="Center"
                            BoxConfigSpace="5">
                            <Items>
                                <f:Button runat="server" Text="验证此表单并提交" CssClass="mybutton" ValidateForms="Form1" ID="btnSubmitForm1"
                                    OnClick="btnSubmitForm1_Click">
                                </f:Button>
                                <f:Button ID="btnResetForm1" CssClass="mybutton" Text="重置表单" runat="server" ClickHandler="onResetForm1Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
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
            <p>演示将表单底部的操作按钮水平居中排列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照标题或按钮布局</h3>
            <ul>
                <li>
                    对照字段区域和底部操作按钮。<br />
                    结果：提交和重置按钮作为一组居中显示，不依赖字段标签宽度。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>BoxConfigPosition</code>（<strong class="example-control-reference" data-example-control="<%= Panel1.ClientID %>" title="面板">面板</strong>）：设为 <code>Center</code>，使 <code>HBox</code> 内的按钮组水平居中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
