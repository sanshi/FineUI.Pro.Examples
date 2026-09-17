<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_simpleform.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablehtml_simpleform" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablehtml.css" />
    <style>
        .tablehtml1 {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

            .tablehtml1 td {
                border-width: 1px;
                border-style: solid;
                padding: 5px;
            }

                .tablehtml1 td > div {
                    display: block;
                    vertical-align: top;
                }

            .tablehtml1 .f-field {
                width: 100%;
                margin-bottom: 0 !important;
            }


        /* tablehtml2 */
        .tablehtml2 {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

            .tablehtml2 td {
                border-width: 1px;
                border-style: solid;
                padding: 5px;
            }

                .tablehtml2 td.label {
                    width: 100px;
                    text-align: right;
                }

                    .tablehtml2 td.label .redstar {
                        color: red;
                    }

                .tablehtml2 td > div {
                    display: block;
                    vertical-align: top;
                }

            .tablehtml2 .f-field {
                width: 100%;
                margin-bottom: 0 !important;
            }
    </style>
    <link href="../res/css/tablehtml.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml1">
                <tr>
                    <td class="f-widget-content">
                        <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" ShowRedStar="true">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content">
                        <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" TextMode="Password">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click"
            ValidateForms="ContentPanel1" ValidateTarget="Top" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <br />
        <f:ContentPanel ID="ContentPanel2" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml2">
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>用户名：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox1" runat="server" Label="用户名" ShowLabel="false" Required="true">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>密码：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox2" runat="server" Label="密码" ShowLabel="false" Required="true" TextMode="Password">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button ID="Button1" runat="server" Text="注册" OnClick="btnRegister_Click"
            ValidateForms="ContentPanel2" ValidateTarget="Top" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <br />
        <f:ContentPanel ID="ContentPanel3" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml">
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>用户名：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox3" runat="server" Label="用户名" ShowLabel="false" Required="true" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-header label"><span class="redstar">*</span>密码：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox4" runat="server" Label="密码" ShowLabel="false" Required="true" TextMode="Password" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button ID="Button2" runat="server" Text="注册" OnClick="btnRegister_Click"
            ValidateForms="ContentPanel3" ValidateTarget="Top" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <br />
        注：推荐使用表单的EnableTableStyle属性，更简单，参考示例：表格样式->表格样式（简单表单）。
    </form>
</body>
</html>
