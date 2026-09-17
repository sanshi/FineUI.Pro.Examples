<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="notify.aspx.cs" Inherits="FineUI.Pro.Examples.message.notify" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" runat="server" Title="创建通知对话框" LabelWidth="180px" BodyPadding="10px">
            <Items>
                <f:GroupPanel ID="GroupPanel2" Layout="Anchor" Title="常用属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxMessage" Required="true" ShowRedStar="true" Label="消息提示" Text="数据保存成功！">
                        </f:TextBox>
                        <f:NumberBox runat="server" ID="nbDisplayMilliseconds" Label="显示的毫秒数（0不消失）" Required="true" ShowRedStar="true" NoDecimal="true"
                            NoNegative="true" MaxValue="60000" Text="5000">
                        </f:NumberBox>
                        <f:CheckBox runat="server" ID="cbxDisplayProgress" Checked="true" Label="是否显示倒计时进度条"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxShowLoading" Checked="false" Label="是否显示正在加载图片"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxIsModal" Checked="false" Label="是否模式对话框"></f:CheckBox>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel ID="GroupPanel4" Layout="Anchor" Title="位置与排列" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxBodyPadding" Label="正文区域内边距" Text="10px">
                        </f:TextBox>
                        <f:DropDownList ID="rblPositionX" Label="横向显示位置" runat="server">
                            <f:ListItem Value="Left" Text="左侧" />
                            <f:ListItem Value="Center" Text="中间" />
                            <f:ListItem Value="Right" Text="右侧" Selected="true" />
                        </f:DropDownList>
                        <f:DropDownList ID="rblPositionY" Label="纵向显示位置" runat="server">
                            <f:ListItem Value="Top" Text="顶部" />
                            <f:ListItem Value="Center" Text="中间" />
                            <f:ListItem Value="Bottom" Text="底部" Selected="true" />
                        </f:DropDownList>
                        <f:DropDownList ID="ddlMessageAlign" Label="正文排列位置" runat="server">
                            <f:ListItem Value="Left" Text="靠左" Selected="true" />
                            <f:ListItem Value="Center" Text="居中" />
                            <f:ListItem Value="Right" Text="靠右" />
                        </f:DropDownList>
                    </Items>
                </f:GroupPanel>

                <f:GroupPanel ID="GroupPanel1" Layout="Anchor" Title="标题栏设置" runat="server">
                    <Items>
                        <f:CheckBox runat="server" ID="cbxShowHeader" Checked="true" OnCheckedChanged="cbxShowHeader_CheckedChanged" Label="是否显示标题栏">
                        </f:CheckBox>
                        <f:TextBox runat="server" ID="tbxTitle" Label="对话框标题" Text="">
                        </f:TextBox>
                        <f:CheckBox runat="server" ID="cbxEnableDrag" Checked="true" Label="是否可移动"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxEnableClose" Checked="true" Label="是否可关闭"></f:CheckBox>
                    </Items>
                </f:GroupPanel>

                <f:GroupPanel ID="GroupPanel3" Layout="Anchor" Title="其它属性" runat="server">
                    <Items>
                        <f:TextBox runat="server" ID="tbxID" Label="对话框ID"></f:TextBox>
                        <f:NumberBox runat="server" ID="nbWidth" NoDecimal="true" NoNegative="true" Label="对话框宽度" MinValue="200" MaxValue="900"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMinWidth" NoDecimal="true" NoNegative="true" Label="对话框最小宽度"></f:NumberBox>
                        <f:NumberBox runat="server" ID="nbMaxWidth" NoDecimal="true" NoNegative="true" Label="对话框最大宽度"></f:NumberBox>
                        <f:DropDownList ID="rblMessageBoxIcon" Label="消息图标" runat="server">
                            <f:ListItem Value="None" Text="无图标" Selected="true" />
                            <f:ListItem Value="Information" Text="消息" />
                            <f:ListItem Value="Warning" Text="警告" />
                            <f:ListItem Value="Question" Text="问题" />
                            <f:ListItem Value="Error" Text="错误" />
                            <f:ListItem Value="Success" Text="成功" />
                        </f:DropDownList>
                        <f:DropDownList ID="rblTarget" Label="弹出位置" runat="server">
                            <f:ListItem Value="Self" Text="当前页面" Selected="true" />
                            <f:ListItem Value="Parent" Text="父页面" />
                            <f:ListItem Value="Top" Text="顶层页面" />
                        </f:DropDownList>
                    </Items>
                </f:GroupPanel>



            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button Text="点击弹出通知对话框" runat="server" ID="btnHello" ValidateForms="SimpleForm1" OnClick="btnHello_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>

        <br />
        <br />


    </form>
    <script>
        function notifyHideCallback() {
            F.notify('通知框消失了！');
        }

    </script>
</body>
</html>
