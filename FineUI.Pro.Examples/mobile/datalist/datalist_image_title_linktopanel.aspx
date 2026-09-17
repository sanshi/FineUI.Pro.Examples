<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_image_title_linktopanel.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_image_title_linktopanel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../../res/css/datalist.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" AutoScroll="true" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="列表" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Panel ID="Panel2" runat="server" ShowHeader="false" ShowBorder="false" Hidden="true"
            BodyPadding="10px" IsViewPort="true" Layout="Fit">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" runat="server" Title="Panel2" HeaderStyle="true">
                    <Items>
                        <f:Button ID="Button4" runat="server" Size="Small" Text="后退" ClickHandler="onBacktoPanel1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Label runat="server" ID="Label2" EncodeText="false"></f:Label>
            </Items>
        </f:Panel>
    </form>
    <script>

        var panel1 = '<%= Panel1.ClientID %>';
        var dataList1 = '<%= DataList1.ClientID %>';

        var panel2 = '<%= Panel2.ClientID %>';
        var label2 = '<%= Label2.ClientID %>';
        var toolbar2 = '<%= Toolbar2.ClientID %>';


        function onBacktoPanel1Click(event) {
            F.slideRight(panel2, panel1);
        }

        F.ready(function () {

            F(dataList1).el.on('click', '.f-datalist-item-inner', function (event) {
                var innerEl = $(this);

                var text = innerEl.find('.item-text').text();
                var desc = innerEl.find('.item-desc').text();
                var imageUrl = innerEl.find('.item-img').attr('src');
                F(toolbar2).setTitle(text);
                F(label2).setValue('<div style="text-align:center;margin-bottom:15px;"><img style="width:60px;" src="' + imageUrl + '"/></div>' + desc);


                F.slideLeft(panel1, panel2);
            });

        });

    </script>
</body>
</html>
