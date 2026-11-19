<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_buttongroup_changetext.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_buttongroup_changetext" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ButtonGroup ID="ButtonGroup1" runat="server">
                            <f:Button ID="Button1" Text="按钮一" IconAlign="Top" Icon="Email" runat="server" />
                            <f:Button ID="Button2" Text="按钮二" IconAlign="Bottom" Icon="Star" runat="server" />
                            <f:Button ID="Button3" Text="按钮三" IconAlign="Top" IconFont="_Camera" runat="server" />
                            <f:Button ID="Button4" Text="按钮四" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                        </f:ButtonGroup>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button runat="server" CssClass="marginr" ID="btnChangeButtonText" Text="修改[按钮四]的文本" OnClick="btnChangeButtonText_Click"></f:Button>
                <f:Button runat="server" ID="btnShowHideButton" Text="显示隐藏[按钮四]" OnClick="btnShowHideButton_Click"></f:Button>
            </Items>
        </f:Panel>
        <br />
        <f:ButtonGroup ID="ButtonGroup2" runat="server">
            <f:Button ID="Button5" Text="按钮五" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="Button6" Text="按钮六" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button7" Text="按钮七" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button8" Text="按钮八" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Button runat="server" CssClass="marginr" ID="btnChangeButtonText2" Text="修改[按钮八]的文本" OnClick="btnChangeButtonText2_Click"></f:Button>
        <f:Button runat="server" ID="btnShowHideButton2" Text="显示隐藏[按钮八]" OnClick="btnShowHideButton2_Click"></f:Button>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示按钮分组内文字变长、按钮隐藏与恢复后，分组重新计算布局。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>修改文字与显示状态</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnChangeButtonText.ClientID %>"
                        title="修改[按钮四]的文本">修改[按钮四]的文本</strong>。<br />
                    结果：后台给<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>"
                        title="按钮四">按钮四</strong>追加当前时间，再次点击恢复原文字，分组随文字宽度调整。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnShowHideButton.ClientID %>"
                        title="显示隐藏[按钮四]">显示隐藏[按钮四]</strong>。<br />
                    结果：后台隐藏或恢复<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>" title="按钮四">按钮四</strong>，分组边框及其它按钮重新衔接。
                </li>
                <li>
                    在下一组对<strong class="example-control-reference" data-example-control="<%= Button8.ClientID %>" title="按钮八">按钮八</strong>执行相同操作。<br />
                    结果：同样可以更新文字和显示状态，不需重新创建分组。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Text</code>（<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>" title="按钮四">按钮四</strong>、<strong
                        class="example-control-reference" data-example-control="<%= Button8.ClientID %>" title="按钮八">按钮八</strong>）：后台在原按钮上更新文字。</li>
                <li><code>Hidden</code>（<strong class="example-control-reference" data-example-control="<%= Button4.ClientID %>"
                        title="按钮四">按钮四</strong>、<strong class="example-control-reference" data-example-control="<%= Button8.ClientID %>"
                        title="按钮八">按钮八</strong>）：隐藏组内按钮并释放其布局空间。</li>
            </ul>
        </section>
    </template>
</body>
</html>
