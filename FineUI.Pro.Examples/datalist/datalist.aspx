<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础数据列表</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="城市列表" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server">
                    <Items>
                        <f:DataListItem Text="北京" Value="beijing" />
                        <f:DataListItem Text="上海" Value="shanghai" />
                        <f:DataListItem Text="广州" Value="guangzhou" />
                        <f:DataListItem Text="合肥" Value="hefei" NavigateUrl="https://fineui.com/" Target="_blank" />
                    </Items>
                </f:DataList>
            </Items>
        </f:Panel>
        <p>普通页面可以直接声明列表项，展示图片、文字和超链接；点击合肥在新页面打开官网。</p>
    </form>
</body>
</html>
