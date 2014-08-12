<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebApplication1.Add" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxLabel ID="lblUserName" runat="server" Text="姓名:"/>
        <dx:ASPxTextBox ID="textBoxUserName" runat="server" Width="170px">
        </dx:ASPxTextBox>
        <dx:ASPxLabel ID="lblAccount" runat="server" Text="账号:">
        </dx:ASPxLabel>
        <dx:ASPxTextBox ID="textBoxAccount"  runat="server" Width="170px">
        </dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server"  Text="密码:"/>
        <dx:ASPxTextBox ID="textBoxPassWord" runat="server" Password="true" Width="170px">
        </dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="状态">
        </dx:ASPxLabel>
        <dx:ASPxComboBox ID="comBoxStatus" DropDownStyle="DropDown" runat="server">
        </dx:ASPxComboBox>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="序号">
        </dx:ASPxLabel>
        <dx:ASPxSpinEdit ID="SpinEditSort" runat="server" Number="0">
        </dx:ASPxSpinEdit>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="日志">
        </dx:ASPxLabel>
        <dx:ASPxListBox ID="listBoxNote"  runat="server" ValueType="System.String" 
            Width="463px">
        </dx:ASPxListBox>
        <br />
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="确定" 
            onclick="ASPxButton1_Click">
        </dx:ASPxButton>
        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="取消">
        </dx:ASPxButton>
    </div>
    </form>
</body>
</html>
