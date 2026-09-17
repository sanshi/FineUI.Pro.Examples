<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_smart.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_smart" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="300px" Height="400px" ShowHeader="false" EnableSingleClickExpand="true" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true" NodeID="china" IconFont="_Home">
                    <f:TreeNode Text="河南省" Expanded="true" NodeID="henan">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                        <f:TreeNode Text="郑州市" NodeID="zhengzhou" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" Expanded="true" NodeID="ustc">
                                <f:TreeNode Text="化学与材料科学学院" NodeID="ustc-huaxue">
                                </f:TreeNode>
                                <f:TreeNode Text="管理学院" NodeID="ustc-guanli">
                                </f:TreeNode>
                                <f:TreeNode Text="国家同步辐射实验室" NodeID="ustc-fushe">
                                </f:TreeNode>
                                <f:TreeNode Text="火灾科学国家重点实验室（这一项很长很长很长很长很长很长很长很长）" NodeID="ustc-huozai">
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
                <f:TreeNode Text="美国" Expanded="true" NodeID="mg" IconFont="_Plane" Icon="Cake">
                    <f:TreeNode Text="加利福尼亚州" NodeID="mg-jlfny">
                        <f:TreeNode Text="斯坦福大学" NodeID="mg-stf">
                        </f:TreeNode>
                        <f:TreeNode Text="加州大学" NodeID="mg-jz" />
                    </f:TreeNode>
                    <f:TreeNode Text="马萨诸塞州" Expanded="true" NodeID="mg-mszs">
                        <f:TreeNode Text="哈佛大学" NodeID="mg-hf">
                        </f:TreeNode>
                        <f:TreeNode Text="麻省理工学院" NodeID="mg-mslg">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="nodeclick" Handler="onNodeClick" />
            </Listeners>
        </f:Tree>
        <br />
        <f:CheckBox ID="cbxHideHScrollbar" ShowLabel="false" runat="server" Text="隐藏水平滚动条" OnCheckedChanged="cbxHideHScrollbar_CheckedChanged">
        </f:CheckBox>
        <f:CheckBox ID="cbxHideVScrollbar" ShowLabel="false" runat="server" Text="隐藏垂直滚动条" OnCheckedChanged="cbxHideVScrollbar_CheckedChanged">
        </f:CheckBox>
        <br />
        <f:CheckBox ID="cbxExpanderToRight" ShowLabel="false" runat="server" Text="折叠图标移到右侧" OnCheckedChanged="cbxExpanderToRight_CheckedChanged">
        </f:CheckBox>
        <f:CheckBox ID="cbxHeaderStyle" ShowLabel="false" runat="server" Text="启用标题栏样式" OnCheckedChanged="cbxHeaderStyle_CheckedChanged">
        </f:CheckBox>
        <br />
        <f:CheckBox ID="cbxAllHeaderStyle" ShowLabel="false" runat="server" Text="启用全部标题栏样式" OnCheckedChanged="cbxAllHeaderStyle_CheckedChanged">
        </f:CheckBox>
        <f:CheckBox ID="cbxMiniMode" ShowLabel="false" runat="server" Text="启用微型模式" OnCheckedChanged="cbxMiniMode_CheckedChanged">
        </f:CheckBox>
        <br />
        <br />
        <f:Label runat="server" ID="labResult"></f:Label>
        <br />
        <br />
        <br />
        注：启用微型模式时，请同时启用如下属性：
        <ul>
            <li>MiniMode="true"
            </li>
            <li>HideHScrollbar="true"
            </li>
            <li>HideVScrollbar="true"
            </li>
            <li>ExpanderToRight="true"
            </li>
            <li>HeaderStyle="true"
            </li>
            <li>AllHeaderStyle="true"
            </li>
            <li>Width="60px" （建议微型模式的最小宽度为60px）
            </li>
        </ul>
        <br />
    </form>
    <script>
        var labResultClientID = '<%= labResult.ClientID %>';

        function onNodeClick(event, nodeId) {
            var tree = this;
            F(labResultClientID).setValue('你点击了树节点：' + tree.getNodeData(nodeId).text);
        }

    </script>
</body>
</html>
