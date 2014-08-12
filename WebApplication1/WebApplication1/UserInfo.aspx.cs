using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using Model;
using DevExpress.Web.ASPxEditors;

namespace WebApplication1
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grid.Settings.ShowFilterRowMenu = true;
            bind();
            
        }

        private void bind()
        {
            DataTable dt = UserManager.GetUserInfo();
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    grid.DataSource = dt;
                }
                grid.DataBind();
            }
        }

        protected void ASPxGridView1_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //e.NewValues["Name"] = (ASPxGridView1.FindEditFormTemplateControl("txtName")
            //   as ASPxTextBox).Value;    
     
        }


        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters == "Delete")
            {
                var table = (DataTable)Session["table"];
                List<Object> selectItems = grid.GetSelectedFieldValues("ID");
                foreach (object selectItemId in selectItems)
                {
                    table.Rows.Remove(table.Rows.Find(selectItemId));
                }
                grid.DataBind();
                grid.Selection.UnselectAll();
            }
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {         
            //取值 用e.NewValues[索引]
            string id = Convert.ToString(e.Keys[0]);
            string name = e.NewValues[0].ToString();
            string acount = e.NewValues[1].ToString();
            string password = e.NewValues[2].ToString();
            int status =Convert.ToInt32(e.NewValues[3]);
            int sort = Convert.ToInt32(e.NewValues[4]);
            string note = e.NewValues[5].ToString();
            UserManager.UpdateUserInfo(id,name,acount,password,status,sort,note);

            grid.CancelEdit();//结束编辑状态
            e.Cancel = true;
            bind();


        }

        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
           
            string id = Convert.ToString(e.Keys[0]);
            UserManager.DeteteUserInfo(id);
            e.Cancel = true;//否则，只有刷新页面才能看到删除后的结果
            //upd.DelDownFileList(id);//从数据库删除记录
            //UpLoadFileListBind();//数据表绑定
            //ASPxGridView自带的删除提示，设两个属性即可：
        }

        protected void DeleteUserInfo_Click(object sender, EventArgs e)
        {
            
            //获取选中的记录Id                   
            List<object> isSelectValues = grid.GetSelectedFieldValues("ID");
            for (int i = 0; i < isSelectValues.Count; i++)
            {
                for (int j = 0; j <= i; j++)
                {
                   var delid= isSelectValues[i];
                   UserManager.DeteteUserInfo(delid);
                    //delId += isSelectValues[i] + ",";
                }
            }
            bind();
            //delId = delId.Substring(0, delId.LastIndexOf(','));
            //return delId;           
        }

    }
}