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
    public partial class grid_simulate_tree_database_paging_dropdownlist : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindShengList();

                BindGrid();

            }
        }

        #region BindShengList
        private void BindShengList()
        {
            ddlSheng.DataTextField = "Name";
            ddlSheng.DataValueField = "Code";
            ddlSheng.DataSource = ProvinceCityCountyData.Provinces;
            ddlSheng.DataBind();

            ddlSheng.Items.Insert(0, new ListItem("--选择省份--", "-1"));
            ddlSheng.SelectedValue = "-1";
        }

        #endregion

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
            if (ddlSheng.SelectedValue == "-1")
            {
                return ProvinceCityCountyData.Provinces.Count;
            }
            else
            {
                return 1;
            }
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

            if (ddlSheng.SelectedValue == "-1")
            {
                int rowbegin = pageIndex * pageSize;
                int rowend = (pageIndex + 1) * pageSize;
                if (rowend > ProvinceCityCountyData.Provinces.Count)
                {
                    rowend = ProvinceCityCountyData.Provinces.Count;
                }

                for (int i = rowbegin; i < rowend; i++)
                {
                    ProvinceCityCountyItem sheng = ProvinceCityCountyData.Provinces[i];

                    string group = GenerateNextGroup().ToString();

                    DataRow row = table.NewRow();
                    row[0] = GenerateNextID();
                    row[1] = sheng.Name;
                    row[2] = group;
                    row[3] = 0;
                    table.Rows.Add(row);

                    AddShiRows(table, group, sheng.Code);

                }
            }
            else
            {
                string sheng = ddlSheng.SelectedValue;

                string group = GenerateNextGroup().ToString();

                DataRow row = table.NewRow();
                row[0] = GenerateNextID();
                row[1] = ProvinceCityCountyData.ProvinceName(sheng);
                row[2] = group;
                row[3] = 0;
                table.Rows.Add(row);

                AddShiRows(table, group, sheng);
            }

            return table;
        }

        private void AddShiRows(DataTable table, String group, string sheng)
        {
            foreach (ProvinceCityCountyItem shi in ProvinceCityCountyData.Cities(sheng))
            {
                DataRow row = table.NewRow();
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

        #endregion

        #region Events

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            
            BindGrid();
        }

        protected void ddlSheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid1.PageIndex = 0;

            BindGrid();
        }

        #endregion

    }
}
