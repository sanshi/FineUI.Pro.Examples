<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectUserControl.ascx.cs" Inherits="FineUI.Pro.Examples.usercontrol.SelectUserControl" %>
<f:Panel ID="Panel7" runat="server" BodyPadding="10px" Width="750px" Height="300px" Hidden="true" ShowBorder="true" ShowHeader="false" Layout="VBox"
    BoxConfigAlign="Stretch">
    <Items>
        <f:Form ID="Form5" ShowBorder="false" ShowHeader="false" runat="server">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:TwinTriggerBox Width="300px" runat="server" EmptyText="在姓名中查找" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                            OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear" Trigger2Icon="Search">
                        </f:TwinTriggerBox>
                        <f:RadioButtonList ID="rblAtSchool" Label="是否在校" OnSelectedIndexChanged="rblAtSchool_SelectedIndexChanged" runat="server">
                            <f:RadioItem Text="全部" Value="-1" Selected="true" />
                            <f:RadioItem Text="在校" Value="1" />
                            <f:RadioItem Text="离校" Value="0" />
                        </f:RadioButtonList>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <f:Grid ID="Grid1" BoxFlex="1" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" PageSize="10"
            ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Width="100px" DataField="Name" SortField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="100px" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="100px" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="100px" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ExpandUnusedSpace="true" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="Group" Width="100px" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
    </Items>
</f:Panel>
