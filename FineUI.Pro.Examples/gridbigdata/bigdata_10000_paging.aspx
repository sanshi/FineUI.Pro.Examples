<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bigdata_10000_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridbigdata.bigdata_10000_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（10000行）" EnableCollapse="false" Height="500px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id"   
            EnableBigData="true" FixedRowHeight="true" AllowPaging="true" IsDatabasePaging="false" PageSize="120" 
            EnableBigDataRowTip="false" PagingToolbarVisible="false">
            <Columns>
                <f:RowNumberField Width="50px" EnablePagingNumber="true"></f:RowNumberField>
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：启用大数据，启用分页，每页显示 120 条记录。
    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
