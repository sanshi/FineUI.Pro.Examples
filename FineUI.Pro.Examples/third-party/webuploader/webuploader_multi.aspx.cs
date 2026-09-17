using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.thirdparty
{
    public partial class webuploader_multi : WebUploaderPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                BindGrid1();

                BindGrid2();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_Rebind")
            {
                BindGrid1();
            }
            else if (e.EventName == "Grid2_Rebind")
            {
                BindGrid2();
            }
        }

        #region BindGrid

        private void BindGrid1()
        {
            Grid1.DataSource = GetSourceData("webuploader.webuploader_multi.1");
            Grid1.DataBind();

        }

        private void BindGrid2()
        {
            Grid2.DataSource = GetSourceData("webuploader.webuploader_multi.2");
            Grid2.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DeleteRow("webuploader.webuploader_multi.1", e.RowID);

                BindGrid1();
            }
        }

        protected void Grid2_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DeleteRow("webuploader.webuploader_multi.2", e.RowID);

                BindGrid2();
            }
        }
        #endregion

    }
}
