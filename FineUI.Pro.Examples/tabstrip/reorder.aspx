<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reorder.aspx.cs" Inherits="FineUI.Pro.Examples.tabstrip.reorder" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>选项卡拖动排序与滚轮浏览</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" Width="360" Height="160" EnableTabMove="true" runat="server">
            <Tabs>
                <f:Tab ID="tabHome" Title="工作首页" BodyPadding="12" runat="server">
                    <Items>
                        <f:TextBox ID="tbxDraft" Label="工作草稿" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabOrders" Title="销售订单" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="销售订单页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabCustomers" Title="客户档案" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="客户档案页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabShipments" Title="发货记录" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="发货记录页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabInvoices" Title="发票管理" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="发票管理页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabReturns" Title="售后退货" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="售后退货页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabReports" Title="经营报表" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="经营报表页面" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="tabSettings" Title="业务设置" BodyPadding="12" runat="server">
                    <Items>
                        <f:Label Text="业务设置页面" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="btnFirst" Text="打开排序后的第一项" CssClass="marginr" OnClick="OpenFirst" runat="server" />
        <f:Button ID="btnHome" Text="回到工作首页" OnClick="OpenHome" runat="server" />
        <br />
        <f:Label ID="labResult" runat="server" />
        <p>在首页填写草稿，将“客户档案”拖到“工作首页”前，再点击“打开排序后的第一项”。点击“回到工作首页”可继续编辑草稿。把鼠标放在标题上滚动可浏览后面的页签，点击标题才会切页。</p>
    </form>
</body>
</html>
