<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="triggerbox.aspx.cs" Inherits="FineUI.Pro.Examples.form.triggerbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            ShowBorder="true" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="false" Readonly="false" TriggerIcon="Search"
                    EmptyText="打开弹出窗口" runat="server" EnableClickAction="true">
                    <Listeners>
                        <f:Listener Event="triggerclick" Handler="onMyBox1TriggerClick" />
                    </Listeners>
                </f:TriggerBox>
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
        <br />
        注：点击输入框即可弹出窗体（EnableClickAction=true）。
    </form>

    <script>
        var Window1ClientID = '<%= Window1.ClientID %>';

        // 点击触发器（或点输入框，EnableClickAction=true）：直接在客户端开窗，不回发
        function onMyBox1TriggerClick(event) {
            F(Window1ClientID).show();
        }

    </script>
</body>
</html>
