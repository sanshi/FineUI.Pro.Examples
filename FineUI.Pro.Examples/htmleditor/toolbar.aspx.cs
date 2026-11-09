using System;

namespace FineUI.Pro.Examples.htmleditor
{
    public partial class toolbar : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlEditor1.Options.Add(new OptionItem
            {
                Key = "toolbar",
                Value = "[\"bold\",\"italic\",\"underline\",\"|\",\"bulletList\",\"link\",\"source\"]",
                PersistOriginal = true
            });
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextArea1.Text = HtmlEditor1.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            HtmlEditor1.Text = TextArea1.Text;
        }
    }
}
