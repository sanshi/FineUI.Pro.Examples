<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tags_tree_checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tags_tree_checkbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉树" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EnableMultiSelect="true" Values="henan,anhui" Text="河南省,安徽省" CustomData="true" MultiSelectMode="Tags">
                    <PopPanel>
                        <f:Tree ID="Tree1" ShowHeader="false" Hidden="true" runat="server" EnableCheckBox="true">
                            <Nodes>
                                <f:TreeNode Text="中国" NodeID="china" Expanded="true">
                                    <f:TreeNode Text="河南省" NodeID="henan" Expanded="true">
                                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
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
                                            <f:TreeNode Text="蜀山区" Expanded="false" NodeID="shushanqu">
                                                <f:TreeNode Text="金色池塘小区" NodeID="golden">
                                                </f:TreeNode>
                                                <f:TreeNode Text="梦圆小区" NodeID="mengyuan">
                                                </f:TreeNode>
                                                <f:TreeNode Text="桂花园小区" NodeID="guihuayuan">
                                                </f:TreeNode>
                                            </f:TreeNode>
                                            <f:TreeNode Text="包河区" Expanded="true" NodeID="baohequ">
                                                <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                                                </f:TreeNode>
                                            </f:TreeNode>
                                        </f:TreeNode>
                                    </f:TreeNode>
                                </f:TreeNode>
                            </Nodes>
                        </f:Tree>
                    </PopPanel>
                    <Listeners>
                        <f:Listener Event="poppanelshow" Handler="onPopPanelShow" />
                        <f:Listener Event="tagclose" Handler="onTagClose" />
                    </Listeners>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        注：
        <ul>
            <li>自定义数据来源时（CustomData=true），需要同时设置 Value 和 Text 属性来初始化下拉框。</li>
            <li>下拉框的值对应于树控件的复选框，而不是树控件的选中项。</li>
        </ul>

    </form>
    <script>
        var ddbID = '<%= DropDownBox1.ClientID %>';
        var Tree1ID = '<%= Tree1.ClientID %>';

        // 将下拉框的值更新到树控件
        function updateTreeCheckedNodes() {
            var nodes = F(ddbID).getValue();

            F.noEvent(function () {
                F(Tree1ID).checkNodes(nodes, {
                    keep: false // 是否保持已选中复选框的状态（false表示在执行本次操作之前，取消已选中的复选框）
                });
            });
        }

        function onPopPanelShow(event) {
            updateTreeCheckedNodes();
        }

        function onTagClose(event, tagValue) {
            updateTreeCheckedNodes();
        }

        F.ready(function () {

            var tree1 = F(Tree1ID);
            tree1.on('nodecheck', function (event, nodeId, checked) {

                var values = [], texts = [];
                var checkedNodes = tree1.getCheckedNodes(true);
                $.each(checkedNodes, function (index, node) {
                    values.push(node.id);
                    texts.push(node.text);
                });

                F(ddbID).setValue(values, texts);
            });

        });

    </script>
</body>
</html>
