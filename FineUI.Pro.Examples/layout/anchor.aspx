<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anchor.aspx.cs" Inherits="FineUI.Pro.Examples.layout.anchor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel3" IsFluid="true" Title="面板一（Height=300px)" runat="server" Height="300px" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true">
            <Items>
                <f:Panel ID="Panel1" runat="server" ShowBorder="true" Margin="0 0 5 0"
                    BodyPadding="10px" ShowHeader="false" Title="面板">
                    <Items>
                        <f:Label ID="Label5" Text="Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Form ID="Form3" runat="server" ShowBorder="true"
                    BodyPadding="10px" ShowHeader="false" Title="表单">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:Label ID="Label2" Label="文本" Text="文本内容" runat="server">
                                </f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox2" Label="输入框" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button2" Text="按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="300px" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" Layout="Anchor" ShowHeader="true" Title="面板二（Height=300px Width=750px Layout=Anchor）">
            <Items>
                <f:Panel ID="Panel4" AnchorValue="60% 30%" runat="server" Margin="0 0 5 0"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" Text="AnchorValue=60% 30% Margin=0 0 5 0" runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Form ID="Form2" AnchorValue="100% 70%" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:Label ID="Label1" Text="AnchorValue=100% 70%" runat="server">
                                </f:Label>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox1" Label="输入框" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button7" Text="按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel5" IsFluid="true" Title="面板三（Width=750px）" runat="server" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true">
            <Items>
                <f:Form ID="Form4" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox3" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button6" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel6" ShowBorder="true" ShowHeader="false" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <f:Button ID="Button4" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button5" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid1" Title="表格" PageSize="3" ShowBorder="false" ShowHeader="false"
                            runat="server" EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label4" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
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
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel7" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false"
            ShowBorder="true" ShowHeader="true" Height="350px" Title="面板四（Width=750px Height=350px Layout=Anchor）"
            Layout="Anchor">
            <Items>
                <f:Form ID="Form5" ShowBorder="false" AnchorValue="100%"
                    ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox5" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox8" Label="所在班级" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox6" Label="所在年级" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button11" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel8" ShowBorder="true" ShowHeader="false" AnchorValue="100% -72"
                    Layout="Fit" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="Button8" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button9" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid2" Title="Grid2" PageSize="3" ShowBorder="false" ShowHeader="false"
                            runat="server" EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label6" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
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
            </Items>
        </f:Panel>
        <br />
        <br />
        <br />
        <strong>【推荐】</strong>使用VBox布局实现与上例相同的界面：
        <br />
        <hr />
        <br />
        <f:Panel ID="Panel9" IsFluid="true" runat="server" Layout="VBox" EnableCollapse="false"
            BodyPadding="10px" BoxConfigChildMargin="0"
            ShowBorder="true" ShowHeader="true" Height="350px"
            Title="面板五（Layout=VBox BoxConfigChildMargin=0）">
            <Items>
                <f:Form ID="Form6" ShowBorder="false" ShowHeader="false" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox4" Label="用户名" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox7" Label="所在班级" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox9" Label="所在年级" runat="server">
                                </f:TextBox>
                                <f:Button ID="Button10" Text="搜索" runat="server">
                                </f:Button>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Panel ID="Panel10" ShowBorder="true" ShowHeader="false" BoxFlex="1" Layout="Fit" runat="server">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar3" runat="server">
                            <Items>
                                <f:Button ID="Button12" Text="按钮一" runat="server">
                                </f:Button>
                                <f:Button ID="Button13" Text="按钮二" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Grid DataIDField="Id" ID="Grid3" Title="Grid3" PageSize="3" ShowBorder="false" ShowHeader="false"
                            runat="server" EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                                    <ItemTemplate>
                                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                        <asp:Label ID="Label8" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
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
            </Items>
        </f:Panel>
    </form>
</body>
</html>
