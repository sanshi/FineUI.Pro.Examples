<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_form_emptylabel.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_form_emptylabel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" IsFluid="true" runat="server"
            ShowBorder="false" ShowHeader="false" EnableTableStyle="true" MessageTarget="Qtip">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:Label runat="server"></f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" ForceSelection="false" Required="true" ShowRedStar="true"
                            EmptyText="请选择审批人" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="true" Required="true">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <f:Button ID="btnSubmitForm1" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm1_Click"
            ValidateForms="Form1" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <f:Form ID="Form2" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false"
            Layout="HBox" EnableTableStyle="true" MessageTarget="Qtip">
            <Items>
                <f:Panel ID="PanelExample1" runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Required="true" Label="国家"></f:TextBox>
                        <f:TextBox runat="server" Required="true" Label="邮编"></f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelExample2" runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Required="true" Label="省份"></f:TextBox>
                        <f:TextBox runat="server" Required="true" Label="城市"></f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelExample3" runat="server" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox">
                    <Items>
                        <f:TextBox ID="TextBoxExample5" runat="server" Required="true" Label="地址"></f:TextBox>
                        <f:Label runat="server"></f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Form>
        <f:Button ID="Button2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
            ValidateForms="Form2" MarginTop="5px">
        </f:Button>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在表格风格中保留空白单元格，使单列内容和不同列数的地址字段仍能对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>观察空白占位与多列地址</h3>
            <ul>
                <li>
                    对照第一组<strong class="example-control-reference" data-example-control="<%= Label4.ClientID %>" title="编号">编号</strong>右侧，以及地址组<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBoxExample5").ClientID %>' title="地址">地址</strong>下方。<br />
                    结果：空 Label 保留该单元格的空间和边线，其他字段不会自动填入空位。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTableStyle</code>（<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="第 1 个表单">第 1 个表单</strong>、<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="第 2 个表单">第 2 个表单</strong>）：让表单字段按表格风格显示。</li>
                <li><code>Layout</code>（<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="第 2 个表单">第 2 个表单</strong>）：<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="第 2 个表单">第二个表单</strong>采用 <code>HBox</code>，三个子面板各以 <code>VBox</code> 排列字段。</li>
                <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="第 1 个面板">第 1 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample2").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample3").ClientID %>' title="第 3 个面板">第 3 个面板</strong>）：三个地址子面板均分可用宽度。</li>
                <li><code>Text</code>（<strong class="example-control-reference" data-example-control="<%= Label3.ClientID %>" title="电话">电话</strong>、<strong class="example-control-reference" data-example-control="<%= Label16.ClientID %>" title="申请人">申请人</strong>、<strong class="example-control-reference" data-example-control="<%= Label4.ClientID %>" title="编号">编号</strong>）：空 Label 不设置文字，用于保留表格中的空白单元格。</li>
            </ul>
        </section>
    </template>
</body>
</html>
