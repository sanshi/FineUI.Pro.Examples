using System;

namespace FineUI.Pro.Examples.datalist
{
    public partial class datalist : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataList1.Items[0].TextRawHtml = new RawHtml(
                    "<img src='{0}' alt='' /> 北京",
                    PageContext.ResolveUrl("~/res/icon/building.png"));
            }
        }
    }
}
