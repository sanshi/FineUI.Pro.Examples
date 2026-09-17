<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_layout_contactus.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.tablehtml_layout_contactus" %>

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
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="false" EnableClose="false" EnableResize="true"
            Width="650px" BodyPadding="10px">
            <Items>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">
                    <table class="tablehtml">
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>姓：
                            </td>
                            <td class="f-widget-content content">
                                <f:TextBox ID="TextBox2" Label="姓" ShowLabel="false" Required="true" ShowRedStar="true" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                            <td class="f-widget-header label"><span class="redstar">*</span>名：
                            </td>
                            <td class="f-widget-content content">
                                <f:TextBox ID="TextBox4" Label="名" ShowLabel="false" Required="true" ShowRedStar="true" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>电子邮箱：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" ShowLabel="false" RegexPattern="EMAIL" MessageTarget="Qtip"
                                    RegexMessage="请输入有效的邮箱地址" runat="server">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>主题：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextBox ID="TextBox3" Required="true" ShowRedStar="true" Label="主题" ShowLabel="false" runat="server" MessageTarget="Qtip">
                                </f:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="f-widget-header label"><span class="redstar">*</span>消息正文：
                            </td>
                            <td class="f-widget-content" colspan="3">
                                <f:TextArea ID="TextArea1" Height="220px" Required="true" ShowRedStar="true" Label="消息正文" ShowLabel="false" MessageTarget="Qtip" runat="server">
                                </f:TextArea>
                            </td>
                        </tr>
                    </table>
                </f:ContentPanel>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="发送" IconFont="_Send" ValidateForms="ContentPanel1" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>

        注：推荐使用表单的EnableTableStyle属性，更简单，参考示例：表格样式->表格样式（联系我们）。
    </form>
</body>
</html>
