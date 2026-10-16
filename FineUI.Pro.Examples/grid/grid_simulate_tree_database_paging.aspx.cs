using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_simulate_tree_database_paging : PageBase
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
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(Grid1.PageIndex, Grid1.PageSize);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        private int idGenerator = 100;
        private int GenerateNextID()
        {
            return idGenerator++;
        }

        private int groupGenerator = 0;
        private int GenerateNextGroup()
        {
            groupGenerator++;
            if (groupGenerator > 20)
            {
                groupGenerator = 1;
            }
            return groupGenerator;
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return ProvinceCityCountyData.Provinces.Count;
        }

        private DataTable GetPagedDataTable(int pageIndex, int pageSize)
        {
            DataTable table = new DataTable();
            DataColumn column1 = new DataColumn("Id", typeof(int));
            DataColumn column2 = new DataColumn("Name", typeof(String));
            DataColumn column3 = new DataColumn("Group", typeof(String));
            DataColumn column4 = new DataColumn("TreeLevel", typeof(int));
            table.Columns.Add(column1);
            table.Columns.Add(column2);
            table.Columns.Add(column3);
            table.Columns.Add(column4);

            DataRow row = null;
            String group = String.Empty;

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > ProvinceCityCountyData.Provinces.Count)
            {
                rowend = ProvinceCityCountyData.Provinces.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                ProvinceCityCountyItem sheng = ProvinceCityCountyData.Provinces[i];

                group = GenerateNextGroup().ToString();

                row = table.NewRow();
                row[0] = GenerateNextID();
                row[1] = sheng.Name;
                row[2] = group;
                row[3] = 0;
                table.Rows.Add(row);

                foreach (ProvinceCityCountyItem shi in ProvinceCityCountyData.Cities(sheng.Code))
                {
                    row = table.NewRow();
                    row[0] = GenerateNextID();
                    row[1] = shi.Name;
                    row[2] = group;
                    row[3] = 1;
                    table.Rows.Add(row);

                    var xianArray = ProvinceCityCountyData.Counties(shi.Code);
                    if (xianArray != null)
                    {
                        foreach (ProvinceCityCountyItem xian in xianArray)
                        {
                            row = table.NewRow();
                            row[0] = GenerateNextID();
                            row[1] = xian.Name;
                            row[2] = group;
                            row[3] = 2;
                            table.Rows.Add(row);

                        }
                    }


                }

            }


            return table;
        }

        #endregion

        #region Events

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            
            BindGrid();
        }

        #endregion

    }
}
