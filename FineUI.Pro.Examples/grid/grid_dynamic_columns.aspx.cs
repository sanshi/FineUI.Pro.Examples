using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.data
{
    public partial class grid_dynamic_columns : PageBase
    {
        #region Page_Init

        // 注意：动态创建的代码需要放置于Page_Init（不是Page_Load），这样每次构造页面时都会执行
        protected void Page_Init(object sender, EventArgs e)
        {
            InitGrid();
        }

        private void InitGrid()
        {
            FineUI.Pro.RenderField bf;

            bf = new FineUI.Pro.RenderField();
            bf.DataField = "Id";

            bf.HeaderText = "编号";
            Grid1.Columns.Add(bf);

            bf = new FineUI.Pro.RenderField();
            bf.DataField = "Name";

            bf.HeaderText = "姓名";
            Grid1.Columns.Add(bf);

            bf = new FineUI.Pro.RenderField();
            bf.DataField = "EntranceYear";

            bf.HeaderText = "入学年份";
            Grid1.Columns.Add(bf);

            RenderCheckField cf = new RenderCheckField();
            cf.RenderAsStaticField = true;
            cf.DataField = "AtSchool";
            cf.HeaderText = "是否在校";
            Grid1.Columns.Add(cf);

            cf = new RenderCheckField();
            cf.DataField = "AtSchool";
            cf.HeaderText = "是否在校";
            cf.ColumnID = "AtSchoolDisabled";
            cf.EnableColumnEdit = false;
            cf.RendererFunction = "renderDisabledCheck";
            cf.RenderAsStaticField = false;
            Grid1.Columns.Add(cf);


            bf = new FineUI.Pro.RenderField();

            bf.DataField = "Major";
            bf.RendererFunction = "renderMajorText";

            bf.HeaderText = "所学专业";
            bf.ExpandUnusedSpace = true;
            Grid1.Columns.Add(bf);

            Grid1.DataKeyNames = new string[] { "Id", "Name" };
        }

        #endregion

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        } 

        #endregion

        #region LoadData

        private void LoadData()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = GridSelectionMessage.HowManyRowsAreSelected(Grid1);
        }

    }
}
