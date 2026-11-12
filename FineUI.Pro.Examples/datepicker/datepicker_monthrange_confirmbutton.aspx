<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_monthrange_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_monthrange_confirmbutton" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM" Label="月份范围" EmptyText="请选择月份范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="MonthRange" ShowConfirmButton="true" ConfirmToSelect="true">
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
            <p>演示年月范围先暂存选择，点击“确定”后才提交当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年月范围</h3>
            <ol>
                <li>
                    点击“月份范围”字段右侧的下拉图标。<br />
                    结果：显示本页年月范围面板；输入框当前值仍可对照查看。
                </li>
                <li>
                    依次将起点和终点选择为当前月份之后第1个月到第2个月。<br />
                    结果：选择暂存在面板中；还没有执行选中事件，输入框或下方结果保持原值。
                </li>
                <li>
                    点击面板中的“确定”。<br />
                    结果：提交临时选择，回填输入框并收起弹层。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowConfirmButton</code>：显示面板中的“确定”按钮；是否延后提交选择由 ConfirmToSelect 控制。</li>
                <li><code>ConfirmToSelect</code>：将当前选择暂存在面板中，点击“确定”后才提交当前值并触发选中事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
