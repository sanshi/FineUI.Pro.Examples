<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_columnwidths.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_columnwidths" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .speciallabel {
            color: red;
        }

    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form BodyPadding="10px" EnableCollapse="false" LabelAlign="Left"
            ID="Form2" IsFluid="true" runat="server" Title="表单">
            <Rows>
                <f:FormRow ID="FormRowExample1" ClientIDMode="Static" ColumnWidths="20px 50% 50%">
                    <Items>
                        <f:Label runat="server" CssClass="speciallabel" Text="1."></f:Label>
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRowExample2" ClientIDMode="Static" ColumnWidths="20px 50% 50%">
                    <Items>
                        <f:Label ID="Label1" runat="server" CssClass="speciallabel" Text="2."></f:Label>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRowExample3" ClientIDMode="Static" ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label2" runat="server" CssClass="speciallabel" Text="3."></f:Label>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" ForceSelection="false" Required="true" ShowRedStar="true">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRowExample4" ClientIDMode="Static" ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label5" runat="server" CssClass="speciallabel" Text="4."></f:Label>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRowExample5" ClientIDMode="Static" ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label6" runat="server" CssClass="speciallabel" Text="5."></f:Label>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="true" Required="true">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="提交表单" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
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
            <p>演示一行内混用固定宽度和百分比，让编号列固定、其余字段按比例伸展。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照固定列与伸展列</h3>
            <ul>
                <li>
                    对照每行开头的编号与后面的字段。<br />
                    结果：编号区域使用 <code>20</code> 像素宽度，其余一列占满或两列等分剩余空间。
                </li>
                <li>
                    调整浏览器宽度，再填写邮箱、<strong class="example-control-reference" data-example-control="<%= DropDownList3.ClientID %>" title="审批人">审批人</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="申请数量">申请数量</strong>和描述。<br />
                    结果：编号仍保持固定宽度，输入区域随容器伸缩，原输入不丢失。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：假设行的总宽度是 <code>100px</code>，行的属性 <code>ColumnWidths</code>="<code>20px</code> <code>50%</code> <code>50%</code>"，则：</p>
            <ul>
                <li>第一个字段宽度：<code>20px</code></li>
                <li>第二个字段宽度：<code>40px</code></li>
                <li>第三个字段宽度：<code>40px</code></li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnWidths</code>（<strong class="example-control-reference" data-example-control="FormRowExample1" title="第 1 个表单行">第 1 个表单行</strong>、<strong class="example-control-reference" data-example-control="FormRowExample2" title="第 2 个表单行">第 2 个表单行</strong>、<strong class="example-control-reference" data-example-control="FormRowExample3" title="第 3 个表单行">第 3 个表单行</strong>、<strong class="example-control-reference" data-example-control="FormRowExample4" title="第 4 个表单行">第 4 个表单行</strong>、<strong class="example-control-reference" data-example-control="FormRowExample5" title="第 5 个表单行">第 5 个表单行</strong>）：各组分别设为<code>20px 50% 50%</code>、<code>20px 100%</code>。</li>
                <li><code>IsFluid</code>（<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单">表单</strong>）：表单随父容器伸缩。</li>
            </ul>
        </section>
    </template>
</body>
</html>
