<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menucheckbox.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menucheckbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="btnLangMenu" Text="系统语言" runat="server">
                            <Menu runat="server">
                                <f:MenuCheckBox Text="English" ID="MenuLangEnglish" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged"
                                    Checked="true" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="简体中文" ID="MenuLangZHCN" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="繁體中文" ID="MenuLangZHTW" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                            </Menu>
                        </f:Button>
                        <f:Button ID="btnSiteMenu" Text="喜欢的站点" runat="server">
                            <Menu runat="server">
                                <f:MenuCheckBox Text="baidu.com" ID="MenuSiteBaidu" OnCheckedChanged="MenuSite_CheckedChanged" Checked="true" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="google.com" ID="MenuSiteGoogle" Checked="true" OnCheckedChanged="MenuSite_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="microsoft.com" ID="MenuSiteMicrosoft" OnCheckedChanged="MenuSite_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Label ID="labLangResult" runat="server">
                </f:Label>
                <f:Label ID="labSiteResult" runat="server">
                </f:Label>
                <f:Button Text="获取喜欢的站点（客户端脚本）" runat="server" ClickHandler="onGetSiteMenuChecked"></f:Button>
            </Items>
        </f:Panel>
    </form>
    <script>
        var btnSiteMenuClientID = '<%= btnSiteMenu.ClientID %>';

        function onGetSiteMenuChecked(event) {
            var result = [];
            var checkedItems = F(btnSiteMenuClientID).menu.getCheckedItems();
            $.each(checkedItems, function(index, item) {
                result.push(item.getText());
            });

            F.alert('喜欢的站点：' + result.join(', '));
        }

    </script>
</body>
</html>
