<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_beforehide_fconfirm.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_beforehide_fconfirm" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="350px" EnableTabCloseMenu="true" 
            ShowBorder="true" ActiveTabIndex="2" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三（关闭前弹出确认框）" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="beforehide" Handler="onTab3Beforehide" />
                    </Listeners>
                </f:Tab>
            </Tabs>
        </f:TabStrip>

    </form>

    <script>

        function onTab3Beforehide(event) {
            // this代表当前选项卡
            var tab = this;

            // F.confirm是异步函数，直接返回
            F.confirm({
                message: '关闭标签三？',
                ok: function () {
                    // 关闭选项卡（本过程中不触发事件）
                    F.noEvent(function () {
                        tab.hide();
                    });
                },
                cancel: function () {
                    // 啥也不做
                }
            });


            // 需要显式的返回 false，来阻止执行返回的脚本
            return false;
        }

    </script>
</body>
</html>
