using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace WebApplication1
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Users model = new Users();
            model.Name = textBoxUserName.Text;
            model.Account = textBoxAccount.Text;
            model.Password = textBoxPassWord.Text;
            model.Sort = Convert.ToInt32(SpinEditSort.Text);
            model.Status = Convert.ToInt32(comBoxStatus.Text);
            model.Note = listBoxNote.TextField;

           int n= UserManager.InsertUserInfo(model);
           if(n==1)
           {
             
           }
           
            
        }
    }
}