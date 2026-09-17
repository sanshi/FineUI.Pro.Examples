<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodeselect_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodeselect_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true"
            Title="树控件（多选）" EnableMultiSelect="true" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市" Expanded="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" NodeID="suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" NodeID="xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                        </f:TreeNode>
                        <f:TreeNode Text="黄山市" NodeID="huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="nodeselect" Handler="onTree1NodeSelect" />
                <f:Listener Event="nodedeselect" Handler="onTree1NodeDeselect" />
                <f:Listener Event="selectionchange" Handler="onTree1SelectionChange" />
            </Listeners>
        </f:Tree>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <br />
        事件列表（<a href="javascript:$('#result').html('');">clear</a>）：
        <ul id="result"></ul>
    </form>
    <script>

        function onTree1NodeSelect(event, nodeId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] nodeselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                nodeId));
        }

        function onTree1NodeDeselect(event, nodeId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] nodedeselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                nodeId));
        }

        function onTree1SelectionChange(event) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] selectionchange</li>',
                date.getMinutes(),
                date.getSeconds()));
        }

    </script>
</body>
</html>
