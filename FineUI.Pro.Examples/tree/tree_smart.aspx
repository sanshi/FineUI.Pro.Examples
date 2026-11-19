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

        <br />
    </form>
    <script>
        var labResultClientID = '<%= labResult.ClientID %>';

        function onNodeClick(event, nodeId) {
            var tree = this;
            F(labResultClientID).setValue('你点击了树节点：' + tree.getNodeData(nodeId).text);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示树导航的微型模式、滚动条显示、展开图标位置和标题栏样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>切换导航外观</h3>
            <ul>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxHideHScrollbar").ClientID %>'
                        title="隐藏水平滚动条">隐藏水平滚动条</strong>，再取消勾选。<br />结果：开启后隐藏横向滚动条，关闭后恢复本页横向滚动条规则。</li>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxHideVScrollbar").ClientID %>'
                        title="隐藏垂直滚动条">隐藏垂直滚动条</strong>，再取消勾选。<br />结果：开启后隐藏纵向滚动条，关闭后恢复本页纵向滚动条规则。</li>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxExpanderToRight").ClientID %>'
                        title="折叠图标移到右侧">折叠图标移到右侧</strong>，再取消勾选。<br />结果：目录展开图标移动到右侧，取消后恢复原位置。</li>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxHeaderStyle").ClientID %>'
                        title="启用标题栏样式">启用标题栏样式</strong>，再取消勾选。<br />结果：当前树标题按本页对应样式切换，节点数据不变。</li>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxAllHeaderStyle").ClientID %>'
                        title="启用全部标题栏样式">启用全部标题栏样式</strong>，再取消勾选。<br />结果：当前树标题按本页对应样式切换，节点数据不变。</li>
                <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxMiniMode").ClientID %>'
                        title="启用微型模式">启用微型模式</strong>，再取消勾选。<br />结果：树切换微型导航外观，保留当前节点数据，取消后恢复完整文字导航。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><code>MiniMode</code>="<code>true</code>"</li>
                <li><code>HideHScrollbar</code>="<code>true</code>"</li>
                <li><code>HideVScrollbar</code>="<code>true</code>"</li>
                <li><code>ExpanderToRight</code>="<code>true</code>"</li>
                <li><code>HeaderStyle</code>="<code>true</code>"</li>
                <li><code>AllHeaderStyle</code>="<code>true</code>"</li>
                <li><code>Width</code>="<code>60px</code>" （建议微型模式的最小宽度为<code>60px</code>）</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MiniMode</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由对应复选框在浏览器切换，保留树数据及当前选择。</li>
                <li><code>HideHScrollbar</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由对应复选框在浏览器切换，保留树数据及当前选择。</li>
                <li><code>HideVScrollbar</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由对应复选框在浏览器切换，保留树数据及当前选择。</li>
                <li><code>ExpanderToRight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由对应复选框在浏览器切换，保留树数据及当前选择。</li>
                <li><code>HeaderStyle</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树">树</strong>）：由对应复选框在浏览器切换，保留树数据及当前选择。</li>
            </ul>
        </section>
    </template>
</body>
</html>
