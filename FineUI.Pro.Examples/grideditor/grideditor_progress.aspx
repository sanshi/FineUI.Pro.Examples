<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_progress.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_progress" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="200px" ColumnID="Progress1" DataField="Progress1" FieldType="Int" HeaderText="进度条1" RendererFunction="renderProgress1" />
                <f:RenderField Width="200px" ColumnID="Progress2" DataField="Progress2" FieldType="Int" HeaderText="进度条2" RendererFunction="renderProgress2" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="[进度条1]加5%" MarginRight="5" ClickHandler="onIncreaseProgressClick">
        </f:Button>
        <f:Button ID="Button3" runat="server" Text="[进度条1]减5%" ClickHandler="onDecreaseProgressClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        
        function renderProgress1(value) {
            return F.progressHtml(value, {
                textVisible: true
            });
        }

        function renderProgress2(value) {
            return F.progressHtml(value, {
                height: 15,
                textVisible: true,
                textInside: true
            });
        }

        
        function changeProgress1(increment) {
            var grid1 = F(grid1ClientID);
            grid1.getRowEls().each(function () {
                var rowEl = $(this);
                var progressEl = rowEl.find('.f-grid-cell-Progress1 .f-progressbar-outer');
                var progressValue = parseInt(progressEl.attr('data-progressvalue'));

                progressValue += increment;

                if (progressValue > 100) {
                    progressValue = 100;
                } else if (progressValue < 0) {
                    progressValue = 0;
                }

                grid1.updateCellValue(rowEl, 'Progress1', progressValue);
            });
        }

        function onIncreaseProgressClick(event) {
            changeProgress1(5);
        }

        function onDecreaseProgressClick(event) {
            changeProgress1(-5);
        }

    </script>
</body>
</html>
