<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_chrome_61_issue.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_chrome_61_issue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 
        
        浏览器：Chrome 版本 61.0.3163.100（正式版本） （32 位）
        问题：打开页面后，折叠图标可见，而折叠图标后的文件夹图标消失了，显示隐藏列或者折叠面板后，文件件图标出现了。
        说明：
            1. 此问题仅存在于Chrome 61版本中，360浏览器极速模式（Chrome v55）没有问题，Firefox，Edge，IE没有问题。
            2. Pane1的Layout=Fit|VBox情况下出现。但是相同情况下的树控件没有问题。

        解决：
            在 F.Grid.css 中增加补丁样式：
            .f-grid-cell-text > .f-tree-cell-icon {
	            display: block;
	            float: left;
            }

            注意，这个CSS不能推广到Tree控件中，可能会存在其他问题。等Chrome版本升级后，可以删除此补丁样式。

    --%>

    <style>
        /*
        .f-panel-viewport {
            position: static !important;
        }
        */
        .f-grid-cell-text {
            font-size: 16px;
            line-height: 16px;
        }

            .f-grid-cell-text .f-tree-cell-icon {
                display: block;
                width: 18px;
                height: 16px;
                line-height: 16px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" IsViewPort="true" runat="server" Margin="5"
            Layout="Fit"
            ShowBorder="false" ShowHeader="false">
            <Items>
                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="树表格"
                    runat="server" EnableCollapse="false"
                    EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
                    <Columns>
                        <f:RowNumberField />
                        <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                        <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                        <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                        <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
        <%--<f:Panel ID="Panel2" IsViewPort="true" runat="server" Margin="5"
            Layout="Fit"
            ShowBorder="false" ShowHeader="false">
            <Items>
                <f:Label runat="server" Text="HAHA"></f:Label>
            </Items>
        </f:Panel>--%>
    </form>
</body>
</html>
