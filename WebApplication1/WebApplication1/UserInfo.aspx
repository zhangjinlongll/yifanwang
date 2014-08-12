<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="WebApplication1.UserInfo" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <script src="BootStrap/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Add_Click() {
            window.open("Add.aspx", "", "width=600,height=450,left=250,top=220,toolbar=no , menubar=no, scrollbars=yes, resizable=no, location=no, status=no");
        }
        function Edit_Click() {
            window.open("Edit.aspx", "", "width=600,height=450,left=250,top=220,toolbar=no , menubar=no, scrollbars=yes, resizable=no, location=no, status=no");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <button class="btn  btn-success" runat="server" onclick="return Add_Click();">添加</button>
            
        
        <asp:Button class="btn btn-primary" runat="server" OnClick="DeleteUserInfo_Click"
            OnClientClick="return confirm('即将删除所有选中的目标，是否继续？')" Text="删除所选" />
    </div>
    <div>
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" KeyFieldName="ID"
            ClientInstanceName="grid" Width="825px" OnRowUpdated="ASPxGridView1_RowUpdated"
            OnCustomCallback="ASPxGridView1_CustomCallback" OnRowUpdating="ASPxGridView1_RowUpdating"
            OnRowDeleting="grid_RowDeleting">
            <%-- <SettingsPager Mode="ShowAllRecords" />--%>
            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0"
                    SelectAllCheckboxMode="Page" ShowSelectCheckbox="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="姓名" FieldName="Name" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="账号" FieldName="Account" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="密码" FieldName="Password" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="状态" FieldName="Status" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="序号" FieldName="Sort" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="日志" FieldName="Note" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
       <%--         <dx:GridViewCommandColumn Caption="编辑" ShowEditButton="True" VisibleIndex="7">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton Text="编辑">
                        
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>--%>
                <dx:GridViewDataColumn Caption="操作">
                    <DataItemTemplate>
                        <%--<asp:Button ID="Button1" runat="server"/>--%>
                        <img alt="编辑" src="images/log_4.gif" />
                        <a runat="server" onclick="return Edit_Click();">编辑</a>
                        <img alt="删除" src="images/heng.gif" />
                        <a href="javascript:deleteRow('<%# Container.KeyValue.ToString() %>');">删除</a>
                       
                    </DataItemTemplate>
                </dx:GridViewDataColumn>

            </Columns>
            <SettingsPager PageSize="5" Summary-AllPagesText="总页" LastPageButton-Visible="true"
                FirstPageButton-Visible="true" LastPageButton-Text="末页" FirstPageButton-Text="首页"
                PrevPageButton-Text="上一页" NextPageButton-Text="下一页" AlwaysShowPager="True">
                <FirstPageButton Text="首页" Visible="True">
                </FirstPageButton>
                <LastPageButton Text="末页" Visible="True">
                </LastPageButton>
                <NextPageButton Text="下一页">
                </NextPageButton>
                <PrevPageButton Text="上一页">
                </PrevPageButton>
                <Summary AllPagesText="总页"></Summary>
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
            <Settings ShowTitlePanel="true" />
            <SettingsText Title="Popup Edit Form Editing" />
            <SettingsPopup>
                <EditForm Width="600"/>
            </SettingsPopup>
        </dx:ASPxGridView>
    </div>
    </form>
</body>
</html>
