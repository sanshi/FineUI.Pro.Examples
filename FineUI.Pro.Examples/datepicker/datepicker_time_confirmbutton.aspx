<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_time_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_time_confirmbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd HH:mm:ss" Label="开始日期" EmptyText="请选择开始日期"
                    ID="DatePicker1" ShowRedStar="true" ShowTime="true" ShowConfirmButton="true" ConfirmToSelect="true">
                </f:DatePicker>
                <f:DatePicker ID="DatePicker2" Required="true" Readonly="false" CompareControl="DatePicker1" DateFormatString="yyyy-MM-dd HH:mm:ss"
                    CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" Label="结束日期"
                    runat="server" ShowRedStar="true" ShowTime="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单"
                    OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示日期时间先暂存选择，点击“确定”后才提交当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期时间</h3>
            <ol>
                <li>
                    点击“开始日期”字段右侧的下拉图标。<br />
                    结果：显示本页日期时间面板，可同时调整时、分；输入框当前值仍可对照查看。
                </li>
                <li>
                    在面板中选择今天之后第5天09时30分。<br />
                    结果：选择暂存在面板中；还没有执行选中事件，输入框或下方结果保持原值。
                </li>
                <li>
                    点击面板中的“确定”。<br />
                    结果：提交临时选择，回填输入框并收起弹层。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：“开始日期”启用了 ConfirmToSelect 属性，点击确定按钮才会触发选择事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowConfirmButton</code>：显示面板中的“确定”按钮；是否延后提交选择由 ConfirmToSelect 控制。</li>
                <li><code>ConfirmToSelect</code>：将当前选择暂存在面板中，点击“确定”后才提交当前值并触发选中事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
