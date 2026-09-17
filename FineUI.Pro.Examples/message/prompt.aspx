<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prompt.aspx.cs" Inherits="FineUI.Pro.Examples.message.prompt" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" runat="server" Title="创建输入对话框" LabelWidth="150px" BodyPadding="10px">
            <Items>
                <f:GroupPanel ID="GroupPanel2" Layout="Anchor" Title="常用属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxMessage" Required="true" ShowRedStar="true" Label="消息提示" Text="请输入你的住址？">
                        </f:TextBox>
                        <f:TextBox runat="server" ID="tbxDefaultValue" Label="输入框缺省值" Text="这是缺省地址">
                        </f:TextBox>
                        <f:TextBox runat="server" ID="tbxTitle" Label="对话框标题" Text="请输入">
                        </f:TextBox>
                        <f:CheckBox runat="server" ID="cbxEnableClose" Checked="true" Label="是否可关闭"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxRequired" Checked="false" Label="是否必填项"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxIsMultiLine" Checked="true" OnCheckedChanged="cbxIsMultiLine_CheckedChanged" Label="是否多行输入框">
                        </f:CheckBox>
                        <f:NumberBox runat="server" ID="nbMultiLineHeight" NoDecimal="true" NoNegative="true" Label="多行输入框高度" MinValue="80" MaxValue="300"
                            Text="100"></f:NumberBox>
                        <f:CheckBox runat="server" ID="cbxIsPassword" Checked="false" Hidden="true" Label="是否密码输入框"></f:CheckBox>
                        <f:RadioButtonList ID="rblMessageBoxIcon" Label="消息图标" ColumnNumber="3" runat="server">
                            <f:RadioItem Value="None" Text="无图标" Selected="true" />
                            <f:RadioItem Value="Information" Text="消息" />
                            <f:RadioItem Value="Warning" Text="警告" />
                            <f:RadioItem Value="Question" Text="问题" />
                            <f:RadioItem Value="Error" Text="错误" />
                            <f:RadioItem Value="Success" Text="成功" />
                        </f:RadioButtonList>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel ID="GroupPanel1" Layout="Anchor" Title="其它属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxID" Label="对话框ID"></f:TextBox>
                        <f:NumberBox runat="server" ID="nbWidth" NoDecimal="true" NoNegative="true" Label="对话框宽度" MinValue="200" MaxValue="900"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMinWidth" NoDecimal="true" NoNegative="true" Label="对话框最小宽度"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMaxWidth" NoDecimal="true" NoNegative="true" Label="对话框最大宽度"></f:NumberBox>
                        <f:RadioButtonList ID="rblTarget" Label="弹出位置" ColumnNumber="3" runat="server">
                            <f:RadioItem Value="Self" Text="当前页面" Selected="true" />
                            <f:RadioItem Value="Parent" Text="父页面" />
                            <f:RadioItem Value="Top" Text="顶层页面" />
                        </f:RadioButtonList>
                    </Items>
                </f:GroupPanel>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button Text="点击弹出输入对话框" runat="server" ID="btnHello" ValidateForms="SimpleForm1" OnClick="btnHello_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>

        <br />
        <br />


    </form>
    <script>
        function promptOKCallback(message) {
            var encodedMessage = F.htmlEncode(message).replace(/\r\n/ig, '\n').replace(/\r/ig, '\n').replace(/\n/ig, '<br/>');
            F.notify(F.rawHtml('你输入的住址是：' + encodedMessage));
        }

    </script>
</body>
</html>
