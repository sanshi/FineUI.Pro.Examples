using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.usercontrol
{
    public partial class SelectUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (EnableGridMultiSelect)
                {
                    Grid1.EnableMultiSelect = true;
                    Grid1.KeepCurrentSelection = true;
                }
                else
                {
                    Grid1.EnableMultiSelect = false;
                }

                BindGrid();
            }
        }

        #region EnableGridMultiSelect

        private bool _gridMultiSelect = true;

        /// <summary>
        /// 是否允许表格多选
        /// </summary>
        public bool EnableGridMultiSelect
        {
            get { return _gridMultiSelect; }
            set { _gridMultiSelect = value; }
        }



        private string _gridMajor = String.Empty;

        /// <summary>
        /// 表格的专业过滤
        /// </summary>
        public string GridMajor
        {
            get { return _gridMajor; }
            set { _gridMajor = value; }
        }


        #endregion


        #region BindGrid

        /// <summary>
        /// 获取性别的字面值，在 ASPX 中调用
        /// </summary>
        /// <param name="gender"></param>
        /// <returns></returns>
        protected string GetGender(object gender)
        {
            if (Convert.ToInt32(gender) == 1)
            {
                return "男";
            }
            else
            {
                return "女";
            }
        }


        private void BindGrid()
        {
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable();

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return GetSource().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable()
        {
            int pageIndex = Grid1.PageIndex;
            int pageSize = Grid1.PageSize;

            DataTable table = GetSource();

            DataTable paged = table.Clone();
            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > table.Rows.Count)
            {
                rowend = table.Rows.Count;
            }
            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(table.Rows[i]);
            }

            return paged;
        }

        private DataTable GetSource()
        {
            string sortField = Grid1.SortField;
            string sortDirection = Grid1.SortDirection;

            DataTable table2 = DataSourceUtil.GetDataTable2();

            DataView view2 = table2.DefaultView;
            view2.Sort = String.Format("{0} {1}", sortField, sortDirection);

            List<string> filters = new List<string>();

            string searchKeyword = ttbSearch.Text.Trim();
            if (!String.IsNullOrEmpty(searchKeyword) && ttbSearch.ShowTrigger1)
            {
                // RowFilter的用法：http://www.csharp-examples.net/dataview-rowfilter/
                filters.Add(String.Format("Name LIKE '*{0}*'", DataSourceUtil.EscapeLikeValue(searchKeyword)));
            }


            if (!String.IsNullOrEmpty(rblAtSchool.SelectedValue) && rblAtSchool.SelectedValue != "-1")
            {
                filters.Add(String.Format("AtSchool = {0}", rblAtSchool.SelectedValue));
            }


            // 用户控件的自定义属性
            if (!String.IsNullOrEmpty(GridMajor))
            {
                filters.Add(String.Format("Major = '{0}'", GridMajor));
            }


            if (filters.Count > 0)
            {
                view2.RowFilter = String.Join(" AND ", filters.ToArray());
            }

            

            return view2.ToTable();
        }



        #endregion

        #region Events



        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            //Grid1.PageIndex = e.NewPageIndex;

            BindGrid();
        }

        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            //Grid1.SortDirection = e.SortDirection;
            //Grid1.SortField = e.SortField;

            BindGrid();
        }


        protected void ttbSearch_Trigger1Click(object sender, EventArgs e)
        {
            ttbSearch.Text = String.Empty;
            ttbSearch.ShowTrigger1 = false;

            BindGrid();
        }

        protected void ttbSearch_Trigger2Click(object sender, EventArgs e)
        {
            ttbSearch.ShowTrigger1 = true;

            BindGrid();
        }

        protected void rblAtSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        #endregion


    }
}