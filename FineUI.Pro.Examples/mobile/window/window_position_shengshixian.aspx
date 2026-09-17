<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_shengshixian.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_shengshixian" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mybgpanel>.f-panel-bodyct>.f-panel-body {
            background-color: #FEF3D5;
            background-image: url(../../res/images/bg/small/3.jpg);
            background-position: right bottom;
            background-repeat: no-repeat;
        }

        .mywindow,
        .mywindow>.f-panel-bodyct>.f-panel-body {
            background-image: none;
            background-color: transparent;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mybgpanel" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" BodyPadding="10px"
            runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="选择省市县" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" CssClass="mywindow" ShowHeader="false" ShowBorder="false" Hidden="true" HideOnMaskClick="true" IsModal="true"
            BodyPadding="10px" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:SimpleForm runat="server" ID="SimpleForm1" ShowBorder="true" ShowHeader="false" BodyPadding="10px" CssClass="f-corner-all" Layout="VBox"
                    MessageTarget="None" LabelAlign="Right">
                    <Items>
                        <f:DropDownList ID="ddlSheng" Label="省份" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择省份！" runat="server" OnSelectedIndexChanged="ddlSheng_SelectedIndexChanged">
                        </f:DropDownList>
                        <f:DropDownList ID="ddlShi" Label="地区市" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择地区市！" runat="server" OnSelectedIndexChanged="ddlShi_SelectedIndexChanged" Enabled="false">
                        </f:DropDownList>
                        <f:DropDownList ID="ddlXian" ShowRedStar="true" CompareType="String" CompareValue="-1" CompareOperator="NotEqual"
                            CompareMessage="请选择县区市！" Label="县区市" runat="server" Enabled="false">
                        </f:DropDownList>
                        <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox">
                            <Items>
                                <f:Button runat="server" ID="Button3" Width="100px" Text="取消" MarginRight="10px" ClickHandler="onCloseWindow1Click"></f:Button>
                                <f:Button runat="server" ID="Button1" BoxFlex="1" Text="选择" ValidateForms="SimpleForm1" ValidateMessageBoxPlain="true"
                                    OnClick="Button1_Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>

            </Items>
        </f:Window>

    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }

    </script>
</body>
</html>
