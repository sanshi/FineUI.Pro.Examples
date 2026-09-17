using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class radiobuttonlist_autocolumnwidth : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRadioButtonList();
            }
        }


        #region BindRadioButtonList

        public class TestClass
        {
            private string _id;

            public string Id
            {
                get { return _id; }
                set { _id = value; }
            }
            private string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

            public TestClass(string id, string name)
            {
                _id = id;
                _name = name;
            }

        }

        private void BindRadioButtonList()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("item1", "数据绑定值 1"));
            myList.Add(new TestClass("item2", "数据绑定值 2"));
            myList.Add(new TestClass("item3", "数据绑定值 3"));
            myList.Add(new TestClass("item4", "数据绑定值 4"));

            RadioButtonList2.DataTextField = "Name";
            RadioButtonList2.DataValueField = "Id";
            RadioButtonList2.DataSource = myList;
            RadioButtonList2.DataBind();

            RadioButtonList2.SelectedValue = "item3";
        }
        #endregion

        #region Events

        protected void btnServerSetSelectedValue_Click(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedValue = "value1";
        }

        protected void btnServerGetSelectedValue_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue != null)
            {
                ShowNotify(String.Format("列表一的选中项：{0}", RadioButtonList1.SelectedValue));
            }
            else
            {
                ShowNotify("列表一没有选中项！");
            }
        }

        protected void rblAutoPostBack_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowNotify("列表三的选中项：" + rblAutoPostBack.SelectedValue);
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("列表二：" + RadioButtonList2.SelectedValue + " 列表三：" + rblAutoPostBack.SelectedValue + " 列表四：" + rblVertical.SelectedValue);
        }

        #endregion


    }
}
