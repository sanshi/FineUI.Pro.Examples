<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_update_label.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_update_label" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form LabelWidth="100px" BodyPadding="10px" EnableCollapse="false"
            ID="Form2" IsFluid="true" runat="server" Title="表单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labTitle" Label="标题" HideMode="Display" Text="申请单" runat="server" />
                        <f:Label ID="labLiuShuiHao" Label="流水号" Text="123456789" runat="server" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labPhone" Label="固定电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="tbxEmail" Required="true" ShowRedStar="true" Label="电子邮箱" EmptyText="请输入常用电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="true" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                        <f:DatePicker runat="server" Required="true" Label="审批时间" EmptyText="请输入审批时间" ID="dpApplyTime" ShowRedStar="true" DateFormatString="yyyy-MM-dd">
                        </f:DatePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="nbxApplyNumber" Label="申请数量" NoDecimal="true" NoNegative="true" EmptyText="请输入申请数量" MaxValue="100" Required="true" runat="server"
                            ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="taDescription" runat="server" Label="描述" ShowRedStar="true" Required="true" MinLength="5">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="验证表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnUpdateLabel" Text="更新[固定电话]标签" CssClass="marginr" runat="server" OnClick="btnUpdateLabel_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnRemoveRequired" Text="去除[电子邮箱]必填项" CssClass="marginr" runat="server" OnClick="btnRemoveRequired_Click">
        </f:Button>
        <f:Button ID="btnRemoveRegex" Text="去除[电子邮箱]的正则表达式验证" CssClass="marginr" runat="server" OnClick="btnRemoveRegex_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnRemoveMinLength" Text="去除[描述]的最少5个字符限制" CssClass="marginr" runat="server" OnClick="btnRemoveMinLength_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnRemoveValue" Text="将[申请数量]的最大值100改为10" CssClass="marginr" runat="server" OnClick="btnRemoveValue_Click">
        </f:Button>
         <br />
        <br />
        <f:Button ID="btnModifyMinDate" Text="限制[审批时间]的最大时间为今天" CssClass="marginr" runat="server" OnClick="btnModifyMinDate_Click">
        </f:Button>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示按钮回发后由后台修改字段标签和验证规则，新规则立即作用于页面上的输入控件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>改标签和邮箱规则</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnUpdateLabel.ClientID %>" title="更新[固定电话]标签">更新[固定电话]标签</strong>。<br />
                    结果：按钮回发，后台在<strong class="example-control-reference" data-example-control="<%= labPhone.ClientID %>" title="固定电话">固定电话</strong>和“移动电话”之间切换标签，电话号码保持不变。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnRemoveRequired.ClientID %>" title="去除[电子邮箱]必填项">去除[电子邮箱]必填项</strong>。<br />
                    结果：后台同时取消 <code>Required</code> 和 <code>ShowRedStar</code>，邮箱星号消失，空邮箱不再产生必填错误。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnRemoveRegex.ClientID %>" title="去除[电子邮箱]的正则表达式验证">去除[电子邮箱]的正则表达式验证</strong>。<br />
                    结果：后台把 <code>RegexPattern</code> 改为 <code>None</code>，之后不再按邮箱格式校验。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>改长度、数字和日期限制</h3>
            <ul>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnRemoveMinLength.ClientID %>" title="去除[描述]的最少5个字符限制">去除[描述]的最少5个字符限制</strong>。<br />
                    结果：后台清空 <code>MinLength</code>，描述保留其它规则，但不再要求至少 <code>5</code> 个字符。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnRemoveValue.ClientID %>" title="将[申请数量]的最大值100改为10">将[申请数量]的最大值100改为10</strong>，输入 <code>11</code> 后移开焦点。<br />
                    结果：后台下发新上限 <code>10</code>，数量 <code>11</code> 显示错误。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnModifyMinDate.ClientID %>" title="限制[审批时间]的最大时间为今天">限制[审批时间]的最大时间为今天</strong>。<br />
                    结果：后台把 <code>MaxDate</code> 改为今天，之后的日期不能通过验证。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnClick</code>（本页全部按钮，如<strong class="example-control-reference" data-example-control="<%= btnSubmitForm2.ClientID %>" title="验证表单并提交">验证表单并提交</strong>）：各修改按钮绑定后台事件，点击后通过回发更新已有控件。</li>
                <li><code>Label</code>（本页全部标签，如<strong class="example-control-reference" data-example-control="<%= labTitle.ClientID %>" title="标题">标题</strong>）：修改显示的字段标签，保留字段当前值。</li>
                <li><code>Required</code>（<strong class="example-control-reference" data-example-control="<%= tbxEmail.ClientID %>" title="电子邮箱">电子邮箱</strong>、<strong class="example-control-reference" data-example-control="<%= DropDownList3.ClientID %>" title="审批人">审批人</strong>、<strong class="example-control-reference" data-example-control="<%= dpApplyTime.ClientID %>" title="审批时间">审批时间</strong>、<strong class="example-control-reference" data-example-control="<%= nbxApplyNumber.ClientID %>" title="申请数量">申请数量</strong>、<strong class="example-control-reference" data-example-control="<%= taDescription.ClientID %>" title="描述">描述</strong>）：控制字段是否必须有值，与星号分别设置。</li>
                <li><code>ShowRedStar</code>（<strong class="example-control-reference" data-example-control="<%= tbxEmail.ClientID %>" title="电子邮箱">电子邮箱</strong>、<strong class="example-control-reference" data-example-control="<%= DropDownList3.ClientID %>" title="审批人">审批人</strong>、<strong class="example-control-reference" data-example-control="<%= dpApplyTime.ClientID %>" title="审批时间">审批时间</strong>、<strong class="example-control-reference" data-example-control="<%= nbxApplyNumber.ClientID %>" title="申请数量">申请数量</strong>、<strong class="example-control-reference" data-example-control="<%= taDescription.ClientID %>" title="描述">描述</strong>）：控制标签上的必填星号。</li>
                <li><code>RegexPattern</code>（<strong class="example-control-reference" data-example-control="<%= tbxEmail.ClientID %>" title="电子邮箱">电子邮箱</strong>）：初始为 <code>None</code> 取消邮箱格式规则。</li>
                <li><code>MinLength</code>（<strong class="example-control-reference" data-example-control="<%= taDescription.ClientID %>" title="描述">描述</strong>）：设为 <code>null</code> 取消最小字符长度。</li>
                <li><code>MaxValue</code>（<strong class="example-control-reference" data-example-control="<%= nbxApplyNumber.ClientID %>" title="申请数量">申请数量</strong>）：<strong class="example-control-reference" data-example-control="<%= nbxApplyNumber.ClientID %>" title="申请数量">申请数量</strong>的新上限为 <code>10</code>。</li>
                <li><code>MaxDate</code>（<strong class="example-control-reference" data-example-control="<%= dpApplyTime.ClientID %>" title="审批时间">审批时间</strong>）：审批日期的新上限为今天。</li>
            </ul>
        </section>
    </template>
</body>
</html>
