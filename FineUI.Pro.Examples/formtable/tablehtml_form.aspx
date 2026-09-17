<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_form.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablehtml_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablehtml.css" />
    <link href="../res/css/tablehtml.css" rel="stylesheet" />
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml">
                <tr>
                    <td class="f-widget-header label">标签：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label1" runat="server" Label="标签" ShowLabel="false" Text="标签的值">
                        </f:Label>
                    </td>
                    <td class="f-widget-header label">复选框：
                    </td>
                    <td class="f-widget-content content">
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框" ShowLabel="false">
                        </f:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>下拉列表：
                    </td>
                    <td class="f-widget-content content">
                        <f:DropDownList ID="DropDownList1" runat="server" Required="true" AutoSelectFirstItem="false" Label="下拉列表" ShowLabel="false" MessageTarget="Qtip">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                    </td>
                    <td class="f-widget-header label"><span class="redstar">*</span>文本框：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox1" runat="server" Label="文本框" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="ContentPanel1"
            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <f:ContentPanel ID="ContentPanel2" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml">
                <tr>
                    <td class="f-widget-header label">电话：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label3" Label="电话" ShowLabel="false" Text="0551-1234567" runat="server" />
                    </td>
                    <td class="f-widget-header label">申请人：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label16" runat="server" Label="申请人" ShowLabel="false" Text="admin">
                        </f:Label>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label">编号：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label4" Label="编号" ShowLabel="false" Text="200804170006" runat="server" />
                    </td>
                    <td class="f-widget-header label"><span class="redstar">*</span>电子邮箱：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox2" Required="true" Label="电子邮箱" ShowLabel="false" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>审批人：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:DropDownList ID="DropDownList3" Label="审批人" ShowLabel="false" runat="server" ForceSelection="false" Required="true"
                            EmptyText="请选择审批人" AutoSelectFirstItem="false" MessageTarget="Qtip">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>申请数量：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:NumberBox ID="NumberBox1" Label="申请数量" ShowLabel="false" NoDecimal="true" NoNegative="true"
                            MaxValue="1000" Required="true" runat="server" MessageTarget="Qtip" />
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>描述：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowLabel="false" Required="true" MessageTarget="Qtip">
                        </f:TextArea>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button ID="btnSubmitForm2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
            ValidateForms="ContentPanel2" MarginTop="5px">
        </f:Button>
        <br />
        <f:Button ID="btnSubmitAll" Text="验证两个表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitAll_Click"
            ValidateForms="ContentPanel1,ContentPanel2" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        注：推荐使用表单的EnableTableStyle属性，更简单，参考示例：表格样式->表格样式（表单）。
    </form>
</body>
</html>
