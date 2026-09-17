using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_pagingtype : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var pagingType = Request.QueryString["type"];
                if (String.IsNullOrEmpty(pagingType))
                {
                    // 缺省选中值
                    pagingType = "ArrowNumberBox";
                }
                Grid1.PagingType = (PagingType)Enum.Parse(typeof(PagingType), pagingType, true);
                foreach (Button btn in bgPagingType.Items)
                {
                    if (btn.Text == pagingType)
                    {
                        btn.Pressed = true;
                    }
                    else
                    {
                        btn.Pressed = false;
                    }
                }

                if (pagingType == "NumberButton" || pagingType == "ArrowNumberButton")
                {
                    ddlMaxPagingNumberButton.Enabled = true;
                }
                else
                {
                    ddlMaxPagingNumberButton.Enabled = false;
                }


                var isShowMessage = true;
                var showMessage = Request.QueryString["message"];
                if (!String.IsNullOrEmpty(showMessage))
                {
                    isShowMessage = Convert.ToBoolean(showMessage);
                }
                Grid1.ShowPagingMessage = isShowMessage;
                cbxShowPagingMessage.Checked = isShowMessage;



                var maxNumberButtonCount = 5;
                var maxNumberButton = Request.QueryString["maxnumberbutton"];
                if (!String.IsNullOrEmpty(maxNumberButton))
                {
                    maxNumberButtonCount = Convert.ToInt32(maxNumberButton);
                }
                Grid1.MaxPagingNumberButton = maxNumberButtonCount;
                ddlMaxPagingNumberButton.SelectedValue = maxNumberButtonCount.ToString();



                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            int recordCount = 999;

            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = recordCount;

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(Grid1.PageIndex, Grid1.PageSize, recordCount);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable(int pageIndex, int pageSize, int recordCount)
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("EntranceTime", typeof(DateTime)));

            DataRow row = null;

            for (int i = pageIndex * pageSize, count = Math.Min(recordCount, pageIndex * pageSize + pageSize); i < count; i++)
            {
                row = table.NewRow();
                row[0] = 1000 + i;
                row[1] = DateTime.Now.AddSeconds(i);
                table.Rows.Add(row);
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
