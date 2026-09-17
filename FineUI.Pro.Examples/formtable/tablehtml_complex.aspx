<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_complex.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablehtml_complex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablehtml.css" />
    <link href="../res/css/tablehtml.css" rel="stylesheet" />
    <style>
        .tablehtml td.label1,
        .tablehtml td.label2 {
            width: 80px;
            text-align: center;
        }

        .tablehtml td.label {
            width: 120px;
            text-align: right;
        }

        .tablehtml td.label3 {
            width: 80px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml">
                <tr>
                    <td class="f-widget-content label1" rowspan="6">联系方式
                    </td>
                    <td class="f-widget-content label2" rowspan="3">订货
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货单位：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox1" runat="server" Label="订货单位" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货联系人：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox2" runat="server" Label="订货联系人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货联系电话：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox3" runat="server" Label="订货联系电话" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label2" rowspan="3">收货
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货单位：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox4" runat="server" Label="收货单位" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货联系人：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox5" runat="server" Label="收货联系人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货联系电话：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox6" runat="server" Label="收货联系电话" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
            <table class="tablehtml" style="margin-top: -1px;">
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>承办人：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox7" runat="server" Label="承办人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>销售代表：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox8" runat="server" Label="销售代表" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">起草人：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label1" runat="server" Label="起草人" ShowLabel="false" Text="三生石上">
                        </f:Label>
                    </td>
                    <td class="f-widget-content label">起草时间：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="labCurrentTime" runat="server" Label="起草时间" ShowLabel="false" Text="">
                        </f:Label>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">发货条件：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:TextArea ID="TextArea2" Height="50px" runat="server" Label="发货条件" ShowLabel="false" Text="">
                        </f:TextArea>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">备注：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:TextArea ID="TextArea3" Height="50px" runat="server" Label="备注" ShowLabel="false" Text="">
                        </f:TextArea>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="ContentPanel1"
            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <br />
        注：这个示例是由上下两个表格组成的。
    </form>
</body>
</html>
