<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="模型、视图、控制器（MVC）（双向绑定静态数据）.aspx.cs" Inherits="WebApplication1.模型_视图_控制器_MVC_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body ng-controller="MyAppController">
    <form id="form1" runat="server">
        <div ng-repeat="text in someText">
            <input ng-model="text.text" />
            <p>{{text.text}}</p>
            <p>{{text.text1}}</p>
            <%--方法一({{}})(数据未加载完，用户可能没有渲染的界面。)--%>
            <p ng-bind-html-unsafe="text.text2"></p>
            <%--方法二(ng-bind) 建议用(数据加载后，用户才能看到渲染后的界面。)--%>

            <script src="js/angular-1.0.1.min.js"></script>
            <script>
                var myAppModule = angular.module("myApp", []);
                myAppModule.controller("MyAppController",
                        function MyAppController($scope) {
                            var messages = {};
                            messages.myTestText = { text: "远离全局变量！", text1: "方法一({{}})(数据未加载完，用户可能没有渲染的界面。)！", text2: "方法二(ng-bind) 建议用(数据加载后，用户才能看到渲染后的界面。！" };
                            $scope.someText = messages;
                        }
                    );

            </script>
        </div>
    </form>
</body>
</html>
