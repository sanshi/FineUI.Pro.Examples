<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_progress.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_progress" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:NumberBox ID="NumberBox1" Width="500" Text="25" runat="server" DisplayType="Progress">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox2" Width="500" Text="50" runat="server" DisplayType="Progress">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox3" Width="500" Text="75" runat="server" DisplayType="Progress" ProgressTextVisible="true">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox4" Width="500" Text="95" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <br />
        <f:NumberBox ID="NumberBox5" Width="500" Text="25" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox6" Width="500" Text="50" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox7" Width="500" Text="75" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <f:NumberBox ID="NumberBox8" Width="500" Text="95" runat="server" DisplayType="Progress" ProgressTextVisible="true" ProgressTextInside="true" ProgressHeight="15">
        </f:NumberBox>
        <br />
        <br />
        <br />
        <f:Button ID="ButtonExample1" ClientIDMode="Static" Text="0%" ClickHandler="onChangeTo0Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="25%" ClickHandler="onChangeTo25Click" runat="server" MarginRight="5"></f:Button>
        <f:Button ID="ButtonExample3" ClientIDMode="Static" Text="50%" ClickHandler="onChangeTo50Click" runat="server" MarginRight="5"></f:Button>
        <f:Button Text="75%" ClickHandler="onChangeTo75Click" runat="server" MarginRight="5"></f:Button>
        <f:Button ID="ButtonExample5" ClientIDMode="Static" Text="100%" ClickHandler="onChangeTo100Click" runat="server" MarginRight="5"></f:Button>
        <br />
        <br />
    </form>
    <script>
        var NumberBox1ClientID = '<%= NumberBox1.ClientID %>';
        var NumberBox2ClientID = '<%= NumberBox2.ClientID %>';
        var NumberBox3ClientID = '<%= NumberBox3.ClientID %>';
        var NumberBox4ClientID = '<%= NumberBox4.ClientID %>';
        var NumberBox5ClientID = '<%= NumberBox5.ClientID %>';
        var NumberBox6ClientID = '<%= NumberBox6.ClientID %>';
        var NumberBox7ClientID = '<%= NumberBox7.ClientID %>';
        var NumberBox8ClientID = '<%= NumberBox8.ClientID %>';

        function changeTo(num) {
            F(NumberBox1ClientID).setValue(num);
            F(NumberBox2ClientID).setValue(num);
            F(NumberBox3ClientID).setValue(num);
            F(NumberBox4ClientID).setValue(num);
            F(NumberBox5ClientID).setValue(num);
            F(NumberBox6ClientID).setValue(num);
            F(NumberBox7ClientID).setValue(num);
            F(NumberBox8ClientID).setValue(num);
        }

        function onChangeTo0Click(event) {
            changeTo(0);
        }

        function onChangeTo25Click(event) {
            changeTo(25);
        }

        function onChangeTo50Click(event) {
            changeTo(50);
        }

        function onChangeTo75Click(event) {
            changeTo(75);
        }

        function onChangeTo100Click(event) {
            changeTo(100);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示把数字值显示为进度条，并对比进度文字位置和条形高度。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>批量改变进度</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="ButtonExample3" title="50%">50%</strong>。<br />
                    结果：浏览器把八个进度条都改为 <strong class="example-control-reference" data-example-control="ButtonExample3" title="50%">50%</strong>，进度宽度和可见文字一起更新，无需回发。
                </li>
                <li>
                    分别点击<strong class="example-control-reference" data-example-control="ButtonExample1" title="0%">0%</strong>和<strong class="example-control-reference" data-example-control="ButtonExample5" title="100%">100%</strong>。<br />
                    结果：所有进度条分别显示空进度和满进度；右侧文字与内嵌文字采用同一个数值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（本页全部数字输入框，如<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="第 1 个数字输入框">第 1 个数字输入框</strong>）：设为 <code>Progress</code>，把数字值显示为进度条。</li>
                <li><code>ProgressTextVisible</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox3.ClientID %>" title="第 3 个数字输入框">第 3 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox4.ClientID %>" title="第 4 个数字输入框">第 4 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox5.ClientID %>" title="第 5 个数字输入框">第 5 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox6.ClientID %>" title="第 6 个数字输入框">第 6 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox7.ClientID %>" title="第 7 个数字输入框">第 7 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox8.ClientID %>" title="第 8 个数字输入框">第 8 个数字输入框</strong>）：控制是否显示百分比文字。</li>
                <li><code>ProgressTextInside</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox5.ClientID %>" title="第 5 个数字输入框">第 5 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox6.ClientID %>" title="第 6 个数字输入框">第 6 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox7.ClientID %>" title="第 7 个数字输入框">第 7 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox8.ClientID %>" title="第 8 个数字输入框">第 8 个数字输入框</strong>）：后四个进度条设为 <code>true</code>，把文字放入条内。</li>
                <li><code>ProgressHeight</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox4.ClientID %>" title="第 4 个数字输入框">第 4 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox5.ClientID %>" title="第 5 个数字输入框">第 5 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox6.ClientID %>" title="第 6 个数字输入框">第 6 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox7.ClientID %>" title="第 7 个数字输入框">第 7 个数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= NumberBox8.ClientID %>" title="第 8 个数字输入框">第 8 个数字输入框</strong>）：部分进度条设为 <code>15</code>，比较不同条形高度。</li>
                <li><code>setValue()</code>（本页全部数字输入框，如<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="第 1 个数字输入框">第 1 个数字输入框</strong>）：客户端按钮统一更新全部进度条。</li>
            </ul>
        </section>
    </template>
</body>
</html>
