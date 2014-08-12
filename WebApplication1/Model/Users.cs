using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Users
    {
        int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        string _account;

        public string Account
        {
            get { return _account; }
            set { _account = value; }
        }
        string _password;

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }

        int _status;

        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }
        int _sort;

        public int Sort
        {
            get { return _sort; }
            set { _sort = value; }
        }
        string _note;

        public string Note
        {
            get { return _note; }
            set { _note = value; }
        }

    }
}
