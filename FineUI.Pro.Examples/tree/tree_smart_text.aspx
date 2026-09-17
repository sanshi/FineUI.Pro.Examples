<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_smart_text.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_smart_text" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-tree-minimode-list .f-tree-minimode-icon {
            font-size: 24px;
            min-width: 24px;
            line-height: 24px !important;
        }

        .f-tree-minimode-list .f-tree-minimode-icon.f-tree-custom-icon {
            height: 24px !important;
        }

        .f-tree-minimode-list .f-tree-minimode-text {
            display: block;
            font-size: 10px;
            margin-top: 5px;
            opacity: 0.8;
            filter: alpha(opacity=80);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="300px" Height="400px" ShowHeader="false" EnableSingleClickExpand="true" EnableCollapse="false" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true" IconFont="_Home">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian" Leaf="true">
                        </f:TreeNode>
                        <f:TreeNode Text="漯河" NodeID="luohe" Leaf="true" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden" Leaf="true">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc" Leaf="true">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
                <f:TreeNode Text="美国" Expanded="true" NodeID="mg" IconFont="_Plane" Icon="Cake">
                    <f:TreeNode Text="加利福尼亚州" NodeID="mg-jlfny" Leaf="true">
                    </f:TreeNode>
                    <f:TreeNode Text="马萨诸塞州" Expanded="true" NodeID="mg-mszs" Leaf="true">
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <f:CheckBox ID="cbxMiniMode" ShowLabel="false" runat="server" Text="启用微型模式" OnCheckedChanged="cbxMiniMode_CheckedChanged">
        </f:CheckBox>
        <br />
        <br />
        注：微型模式下默认显示顶层节点文本，所以将此示例废弃。
    </form>
</body>
</html>
