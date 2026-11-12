<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twintriggerbox_blur.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.twintriggerbox_blur" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10" EnableCollapse="false" Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TwinTriggerBox ID="TwinTriggerBox1" ShowLabel="false" Trigger1Icon="Clear" ShowTrigger1="false" EmptyText="搜索用户名" Trigger2Icon="Search"
                    OnTrigger1Click="TwinTriggerBox1_Trigger1Click" OnTrigger2Click="TwinTriggerBox1_Trigger2Click" runat="server">
                    <Listeners>
                        <f:Listener Event="blur" Handler="onTwinTriggerBox1Blur" />
                    </Listeners>
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>


    </form>

    <script>

        // 记录上一次 TwinTriggerBox1 的值
        var __lastTriggerBoxValue;

        function onTwinTriggerBox1Blur(event) {
            var value = this.getValue();
            // 值改变时才回发
            if (value !== __lastTriggerBoxValue) {
                __lastTriggerBoxValue = value;

                F.customEvent('TwinTriggerBox1Blur');
            }
        }

        function updateLastTriggerBoxValue(text) {
            __lastTriggerBoxValue = text;
        }

        // 设置 __lastTriggerBoxValue 初始值
        var TwinTriggerBox1ClientID = '<%= TwinTriggerBox1.ClientID %>';
        F.ready(function () {
            __lastTriggerBoxValue = F(TwinTriggerBox1ClientID).getValue();
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示双触发器的搜索与取消，并在输入变化后离开字段时自动处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>失去焦点后处理</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= TwinTriggerBox1.ClientID %>" title="搜索用户名">搜索用户名</strong>中输入<code>lisi</code>，再点击页面空白处。<br />
                    结果：回发后，后台显示当前关键词的搜索提示，并显示清空图标；本页用提示演示搜索动作。
                </li>
                <li>
                    再次聚焦输入框，不修改文字就离开。<br />
                    结果：当前值与上次处理值相同，不重复触发变化处理。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：文本输入框失去焦点时，触发后台搜索事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>blur</code>（<strong class="example-control-reference" data-example-control="<%= TwinTriggerBox1.ClientID %>" title="搜索用户名">搜索用户名</strong>）：客户端只在失焦且文字与上次不同后发起处理，避免未改值时重复执行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
