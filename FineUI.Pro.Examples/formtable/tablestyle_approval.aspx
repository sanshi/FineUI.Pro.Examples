<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_approval.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_approval" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="MainPanel" runat="server" BodyPadding="10px" Width="900" Height="600" ShowBorder="true" Layout="VBox" ShowHeader="true" Title="流程审批"
            AutoScroll="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button ID="btnSaveClose" ValidateForms="FormApply" IconFont="Save" runat="server" Text="保存后关闭">
                        </f:Button>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnSavePost" ValidateForms="FormApply" IconFont="Check" runat="server" Text="保存后提交">
                        </f:Button>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btn_Close" IconFont="Close" runat="server" Text="关闭">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Form ID="FormApply" ShowBorder="false" ShowHeader="false" EnableTableStyle="true" runat="server" LabelWidth="120" LabelAlign="Right"
                    Layout="VBox" MessageTarget="Qtip">
                    <Rows>
                        <f:FormRow runat="server">
                            <Items>
                                <f:Label ID="lblUseDepName" Label="申请部门" Text="信息技术部" runat="server"></f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server">
                            <Items>
                                <f:Label ID="lblApplyName" Label="申请人" runat="server"></f:Label>
                                <f:TextBox runat="server" ID="txtApplyPhone" Label="申请人电话" EmptyText="请输入申请人电话" ShowRedStar="true" Required="true" BoxFlex="1"
                                    Regex="^1[3|4|5|7|8][0-9]{9}$" RegexMessage="你输入的不合法的电话号码">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server">
                            <Items>
                                <f:NumberBox runat="server" ID="numPersonCount" Label="乘车人数" EmptyText="请输入乘车人数" NoNegative="true" NoDecimal="true"
                                    ShowRedStar="true" Required="true" />
                                <f:DropDownList runat="server" ID="ddlPurpose" Label="车辆用途" EmptyText="请选择车辆用途" ShowRedStar="true" Required="true">
                                </f:DropDownList>
                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server">
                            <Items>
                                <f:DatePicker ID="dpkStart" LabelAlign="Right" EnableEdit="false" DateFormatString="yyyy/MM/dd HH:mm:ss" ShowRedStar="true"
                                    Required="true" Label="出车时间" EmptyText="请选择出车时间" runat="server" ShowTime="true" />
                                <f:DatePicker ID="dpkEnd" LabelAlign="Right" Required="true" DateFormatString="yyyy/MM/dd HH:mm:ss" Label="归队时间"
                                    EmptyText="请选择归队时间" CompareOperator="GreaterThan" CompareControl="dpkStart" ShowRedStar="true" CompareMessage="归队时间应该大于出车时间"
                                    runat="server" EnableEdit="false" ShowTime="true" />
                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server" ID="fromSelectVehicle">
                            <Items>
                                <f:TwinTriggerBox ID="ttb_SelectVehicle" Label="选择车辆" ShowTrigger1="false" Trigger2Icon="Search" runat="server"
                                    EnableEdit="false" ShowRedStar="true"></f:TwinTriggerBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow runat="server">
                            <Items>
                                <f:TextArea runat="server" Label="备注" ID="txtRemark" Height="80" />
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:GroupPanel runat="server" ID="Panel_ApprovalInfo" Title="流程信息" Layout="Fit" BoxFlex="1" MinHeight="120">
                    <Items>
                        <f:Grid ID="GridInfo" runat="server" ShowBorder="true" ShowHeader="false" EnableColumnLines="true" EnableRowLines="true">
                            <Columns>
                                <f:RowNumberField runat="server" ID="XH" ColumnID="XH" HeaderText="序号" TextAlign="Right" HeaderTextAlign="Center" Width="50" />
                                <f:BoundField runat="server" ID="ACTIVITYNAME" ColumnID="ACTIVITYNAME" DataField="ACTIVITYNAME" HeaderText="步骤"
                                    HeaderTextAlign="Center" TextAlign="Left" Width="100" />
                                <f:BoundField runat="server" ID="OPTORNAME" ColumnID="OPTORNAME" DataField="OPTORNAME" HeaderText="办理人" HeaderTextAlign="Center"
                                    TextAlign="Left" Width="100" />
                                <f:TemplateField runat="server" ID="OPTIONSTATE" ColumnID="OPTIONSTATE" HeaderText="办理状态" HeaderTextAlign="Center"
                                    TextAlign="Center" Width="100">
                                    <ItemTemplate>
                                        <%#Eval("OPTIONSTATE")==null?"已提交申请":(Eval("OPTIONSTATE").ToString()=="1"?"通过":"驳回") %>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:BoundField runat="server" ID="OPTIONREMARK" ColumnID="OPTIONREMARK" DataField="OPTIONREMARK" HeaderText="办理意见"
                                    HeaderTextAlign="Center" TextAlign="Left" ExpandUnusedSpace="true" MinWidth="150px" />
                                <f:BoundField runat="server" ID="CREATETIME" ColumnID="CREATETIME" DataField="CREATETIME" HeaderText="操作时间"
                                    HeaderTextAlign="Center" TextAlign="Left" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" Width="150" />
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel runat="server" ID="Panel_CurrentApproval" Title="当前审批" Layout="Fit" MinHeight="120">
                    <Items>
                        <f:SimpleForm runat="server" ID="DataForm" ShowHeader="false" ShowBorder="false">
                            <Items>
                                <f:RadioButtonList runat="server" ID="rbt_Approval" Label="意见" Width="300"
                                    OnSelectedIndexChanged="rbt_Approval_SelectedIndexChanged">
                                    <Items>
                                        <f:RadioItem Text="同意" Value="1" Selected="true" />
                                        <f:RadioItem Text="驳回" Value="2" />
                                    </Items>
                                </f:RadioButtonList>
                                <f:TextArea runat="server" ID="txt_Remark" Label="备注" Text="同意" Height="80" />
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Window>
    </form>
</body>
</html>
