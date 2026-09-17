<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pagingtype.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pagingtype" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" />
                <f:BoundField Width="150px" DataField="Id" HeaderText="ID" />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <f:CheckBox runat="server" ID="cbxShowPagingMessage" Checked="true" Text="显示分页信息">
            <Listeners>
                <f:Listener Event="change" Handler="OnCheckBoxChange" />
            </Listeners>
        </f:CheckBox>
        <br />
        <br />
        分页工具栏的类型：
        <br />
        <br />
        <f:ButtonGroup ID="bgPagingType" runat="server" EnablePressGroup="true">
            <Items>
                <f:Button Text="Arrow" EnablePress="true" runat="server" />
                <f:Button Text="NumberBox" EnablePress="true" runat="server" />
                <f:Button Text="ArrowNumberBox" EnablePress="true" Pressed="true" runat="server" />
                <f:Button Text="NumberButton" EnablePress="true" runat="server" />
                <f:Button Text="ArrowNumberButton" EnablePress="true" runat="server" />
            </Items>
            <Listeners>
                <f:Listener Event="presschange" Handler="onButtonGroupPressChange" />
            </Listeners>
        </f:ButtonGroup>
        <br />
        数字分页按钮的个数：
        <br />
        <br />
        <f:DropDownList runat="server" ID="ddlMaxPagingNumberButton" Width="120px">
            <Items>
                <f:ListItem Text="5" Value="5" Selected="true" />
                <f:ListItem Text="8" Value="8" />
                <f:ListItem Text="10" Value="10" />
            </Items>
            <Listeners>
                <f:Listener Event="change" Handler="onDropDownListChange" />
            </Listeners>
        </f:DropDownList>
    </form>
    <script>

        var cbxShowPagingMessageClientID = '<%= cbxShowPagingMessage.ClientID %>';
        var bgPagingTypeClientID = '<%= bgPagingType.ClientID %>';
        var ddlMaxPagingNumberButtonClientID = '<%= ddlMaxPagingNumberButton.ClientID %>';
        

        function getPressedPaingType() {
            var pressedPaingType = '';
            $.each(F(bgPagingTypeClientID).items, function (index, item) {
                if (item.isPressed()) {
                    pressedPaingType = item.getText();
                    return false; // break
                }
            });
            return pressedPaingType;
        }

        function reloadPage() {
            var pressedPaingType = getPressedPaingType();
            window.location.href = './gridpaging_pagingtype.aspx?type=' + pressedPaingType + '&message=' + F(cbxShowPagingMessageClientID).isChecked() + '&maxnumberbutton=' + F(ddlMaxPagingNumberButtonClientID).getValue();
        }

        function OnCheckBoxChange(event, checked) {
            reloadPage();
        }

        function onButtonGroupPressChange(event, btnObj, btnChecked) {
            reloadPage();
        }

        function onDropDownListChange(event) {
            reloadPage();
        }

    </script>
</body>
</html>
