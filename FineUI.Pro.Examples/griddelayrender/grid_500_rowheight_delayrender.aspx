<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_500_rowheight_delayrender.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowheight.grid_500_rowheight_delayrender" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="500行（行高固定，延迟渲染）"
            EnableCollapse="false" runat="server" EnableCheckBoxSelect="true"
            FixedRowHeight="true" EnableDelayRender="true">
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
        <br />
        <br />
        注：
        <ul>
            <li>启用延迟渲染的表格需满足如下条件：
                <ul>
                    <li>每行的行高相同（FixedRowHeight=true）。</li>
                    <li>表格高度固定或者位于布局中。</li>
                </ul>
            </li>
           <li>延迟渲染表格有一定局限性。
                <ul>
                    <li>不支持树表格、行分组。</li>
                    <li>不支持复杂的特性（比如单元格编辑、单元格合并...）。</li>
                    <li>不支持模板列中放置输入字段（比如文本输入框、下拉列表、复选框列表...）。</li>
                </ul>
            </li>
        </ul>
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
