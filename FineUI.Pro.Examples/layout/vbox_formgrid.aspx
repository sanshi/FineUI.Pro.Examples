<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_formgrid.aspx.cs" Inherits="FineUI.Pro.Examples.iframe.vbox_formgrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel7" runat="server" />
        <f:Panel ID="Panel7" Margin="24px" runat="server" BodyPadding="10px" AutoScroll="true"
            Title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条" ShowBorder="true" ShowHeader="true" Layout="VBox" BoxConfigSpace="10">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" Text="测试按钮" runat="server">
                        </f:Button>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button2" Text="测试按钮" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Form ID="Form5" ShowBorder="true" ShowHeader="true" Title="表单" BodyPadding="10" RemoveLastFieldsMargin="true" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox1" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox2" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox3" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox4" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox5" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox6" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox7" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox8" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox9" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox10" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox11" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox12" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox13" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox14" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox15" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox16" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox17" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox18" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox19" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox20" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox21" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox22" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid DataIDField="Id" ID="Grid2" Title="表格（BoxFlex=1 MinHeight=300）" PageSize="10" ShowBorder="true" AllowPaging="true" IsDatabasePaging="false"
                    ShowHeader="true" runat="server" EnableCheckBoxSelect="true"
                    BoxFlex="1" MinHeight="300px">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="btnPopupWindow" Text="测试按钮" runat="server">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                                </f:ToolbarSeparator>
                                <f:Button ID="btnCheckSelection" Text="测试按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
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
                        <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                            DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                            UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                        <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
