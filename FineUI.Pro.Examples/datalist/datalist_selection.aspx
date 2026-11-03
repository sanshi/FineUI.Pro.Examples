<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="datalist_selection.aspx.cs" Inherits="FineUI.Pro.Examples.datalist.datalist_selection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>选择与清空</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" IsFluid="true" MaxWidth="1000" ShowHeader="false" ShowBorder="false" Layout="Block" BlockConfigSpace="20"
            MarginBottom="20">
            <Items>
                <f:Panel ID="PanelSingle" runat="server" Block="12" BlockMD="4" Title="单选" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListSingle" runat="server" EnableSelect="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelMulti" runat="server" Block="12" BlockMD="4" Title="多选（按住 Ctrl 连选）" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListMulti" runat="server" EnableSelect="true" EnableMultiSelect="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelKeep" runat="server" Block="12" BlockMD="4" Title="多选（保持当前选择）" BodyPadding="10">
                    <Items>
                        <f:DataList ID="DataListKeep" runat="server" EnableSelect="true" EnableMultiSelect="true" KeepCurrentSelection="true">
                            <Items>
                                <f:DataListItem Text="北京" Value="beijing" />
                                <f:DataListItem Text="上海" Value="shanghai" />
                                <f:DataListItem Text="广州" Value="guangzhou" />
                            </Items>
                        </f:DataList>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Button ID="btnRead" runat="server" Text="读取当前选择" OnClick="btnRead_Click" CssClass="marginr" />
        <f:Button ID="btnAssign" runat="server" Text="后台赋值" OnClick="btnAssign_Click" CssClass="marginr" />
        <f:Button ID="btnClear" runat="server" Text="清空选择" OnClick="btnClear_Click" />
        <br />
        <f:Label ID="labResult" runat="server" Text="请读取当前选择。" />
        <p>单选每次保留一个城市；普通多选按住 Ctrl 连选，保持当前选择模式无需按键。后台赋值替换选择，ClearSelection 清空选择后可以再次回发读取。</p>
    </form>
</body>
</html>
