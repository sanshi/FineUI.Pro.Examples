<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel_column.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.layout_panel_column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" IsFluid="true" MessageTarget="Qtip" BodyPadding="10px" Title="表单" runat="server">
            <Items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="" ShowBorder="false" Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label2" Width="100px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="用户名：">
                        </f:Label>
                        <f:TextBox ID="TextBox2" ShowLabel="false" Label="用户名" Required="true" Width="150px" CssClass="marginr" runat="server">
                        </f:TextBox>
                        <f:Button ID="Button3" Text="按钮一" CssClass="marginr" runat="server">
                        </f:Button>
                        <f:Button ID="Button4" Text="按钮二" runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" ShowHeader="false" ShowBorder="false" Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label1" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="作息起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker1" ShowLabel="false" Label="作息开始时间" Required="true" CssClass="marginr" Width="150px" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" ShowLabel="false" Label="作息结束时间" Required="true" CompareControl="DatePicker1" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" Width="150px" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="" runat="server">
                    <Items>
                        <f:Label ID="Label3" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="上班起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker3" ShowLabel="false" Label="上班开始时间" Required="true" CssClass="marginr" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker4" ShowLabel="false" Label="上班结束时间" Required="true" CompareControl="DatePicker3" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="" runat="server">
                    <Items>
                        <f:Label ID="Label4" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="工作时间：">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（小时）" Required="true" runat="server">
                        </f:TextBox>
                        <f:Label runat="server" Text="小时" MarginLeft="5px" MarginRight="10px">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（分钟）" Required="true" ID="TextBox3" runat="server">
                        </f:TextBox>
                        <f:Label ID="Label6" runat="server" Text="分钟" MarginLeft="5px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Button ID="Button1" Text="提交表单" ValidateForms="Form1" ValidateMessageBox="true" OnClick="Button1_Click" runat="server">
                </f:Button>
            </Items>
        </f:Form>
        <br />
        注意：
        <ul>
            <li>表单字段的ShowLabel=false，表单验证失败的对话框消息中用到了 Label 属性。
            </li>
            <li>表单验证失败的错误提示类型是Qtip，而不是默认的Side。
            </li>
        </ul>

    </form>
</body>
</html>
