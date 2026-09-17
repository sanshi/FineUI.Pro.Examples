<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox_triggerboxurl.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.triggerbox_triggerboxurl" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="表单" ShowHeader="true" runat="server" LabelWidth="150px">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" Label="TriggerBox" TriggerIconUrl="~/res/icon/application_edit.png"
                    OnTriggerClick="tbxMyBox1_TriggerClick" EmptyText="打开弹出窗口" runat="server">
                </f:TriggerBox>
                <f:TwinTriggerBox ID="ttbxMyBox2" Label="TwinTriggerBox" OnTrigger1Click="ttbxMyBox2_Trigger1Click" OnTrigger2Click="ttbxMyBox2_Trigger2Click"
                    ShowTrigger1="false" EmptyText="搜索用户名" Trigger1IconUrl="~/res/icon/bullet_cross.png" Trigger2IconUrl="~/res/icon/zoom.png"
                    runat="server">
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>

        <f:Window ID="Window1" Title="弹出窗口" BodyPadding="10px" IsModal="true" Hidden="true"
            Target="Top" Width="450px" Height="300px"
            runat="server">
            <Items>
                <f:Button ID="btnCloseWindow" Text="关闭当前窗口" OnClick="btnCloseWindow_Click" runat="server">
                </f:Button>
            </Items>
        </f:Window>
    </form>
</body>
</html>
