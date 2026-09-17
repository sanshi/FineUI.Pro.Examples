<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_iframe_alert.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.grid_iframe_alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/grid_iframe_alert_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel7" IsFluid="true" runat="server" BodyPadding="10px" Title="Panel" ShowBorder="true" ShowHeader="true" Layout="VBox"
            BoxConfigAlign="Stretch">
            <Items>
                <f:Form ID="Form5" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TwinTriggerBox runat="server" EmptyText="输入要搜索的关键词" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                    OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                    Trigger2Icon="Search">
                                </f:TwinTriggerBox>
                                <f:DropDownList ID="DropDownList1" ShowLabel="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server">
                                    <f:ListItem Text="过滤条件一" Value="filter1" />
                                    <f:ListItem Text="过滤条件二" Value="filter2" />
                                    <f:ListItem Text="过滤条件三" Value="filter3" />
                                </f:DropDownList>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid DataIDField="Id" ID="Grid2" Title="Grid2" PageSize="10" ShowBorder="true" BoxFlex="1" AllowPaging="true" IsDatabasePaging="false"
                    ShowHeader="false" runat="server" EnableCheckBoxSelect="true" OnSort="Grid2_Sort">
                    <Columns>
                        <f:RowNumberField />
                        <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                        <f:TemplateField ColumnID="Gender" HeaderText="性别">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                        <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                        <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                            DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                            ExpandUnusedSpace="true" MinWidth="150px" />
                        <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                        <f:WindowField ColumnID="myWindowField" TextAlign="Center" WindowID="Window1" Icon="Pencil" ToolTip="编辑" DataIFrameUrlFields="Id,Name"
                            DataIFrameUrlFormatString="./grid_iframe_alert_window.aspx?id={0}&name={1}" Title="编辑" IFrameUrl="~/alert.aspx" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Title="弹出窗体" Hidden="true" EnableIFrame="true" EnableMaximize="true" Target="Top" EnableResize="true" runat="server"
            CloseAction="HidePostBack" OnClose="Window1_Close" IsModal="true" Width="850px" Height="550px">
        </f:Window>
    </form>
</body>
</html>
