using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.iframe
{
    public partial class passvalue_iframe_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSheng();
            }
        }

        private void BindSheng()
        {
            ddlSheng.DataTextField = "Name";
            ddlSheng.DataValueField = "Code";
            ddlSheng.DataSource = ProvinceCityCountyData.Provinces;
            ddlSheng.DataBind();

            string selectedParam = Request.QueryString["selected"];
            if (!String.IsNullOrEmpty(selectedParam))
            {
                ddlSheng.SelectedValue = ProvinceCityCountyData.ProvinceCode(selectedParam);
            }
        }



        protected void ddlSheng_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(ddlSheng.SelectedValue) && ddlSheng.SelectedValue != "-1")
            {
                PageContext.RegisterStartupScript(ActiveWindow.GetWriteBackValueReference(ProvinceCityCountyData.ProvinceName(ddlSheng.SelectedValue)) + ActiveWindow.GetHideReference());
            }
        }

    }
}
