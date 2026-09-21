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
    public partial class grid_groupfield_manycolumns : PageBase
    {
        #region Page_Init

        // 注意：动态创建列的代码需要放置于 Page_Init（不是 Page_Load），这样每次构造页面时都会执行
        protected void Page_Init(object sender, EventArgs e)
        {
            InitGridColumns();
        }

        #endregion

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #endregion

        #region InitGridColumns

        // 叶子列的表头文本：「发货」子分组用全部 18 个，「开票」子分组用前 17 个
        private static readonly string[] LEAF_HEADER_TEXTS = new string[]
        {
            "金额", "数量", "单价", "去年同期", "去年变化率", "环比", "本年累计", "累计占比", "完成率",
            "目标", "差额", "预测", "实际", "偏差", "均价", "折扣", "税额", "备注"
        };

        private void InitGridColumns()
        {
            // 左侧 5 个锁定列：客户编号 / 客户名称 / 产品 / 期初 / 期末
            AddLeafColumn(Grid1.Columns, "客户编号", "khbh", 90, true);
            AddLeafColumn(Grid1.Columns, "客户名称", "khmc", 150, true);
            AddLeafColumn(Grid1.Columns, "产品", "product", 100, true);
            AddLeafColumn(Grid1.Columns, "期初", "qc", 90, true);
            AddLeafColumn(Grid1.Columns, "期末", "qm", 90, true);

            // 12 个月，每月一个分组；月下再分「发货」（18 列）与「开票」（17 列）两个子分组
            for (int mo = 1; mo <= 12; mo++)
            {
                FineUI.Pro.GroupField monthGroup = new FineUI.Pro.GroupField();
                monthGroup.HeaderText = mo + "月";
                monthGroup.TextAlign = TextAlign.Center;

                FineUI.Pro.GroupField fhGroup = new FineUI.Pro.GroupField();
                fhGroup.HeaderText = "发货";
                fhGroup.TextAlign = TextAlign.Center;
                for (int i = 0; i < 18; i++)
                {
                    AddLeafColumn(fhGroup.Columns, LEAF_HEADER_TEXTS[i], String.Format("m{0}_fh_{1}", mo, i), 90, false);
                }

                FineUI.Pro.GroupField kpGroup = new FineUI.Pro.GroupField();
                kpGroup.HeaderText = "开票";
                kpGroup.TextAlign = TextAlign.Center;
                for (int i = 0; i < 17; i++)
                {
                    AddLeafColumn(kpGroup.Columns, LEAF_HEADER_TEXTS[i], String.Format("m{0}_kp_{1}", mo, i), 90, false);
                }

                monthGroup.Columns.Add(fhGroup);
                monthGroup.Columns.Add(kpGroup);
                Grid1.Columns.Add(monthGroup);
            }
        }

        private void AddLeafColumn(GridColumnCollection columns, string headerText, string dataField, int width, bool locked)
        {
            FineUI.Pro.BoundField bf = new FineUI.Pro.BoundField();
            bf.HeaderText = headerText;
            bf.DataField = dataField;
            bf.Width = Unit.Pixel(width);
            if (locked)
            {
                bf.EnableLock = true;
                bf.Locked = true;
            }
            else
            {
                // 月份下的叶子列右对齐
                bf.TextAlign = TextAlign.Right;
            }
            columns.Add(bf);
        }

        #endregion

        #region BindGrid

        private void BindGrid()
        {
            Grid1.DataSource = GetDataTable();
            Grid1.DataBind();
        }

        private DataTable GetDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("khbh", typeof(string)));
            table.Columns.Add(new DataColumn("khmc", typeof(string)));
            table.Columns.Add(new DataColumn("product", typeof(string)));
            table.Columns.Add(new DataColumn("qc", typeof(double)));
            table.Columns.Add(new DataColumn("qm", typeof(double)));

            // 12 个月的「发货 / 开票」数值字段，与动态创建的叶子列一一对应
            for (int mo = 1; mo <= 12; mo++)
            {
                for (int i = 0; i < 18; i++)
                {
                    table.Columns.Add(new DataColumn(String.Format("m{0}_fh_{1}", mo, i), typeof(double)));
                }
                for (int i = 0; i < 17; i++)
                {
                    table.Columns.Add(new DataColumn(String.Format("m{0}_kp_{1}", mo, i), typeof(double)));
                }
            }

            Random rd = new Random();
            for (int i = 0; i < 20; i++)
            {
                DataRow row = table.NewRow();
                row["Id"] = 100 + i;
                row["khbh"] = "HT0100" + (i % 5 + 1);
                row["khmc"] = "客户" + i;
                row["product"] = "产品" + (i % 8);
                row["qc"] = Math.Round(rd.NextDouble() * 1000, 2);
                row["qm"] = Math.Round(rd.NextDouble() * 1000, 2);
                for (int c = 5; c < table.Columns.Count; c++)
                {
                    row[c] = Math.Round(rd.NextDouble() * 5000, 2);
                }

                table.Rows.Add(row);
            }

            return table;
        }

        #endregion

    }
}
