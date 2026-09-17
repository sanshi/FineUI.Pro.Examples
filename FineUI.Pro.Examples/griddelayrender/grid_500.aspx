<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_500.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_500" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="500行（行高不同）"
            EnableCollapse="false" runat="server">
            <Columns>
                <f:RowNumberField Width="100px" />
                <f:BoundField DataField="ID" HeaderText="标识" />
                <f:BoundField Width="150px" DataField="Name" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" Width="150px" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField Width="300px" DataField="GUID" HeaderText="GUID" />
                <f:TemplateField ColumnID="Hobby" Width="200px" HeaderText="爱好">
                    <ItemTemplate>
                        <%# GetHobby(Eval("Hobby")) %>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceDate" HeaderText="入学时间" />
                <f:BoundField DataField="ChineseScore" HeaderText="语文成绩" />
                <f:BoundField DataField="MathScore" HeaderText="数学成绩" />
                <f:BoundField DataField="TotalScore" HeaderText="总成绩" />
                <f:BoundField DataField="ShenGao" HeaderText="身高" />
                <f:BoundField DataField="TiZhong" HeaderText="体重" />
                <f:BoundField DataField="XueYaDi" HeaderText="血压（低）" />
                <f:BoundField DataField="XueYaGao" HeaderText="血压（高）" />
                <f:BoundField DataField="ShiLiZuo" HeaderText="视力（左）" />
                <f:BoundField DataField="ShiLiYou" HeaderText="视力（右）" />
                <f:BoundField Width="150px" DataField="ShiLiZuoJiaoZhen" HeaderText="矫正视力（左）" />
                <f:BoundField Width="150px" DataField="ShiLiYouJiaoZhen" HeaderText="矫正视力（右）" />
            </Columns>
            <Listeners>
                <f:Listener Event="render" Handler="onGridRender" />
            </Listeners>
        </f:Grid>
    </form>
    <script>
        // 等所有JS资源下载完毕后开始
        var __STARTTIME = new Date();

        // 表格渲染完毕后结束
        function onGridRender(event) {
            this.setTitle(this.getTitle() + ' - 渲染时间：' + ((new Date() - __STARTTIME) / 1000).toFixed(2));
        }
    </script>
</body>
</html>
