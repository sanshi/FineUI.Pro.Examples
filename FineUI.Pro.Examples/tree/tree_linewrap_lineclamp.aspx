<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_linewrap_lineclamp.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_linewrap_lineclamp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .nodetitle {
            font-weight: bold;
        }

        /* 最多显示 2 行文字，超出则显示省略号 */
        .f-tree-node .f-tree-cell-text {
            white-space: normal;
            word-break: break-all;
            overflow: hidden;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            display: -webkit-box;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false" Width="350px" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode TextRawHtml="<span class='nodetitle'>驻马店市</span>，位于河南省南部，地处淮河流域，历史悠久，文化底蕴深厚。因古时设驿站而得名，素有“豫州之腹地、天下之最中”之称。农业发达，是全国重要的粮食生产基地，被誉为“中原粮仓”。" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
    </form>
</body>
</html>
