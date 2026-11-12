<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="twintriggerbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.twintriggerbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px"  EnableCollapse="false"
            Title="表单" ShowHeader="true" runat="server">
            <Items>
                <f:TwinTriggerBox ID="ttbxMyBox2" ShowLabel="false" OnTrigger1Click="ttbxMyBox2_Trigger1Click" OnTrigger2Click="ttbxMyBox2_Trigger2Click"
                    Trigger1Icon="Clear" ShowTrigger1="false" EmptyText="搜索用户名" Trigger2Icon="Search"
                    runat="server">
                </f:TwinTriggerBox>
            </Items>
        </f:SimpleForm>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示双触发器的搜索与取消。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>搜索后再取消</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= ttbxMyBox2.ClientID %>" title="搜索用户名">搜索用户名</strong>中输入<code>admin</code>，点击搜索图标。<br />
                    结果：回发后，后台显示当前关键词的搜索提示，并显示清空图标；本页用提示演示搜索动作。
                </li>
                <li>
                    点击清空图标。<br />
                    结果：回发后，后台显示取消搜索提示，输入清空且清空图标隐藏。
                </li>
                <li>
                    保持输入为空，点击搜索图标。<br />
                    结果：回发后，后台提示先输入关键词，不执行有关键词的搜索动作。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Trigger1Icon</code>（<strong class="example-control-reference" data-example-control="<%= ttbxMyBox2.ClientID %>" title="搜索用户名">搜索用户名</strong>）：第一个图标用于清空并取消搜索。</li>
                <li><code>Trigger2Icon</code>（<strong class="example-control-reference" data-example-control="<%= ttbxMyBox2.ClientID %>" title="搜索用户名">搜索用户名</strong>）：第二个图标用于立即搜索。</li>
                <li><code>ShowTrigger1</code>（<strong class="example-control-reference" data-example-control="<%= ttbxMyBox2.ClientID %>" title="搜索用户名">搜索用户名</strong>）：初始为 <code>false</code>，搜索成功后显示，取消后隐藏。</li>
                <li><code>OnTrigger2Click</code>（<strong class="example-control-reference" data-example-control="<%= ttbxMyBox2.ClientID %>" title="搜索用户名">搜索用户名</strong>）：搜索图标的后台事件读取当前关键词。</li>
            </ul>
        </section>
    </template>
</body>
</html>
