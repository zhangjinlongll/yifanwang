using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Model;

namespace DAL
{
   public class UserService
    {
 

       public static DataTable GetUserInfo()
       {
           string sql = string.Format(@"select * from dbo.Users");
           return DbHelper.ExecuteDataTable(sql, null).Tables[0];
       }


       public static object UpdateUserInfo(string id, string name, string acount, string password, int status, int sort, string note)
       {
           string sql = string.Format(@"UPDATE [Users]
   SET 
       [Name] ='{0}' ,[Account] = '{1}',[Password] = '{2}',[Status] ={3},[Sort] = {4},[Note] = '{5}'
       WHERE [ID]='{6}'",name,acount,password,status,sort,note,id);
           return DbHelper.ExecuteNonQuery(sql,null);
       }

       public static object DeteteUserInfo(object delid)
       {
           string sql = string.Format(@"DELETE FROM [Users] WHERE [ID]='{0}'", delid);
           return DbHelper.ExecuteNonQuery(sql, null);
       }

       public static int InsertUserInfo(Users model)
       {
           string sql = string.Format(@"INSERT INTO [Users]([ID],[Name],[Account],[Password],[Status],[Sort],[Note])
VALUES('{0}','{1}','{2}',{3},{4},'{5}')", model.Name,model.Account,model.Password,model.Status,model.Sort,model.Note);
           return DbHelper.ExecuteNonQuery(sql, null);
       }

    }
}
