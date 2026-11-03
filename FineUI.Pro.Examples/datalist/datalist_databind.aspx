<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist_databind.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_databind" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>数据绑定与追加</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="数据绑定与追加" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server" DataTextField="Name" DataValueField="Id" />
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom">
                    <Items>
                        <f:Button ID="btnReload" runat="server" Text="重新加载" OnClick="btnReload_Click" CssClass="marginr" />
                        <f:Button ID="btnAppend" runat="server" Text="追加数据" OnClick="btnAppend_Click" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <f:Label ID="labResult" runat="server" Text="数据数量：3" />
        <p>首次加载三座城市。重新加载会倒序绑定原始数据并重置追加批次；每次追加两座城市，各批次使用不同的业务值。</p>
    </form>
</body>
</html>
