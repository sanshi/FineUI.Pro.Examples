using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_twogrid : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid2();

                BindGrid1();
            }
        }

        #region BindGrid2/BindGrid1

        private void BindGrid2()
        {
            Grid2.DataSource = DataSourceUtil.GetClassDataTable();
            Grid2.DataBind();

            Grid2.SelectedRowID = "101";
        }

        private void BindGrid1()
        {
            if (String.IsNullOrEmpty(Grid2.SelectedRowID))
            {
                return;
            }

            int classId = Convert.ToInt32(Grid2.GetSelectedDataKeys()[0][0]);

            DataTable table = null;
            if (classId == 101)
            {
                table = DataSourceUtil.GetDataTable();
            }
            else
            {
                table = DataSourceUtil.GetDataTable2();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();

            UpdateClassDesc(classId);
        }

        private void UpdateClassDesc(int classId)
        {
            foreach (DataRow row in DataSourceUtil.GetClassDataTable().Rows)
            {
                int currentClassId = (int)row["Id"];
                if (classId == currentClassId)
                {
                    labelClassDesc.Text = "班级描述：" + row["Desc"].ToString();
                    break;
                }
            }
        }

        #endregion

        #region Events

        protected void Grid2_RowSelect(object sender, GridRowSelectEventArgs e)
        {
            BindGrid1();
        }

       

        #endregion

    }
}
