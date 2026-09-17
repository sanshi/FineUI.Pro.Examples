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
    public partial class grid_customheadmenu : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBoxField cbfAtSchool = Grid1.FindColumn("AtSchool") as CheckBoxField;
                cbfAtSchool.HeaderTextRawHtml = new RawHtml("是否在校<i class=\"f-icon f-iconfont f-iconfont-filter custom-filter\"></i>");

                BoundField bfEntranceYear = Grid1.FindColumn("EntranceYear") as BoundField;
                bfEntranceYear.HeaderTextRawHtml = new RawHtml("入学年份<i class=\"f-icon f-iconfont f-iconfont-filter custom-filter\"></i>");


                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            DataView view = table.DefaultView;

            List<string> filters = new List<string>();
            if (btnSelectAtSchool.Checked)
            {
                filters.Add("AtSchool=1");
            }
            else if (btnSelectNotAtSchool.Checked)
            {
                filters.Add("AtSchool=0");
            }

            if (btnEntranceYearGreatThan2002.Checked)
            {
                filters.Add("EntranceYear>2002");
            }

            if (filters.Count > 0)
            {
                view.RowFilter = String.Join(" AND ", filters.ToArray());
            }

            Grid1.DataSource = view.ToTable();
            Grid1.DataBind();
        }

        #endregion

        protected void btnAtSchool_CheckedChanged(object sender, CheckedEventArgs e)
        {
            if (!e.Checked)
            {
                return;
            }

            BindGrid();
        }

        protected void btnEntranceYear_CheckedChanged(object sender, CheckedEventArgs e)
        {
            if (!e.Checked)
            {
                return;
            }

            BindGrid();
        }


    }
}
