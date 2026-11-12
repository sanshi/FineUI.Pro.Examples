<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tree_checkbox_cascade.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tree_checkbox_cascade" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EnableMultiSelect="true" Values="luohe" Text="漯河市"  CustomData="true">
                    <PopPanel>
                        <f:Tree ID="Tree1" ShowHeader="false" Hidden="true" runat="server" EnableCheckBox="true" CascadeCheck="true">
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
                    deep: true, // 是否递归调用子节点
                    keep: false // 是否保持已选中复选框的状态（false表示在执行本次操作之前，取消已选中的复选框）
                });

                // 启用树控件的级联选择时，确保把树控件的选中值全部同步到下拉框
                syncToDropDownBox();
            });

        }

        // 将树控件的选中值同步到下拉框
        function syncToDropDownBox() {
            var values = [], texts = [];
            var checkedNodes = F(Tree1ID).getCheckedNodes(true);
            $.each(checkedNodes, function (index, node) {
                values.push(node.id);
                texts.push(node.text);
            });

            F(ddbID).setValue(values, texts);
        }

        F.ready(function () {

            F(Tree1ID).on('nodecheck', function (event, nodeId, checked) {
                // 加个延迟，等待复选框的级联选择完成
                window.setTimeout(function () {
                    syncToDropDownBox();
                });
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把树的复选框状态同步到自定义下拉框，并启用父子级联勾选。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box-checked" aria-hidden="true"></i>父子复选框联动</h3>
            <ol>
                <li>
                    勾选“河南省”的复选框。<br />
                    结果：其下可用子节点也随之勾选；页面等待级联完成后，把全部已勾选节点同步到下拉框。
                </li>
                <li>
                    取消“河南省”的复选框。<br />
                    结果：对应子节点也取消，读取的下拉值不再包含这一分支。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>自定义数据来源时（CustomData=true），需要同时设置 Value 和 Text 属性来初始化下拉框。</li>
                <li>下拉框的值对应于树控件的复选框，而不是树控件的选中项。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableCheckBox</code>：为树显示复选框，选择集合来自勾选状态。 本页声明值为 true。</li>
                <li><code>CascadeCheck</code>：勾选父节点后递归改变其子节点的复选框。 本页声明值为 true。</li>
            </ul>
        </section>
    </template>
</body>
</html>
