<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_buttongroup_pressgroup_server.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_buttongroup_pressgroup_server" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ButtonGroup runat="server" EnablePressGroup="true">
            <f:Button ID="btnIcon1" Text="图标在左侧" EnablePress="true" Pressed="true" Icon="Email" runat="server" />
            <f:Button ID="btnIcon2" Text="图标在右侧" EnablePress="true" IconAlign="Right" Icon="Star" runat="server" />
            <f:Button ID="Button7" Text="图标在左侧" EnablePress="true" IconFont="_Home" runat="server" />
            <f:Button ID="Button8" Text="图标在右侧" EnablePress="true" IconAlign="Right" IconFont="_Car" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:ButtonGroup ID="ButtonGroup1" EnablePressGroup="true" runat="server">
            <f:Button ID="btnIcon3" Text="图标在上面" EnablePress="true" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="btnIcon4" Text="图标在下面" EnablePress="true" Pressed="true" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button9" Text="图标在上面" EnablePress="true" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button10" Text="图标在下面" EnablePress="true" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="只有图片的按钮："></f:Label>
        <f:ButtonGroup ID="ButtonGroup2" EnablePressGroup="true" runat="server">
            <f:Button ID="Button1" EnablePress="true" IconUrl="~/res/images/16/1.png" runat="server" />
            <f:Button ID="Button2" EnablePress="true" IconUrl="~/res/images/16/8.png" runat="server" />
            <f:Button ID="Button11" EnablePress="true" Pressed="true" IconFont="_Android" runat="server" />
            <f:Button ID="Button12" EnablePress="true" IconFont="_Apple" runat="server" />
            <f:Button ID="Button13" EnablePress="true" IconFont="_Car" runat="server" />
            <f:Button ID="Button14" EnablePress="true" IconFont="_Card" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="下面的按钮分组的按下状态改变时，会触发自定义回发事件："></f:Label>
        <f:ButtonGroup ID="ButtonGroup3" EnablePressGroup="true" runat="server">
            <Items>
                <f:Button ID="Button3" Text="按钮一" EnablePress="true" Size="Large" IconAlign="Top" Icon="Email" runat="server" />
                <f:Button ID="Button4" Text="按钮二" EnablePress="true" Pressed="true" Size="Large" IconAlign="Bottom" Icon="Star" runat="server" />
                <f:Button ID="Button5" Text="按钮三" EnablePress="true" Size="Large" IconAlign="Top" IconFont="_Camera" runat="server" />
                <f:Button ID="Button6" Text="按钮四" EnablePress="true" Size="Large" IconAlign="Bottom" IconFont="_Phone" runat="server" />
            </Items>
            <Listeners>
                <f:Listener Event="presschange" Handler="onButtonGroup3PressChange" />
            </Listeners>
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="可以不选（AllowNonePress=true）："></f:Label>
        <f:ButtonGroup ID="ButtonGroup4" EnablePressGroup="true" AllowNonePress="true" runat="server">
            <Items>
                <f:Button ID="Button15" Text="按钮一" EnablePress="true" Size="Large" IconAlign="Top" Icon="Email" runat="server" />
                <f:Button ID="Button16" Text="按钮二" EnablePress="true" Size="Large" IconAlign="Bottom" Icon="Star" runat="server" />
                <f:Button ID="Button17" Text="按钮三" EnablePress="true" Pressed="true" Size="Large" IconAlign="Top" IconFont="_Camera" runat="server" />
                <f:Button ID="Button18" Text="按钮四" EnablePress="true" Size="Large" IconAlign="Bottom" IconFont="_Phone" runat="server" />
            </Items>
            <Listeners>
                <f:Listener Event="presschange" Handler="onButtonGroup4PressChange" />
            </Listeners>
        </f:ButtonGroup>
        <br />
        <f:Label runat="server" Text="可以多选（AllowMultiPress=true）："></f:Label>
        <f:ButtonGroup ID="ButtonGroup5" EnablePressGroup="true" AllowMultiPress="true" runat="server">
            <Items>
                <f:Button ID="Button19" Text="按钮一" EnablePress="true" Size="Large" IconAlign="Top" Icon="Email" runat="server" />
                <f:Button ID="Button20" Text="按钮二" EnablePress="true" Size="Large" IconAlign="Bottom" Icon="Star" runat="server" />
                <f:Button ID="Button21" Text="按钮三" EnablePress="true" Size="Large" IconAlign="Top" IconFont="_Camera" runat="server" />
                <f:Button ID="Button22" Text="按钮四" EnablePress="true" Pressed="true" Size="Large" IconAlign="Bottom" IconFont="_Phone" runat="server" />
            </Items>
            <Listeners>
                <f:Listener Event="presschange" Handler="onButtonGroup5PressChange" />
            </Listeners>
        </f:ButtonGroup>

    </form>
    <script>

        function onButtonGroup3PressChange(event, btn) {
            F.customEvent('ButtonGroupItemPress', 'ButtonGroup3');
        }

        function onButtonGroup4PressChange(event, btn) {
            F.customEvent('ButtonGroupItemPress', 'ButtonGroup4');
        }

        function onButtonGroup5PressChange(event, btn) {
            F.customEvent('ButtonGroupItemPress', 'ButtonGroup5');
        }


    </script>
</body>
</html>
