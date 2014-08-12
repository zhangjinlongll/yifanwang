using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DAL;
using Model;

namespace BLL
{
   public class UserManager
    {
       public static DataTable GetUserInfo()
       {
           return UserService.GetUserInfo();
       }


       public static object UpdateUserInfo(string id, string name, string acount, string password, int status, int sort, string note)
       {
           return UserService.UpdateUserInfo(id, name, acount, password, status, sort, note);
       }



       public static object DeteteUserInfo(object delid)
       {
           return UserService.DeteteUserInfo(delid);
       }

       public static int InsertUserInfo(Users model)
       {
           return UserService.InsertUserInfo(model);
       }
    }
}
