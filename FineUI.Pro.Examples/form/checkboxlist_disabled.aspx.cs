using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Pro.Examples.form
{
    public partial class checkboxlist_disabled : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCheckBoxList();
            }
        }


        #region BindCheckBoxList

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

            private bool _enabled;

            public bool Enabled
            {
                get { return _enabled; }
                set { _enabled = value; }
            }

            public TestClass(string id, string name, bool enabled)
            {
                _id = id;
                _name = name;
                _enabled = enabled;
            }

        }

        private void BindCheckBoxList()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("item1", "数据绑定值 1", false));
            myList.Add(new TestClass("item2", "数据绑定值 2", false));
            myList.Add(new TestClass("item3", "数据绑定值 3", true));
            myList.Add(new TestClass("item4", "数据绑定值 4", true));

            CheckBoxList2.DataEnabledField = "Enabled";
            CheckBoxList2.DataTextField = "Name";
            CheckBoxList2.DataValueField = "Id";
            CheckBoxList2.DataSource = myList;
            CheckBoxList2.DataBind();

            CheckBoxList2.SelectedValueArray = new string[] { "item1", "item3" };
        }
        #endregion

        #region Events

        protected void btnServerSetSelectedValue_Click(object sender, EventArgs e)
        {
            CheckBoxList1.SelectedValueArray = new string[] {"value1", "value3"};
        }

        protected void btnServerGetSelectedValue_Click(object sender, EventArgs e)
        {
            if (CheckBoxList1.SelectedValueArray.Length > 0)
            {
                ShowNotify(String.Format("列表一的选中项：{0}", String.Join(", ", CheckBoxList1.SelectedValueArray)));
            }
            else
            {
                ShowNotify("列表一没有选中项！");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("列表二的选中项：" + String.Join(", ", CheckBoxList2.SelectedValueArray));
        }

        
        #endregion


    }
}
