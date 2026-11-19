<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_display_time_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_display_time_confirmbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" Title="简单表单" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" DateFormatString="HH:mm:ss" Label="开始时间" EmptyText="请选择开始时间" ID="DatePicker1" ShowRedStar="true"
                    DisplayType="Time" ShowTodayButton="false" ShowConfirmButton="true" ConfirmToSelect="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="HH:mm:ss"
                    CompareOperator="GreaterThan" CompareMessage="结束时间应该大于开始时间" Label="结束时间" runat="server" ShowRedStar="true" DisplayType="Time"
                    ShowTodayButton="false" ShowConfirmButton="true" ConfirmToSelect="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示时间先暂存选择，点击<strong>确定</strong>后才提交当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择时间</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="开始时间">开始时间</strong>字段右侧的下拉图标。<br />
                    结果：显示本页时间面板，可同时调整时、分；输入框当前值仍可对照查看。
                </li>
                <li>
                    在面板中选择<code>09</code>时<code>30</code>分。<br />
                    结果：选择暂存在面板中；还没有执行选中事件，输入框或下方结果保持原值。
                </li>
                <li>
                    点击面板中的<strong>确定</strong>。<br />
                    结果：提交临时选择，回填输入框并收起弹层。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowConfirmButton</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="开始时间">开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>"
                        title="结束时间">结束时间</strong>）：显示面板中的<strong>确定</strong>按钮；是否延后提交选择由 <code>ConfirmToSelect</code> 控制。</li>
                <li><code>ConfirmToSelect</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="开始时间">开始时间</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker2.ClientID %>"
                        title="结束时间">结束时间</strong>）：将当前选择暂存在面板中，点击<strong>确定</strong>后才提交当前值并触发选中事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
