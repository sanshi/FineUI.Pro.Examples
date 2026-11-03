using System;

namespace FineUI.Pro.Examples.datalist
{
    public partial class datalist_selection : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataListSingle.SelectedValue = "beijing";
                DataListMulti.SelectedValueArray = new string[] { "beijing", "shanghai" };
                DataListKeep.SelectedValueArray = new string[] { "beijing", "shanghai" };
                ShowSelection();
            }
        }

        private void ShowSelection()
        {
            labResult.Text = "单选：" + String.Join(", ", DataListSingle.SelectedValueArray)
                + "；多选：" + String.Join(", ", DataListMulti.SelectedValueArray)
                + "；保持选择：" + String.Join(", ", DataListKeep.SelectedValueArray);
        }

        protected void btnRead_Click(object sender, EventArgs e)
        {
            ShowSelection();
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            DataListSingle.SelectedValue = "guangzhou";
            DataListMulti.SelectedValueArray = new string[] { "shanghai", "guangzhou" };
            DataListKeep.SelectedValueArray = new string[] { "shanghai", "guangzhou" };
            ShowSelection();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            DataListSingle.ClearSelection();
            DataListMulti.ClearSelection();
            DataListKeep.ClearSelection();
            ShowSelection();
        }
    }
}
