<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="timepicker_clearicon.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.timepicker_clearicon" %>

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
                <f:DatePicker runat="server" Required="true" EnableEdit="false" Label="日期" EmptyText="请选择日期"
                    ID="DatePicker1" ShowRedStar="true" AutoShowClearIcon="true">
                </f:DatePicker>
                <f:TimePicker ID="TimePicker1" ShowRedStar="true" EnableEdit="false" Label="时间" Increment="30"
                    Required="true" EmptyText="请选择时间" runat="server" AutoShowClearIcon="true">
                </f:TimePicker>
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
            <p>演示日期和时间字段的清空图标，清空后仍须重新选择才能通过必填验证。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-close" aria-hidden="true"></i>清空后重新选择</h3>
            <ol>
                <li>
                    在已有日期或时间时点击字段中的清空图标。<br />
                    结果：字段变为空，清空图标消失；必填规则仍保留。
                </li>
                <li>
                    点击“提交表单”，再重新选择日期和时间后提交。<br />
                    结果：空字段先显示必填错误；重新选择有效值后才能继续处理。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li> 本示例通过EnableEdit属性控制日期和时间选择器不可编辑。 </li>
                <li> 为日期和时间选择器增加清空图标。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AutoShowClearIcon</code>：有值时显示清空图标；点击后清空字段并隐藏图标，必填规则继续生效。</li>
            </ul>
        </section>
    </template>
</body>
</html>
