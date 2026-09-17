<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_noheader_buttongroup.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_noheader_buttongroup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mybuttongroup .f-btn {
            border-width: 0;
            border-radius: 0;
            margin-bottom: 5px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .mytabstrip {
            border-left-width: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowHeader="false" ShowBorder="true" IsFluid="true" Height="450px"
            Layout="HBox">
            <Items>
                <f:ButtonGroup ID="ButtonGroup1" CssClass="mybuttongroup f-state-default" EnablePressGroup="true" Layout="VBox" runat="server" Vertical="true" Width="200px">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="标签一" Icon="Cake" EnablePress="true">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="标签二" IconFont="_Bank" EnablePress="true" Pressed="true">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="标签三" IconFont="_Group" EnablePress="true">
                        </f:Button>
                    </Items>
                    <Listeners>
                        <f:Listener Event="presschange" Handler="onButtonGroupPressChange" />
                    </Listeners>
                </f:ButtonGroup>
                <f:TabStrip ID="TabStrip1" CssClass="mytabstrip" EnableTabCloseMenu="true" BoxFlex="1" ShowBorder="false" ShowTabHeader="false" runat="server" ActiveTabIndex="1" AnimationType="Fade">
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
                        <f:Tab ID="Tab3" Title="标签三" BodyPadding="10px" EnableClose="true" runat="server" Layout="VBox">
                            <Items>
                                <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                                <f:TabStrip ID="TabStrip2" BoxFlex="1" EnableTabCloseMenu="true"
                                    ShowBorder="true" runat="server" ActiveTabIndex="1">
                                    <Tabs>
                                        <f:Tab ID="Tab4" Title="标签四" EnableClose="false" BodyPadding="10px" runat="server">
                                            <Items>
                                                <f:Label ID="Label1" Text="标签四中的文本" runat="server" />
                                            </Items>
                                        </f:Tab>
                                        <f:Tab ID="Tab5" Title="标签五" EnableClose="false" BodyPadding="10px" runat="server">
                                            <Items>
                                                <f:Label ID="Label2" Text="标签五中的文本" runat="server" />
                                            </Items>
                                        </f:Tab>
                                    </Tabs>
                                </f:TabStrip>
                            </Items>
                        </f:Tab>
                    </Tabs>
                </f:TabStrip>
            </Items>
        </f:Panel>
        <br />
    </form>
    <script>

        var tabStrip1 = '<%= TabStrip1.ClientID %>';


        function onButtonGroupPressChange(event, btn) {
            var btnIndex = btn.el.index('.f-btn');

            // 激活相应的选项卡
            F(tabStrip1).getItem(btnIndex).activate();
        }


    </script>
</body>
</html>
