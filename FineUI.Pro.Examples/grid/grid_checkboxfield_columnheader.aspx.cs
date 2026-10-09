using System;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_checkboxfield_columnheader : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RenderCheckField cbf1 = Grid1.FindColumn("CheckBoxField1") as RenderCheckField;
                cbf1.HeaderCssClass = "myheadercheckbox";
                cbf1.HeaderTextRawHtml = new RawHtml("<i class=\"f-icon f-grid-checkbox f-iconfont f-checkbox\"></i>&nbsp;是否在校1");

                RenderCheckField cbf2 = Grid1.FindColumn("CheckBoxField2") as RenderCheckField;
                cbf2.HeaderCssClass = "myheadercheckbox";
                cbf2.HeaderTextRawHtml = new RawHtml("<i class=\"f-icon f-grid-checkbox f-iconfont f-checkbox\"></i>&nbsp;是否在校2");

                RenderCheckField cbf3 = Grid1.FindColumn("CheckBoxField3") as RenderCheckField;
                cbf3.HeaderCssClass = "myheadercheckbox";
                cbf3.HeaderTextRawHtml = new RawHtml("<i class=\"f-icon f-grid-checkbox f-iconfont f-checkbox\"></i>&nbsp;是否在校3");

                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "CheckSelectedRows")
            {
                labResult.Text = GridSelectionMessage.GetCheckStateResult(
                    e.EventArgumentsAsJObject["rows"] as JArray,
                    new string[] { "CheckBoxField1", "CheckBoxField2", "CheckBoxField3" },
                    new string[] { "是否在校1", "是否在校2", "是否在校3" });
            }
        }


        #endregion


    }
}
