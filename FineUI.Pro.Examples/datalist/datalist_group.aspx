<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist_group.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_group" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>分组与模板</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="700" Title="分组与模板" BodyPadding="10">
            <Items>
                <f:DataList ID="DataList1" runat="server" EnableGroup="true" EnableSelect="true">
                    <Items>
                        <f:DataListItem Text="北京" Value="beijing" Group="华北" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="天津" Value="tianjin" Group="华北" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="上海" Value="shanghai" Group="华东" NavigateUrl="#details" ShowArrow="true" />
                        <f:DataListItem Text="杭州" Value="hangzhou" Group="华东" NavigateUrl="#details" ShowArrow="true" />
                    </Items>
                    <Listeners>
                        <f:Listener Event="itemclick" Handler="onDataListItemClick" />
                    </Listeners>
                </f:DataList>
            </Items>
        </f:Panel>
        <f:Label ID="labResult" runat="server" Text="请点击城市。" />
        <p>分组、右侧箭头和列表项 HTML 模板均属于 DataList 自身能力。点击城市更新下方结果，不使用移动布局或切页动画。</p>
    </form>
    <script>
        function onDataListItemClick(event, itemValue) {
            event.preventDefault();
            F('labResult').setValue('当前项：' + itemValue);
        }

    </script>
</body>
</html>
