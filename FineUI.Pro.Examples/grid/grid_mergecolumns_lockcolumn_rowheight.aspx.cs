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
    public partial class grid_mergecolumns_lockcolumn_rowheight : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }


        #region GetDataTable

        /// <summary>
        /// 获取模拟表格
        /// </summary>
        /// <returns></returns>
        public static DataTable GetDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Name", typeof(String)));
            table.Columns.Add(new DataColumn("EntranceYear", typeof(int)));
            table.Columns.Add(new DataColumn("AtSchool", typeof(bool)));
            table.Columns.Add(new DataColumn("Hobby", typeof(String)));
            table.Columns.Add(new DataColumn("Group", typeof(int)));
            table.Columns.Add(new DataColumn("Gender", typeof(int)));

            DataRow row = null;

            row = table.NewRow();
            row[0] = 101;
            row[1] = "陈萍萍";
            row[2] = 2000;
            row[3] = true;
            row[4] = "读书<br>篮球<br>旅游<br>电影<br>音乐";
            row[5] = 1;
            row[6] = 0;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 102;
            row[1] = "胡飞";
            row[2] = 2000;
            row[3] = true;
            row[4] = "读书<br>篮球<br>旅游<br>电影<br>音乐";
            row[5] = 1;
            row[6] = 1;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 103;
            row[1] = "金婷婷";
            row[2] = 2000;
            row[3] = true;
            row[4] = "读书<br>篮球<br>旅游<br>电影<br>音乐";
            row[5] = 1;
            row[6] = 0;
            table.Rows.Add(row);


            return table;
        }
        #endregion

        

        #endregion



    }
}
