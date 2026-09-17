using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_changeconfirm_formandgrid : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }


        }

        private void BindGrid()
        {
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        


        protected void btnClosePostBack_Click(object sender, EventArgs e)
        {
            ShowNotify("表单和表格提交成功！");

            // 保存数据后，清空面板内表单字段的改变状态
            SimpleForm1.ClearDirty();

            // 表格重新绑定，清空改变状态
            BindGrid();
        }



        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_form_changeconfirm_formandgrid";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion
        
    }
}
