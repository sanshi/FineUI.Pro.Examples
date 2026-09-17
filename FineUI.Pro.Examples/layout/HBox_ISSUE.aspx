<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HBox_ISSUE.aspx.cs" Inherits="FineUI.Pro.Examples.test.HBox_ISSUE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />

        <f:Panel ID="Panel1" Title="Panel1" runat="server" AutoScroll="true"
            ShowBorder="true" EnableCollapse="false"
            ShowHeader="true" Layout="HBox" IsFluid="true">
            <Items>
                <f:Panel ID="Panel2" Title="Panel2" runat="server" ShowBorder="true" ShowHeader="true" BoxFlex="2" Layout="VBox" Margin="0 5px 0 0">
                    <Items>
                        <f:TextBox ID="txtFirstName" Label="用户名" runat="server" MaxLength="20" Required="true" ShowRedStar="true"></f:TextBox>
                        <f:TextBox ID="txtCompanyName" runat="server" MaxLength="100" Label="公司名称"></f:TextBox>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>


        注：如果设置了 Panel1 的 AutoScroll="true" 属性，每次缩小页面宽度时，都会先出现横向滚动条，此时计算的高度就会多出17px。
        所以在 HBox 的布局代码中： 
        <br />
        var bodyHeight = me._fjs_getBodyElHeight();
        <br />
        由下述代码取代：
        <br />
		var bodyHeight = util._fjs_noScrollbarHeight(me._fjs_bodyEl);


    </form>
</body>
</html>
