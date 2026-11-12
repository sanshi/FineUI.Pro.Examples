<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tree_checkbox.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tree_checkbox" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EnableMultiSelect="true" Values="henan,anhui" Text="河南省,安徽省" CustomData="true">
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
                    </Listeners>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>



    </form>
    <script>
        var ddbID = '<%= DropDownBox1.ClientID %>';
        var Tree1ID = '<%= Tree1.ClientID %>';

        function onPopPanelShow(event) {
            var nodes = this.getValue();

            F.noEvent(function () {
                F(Tree1ID).checkNodes(nodes, {
                    keep: false // 是否保持已选中复选框的状态（false表示在执行本次操作之前，取消已选中的复选框）
                });
            });

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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把树的复选框状态同步到自定义<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>勾选树节点</h3>
            <ol>
                <li>
                    展开<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉树">下拉树</strong>，勾选<code>河南省</code>下的“驻马店市”。<br />
                    结果：该节点加入现有选择，对应值为 <code>zhumadian</code>；单纯点击节点文字与勾选复选框是不同操作。
                </li>
                <li>
                    点击面板外空白处收起，再点击<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />
                    结果：回发后由后台显示当前树节点文字和标识。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>自定义数据来源时（<code>CustomData</code>=<code>true</code>），需要同时设置 <code>Value</code> 和 <code>Text</code> 属性来初始化<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>。</li>
                <li><strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>的值对应于树控件的复选框，而不是树控件的选中项。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>setValue(value, text)</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：自定义面板完成选择后同时写入业务值和显示文字；多选时传入一一对应的数组。</li>
                <li><code>CustomData</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>）：通过页面脚本同步值和文字，而非直接采用默认数据控件的选中项。 本页声明值为 <code>true</code>。</li>
                <li><code>EnableCheckBox</code>（<strong class="example-control-reference" data-example-control="<%= Tree1.ClientID %>" title="Tree">Tree</strong>）：为树显示复选框，选择集合来自勾选状态。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
