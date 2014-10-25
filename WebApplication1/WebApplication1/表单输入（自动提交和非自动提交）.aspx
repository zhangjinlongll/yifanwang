<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="表单输入（自动提交和非自动提交）.aspx.cs" Inherits="WebApplication1.表单输入_自动提交和非自动提交_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body ng-controller="StartUpController">
    <%-- 方法一（非自动触发） --%>
    <%--<form id="form1" runat="server" ng-submit="requstFunding()">
        输入：<input ng-change="completeNeeded()" ng-model="funding.starFunding" />
        <button>提交</button>
        输出结果：<p ng-bind-html-unsafe="funding.needResult"></p>
    </form>
    <script src="js/angular-1.0.1.min.js"></script>
    <script>
        function StartUpController($scope) {
            $scope.funding = { starFunding: 0 };
            $scope.completeNeeded = function () {
                $scope.funding.needResult = $scope.funding.starFunding * 10;
                window.alert($scope.funding.needResult);
            };
            $scope.requstFunding = function () {
                window.alert("对不起，请让更多的客户第一！");
            };
        }
    </script>--%>
    <%-- 方法二 自动触发 --%>
    <%--<form id="form2" runat="server" ng-submit="requstFunding()">
        输入：<input  ng-model="funding.starFunding" /> <%--去掉 ng-change="completeNeeded()"--%>
        <%--<button>提交</button>
        输出结果：<p ng-bind-html-unsafe="funding.needResult"></p>
    </form>
    <script src="js/angular-1.0.1.min.js"></script>
    <script>
        function StartUpController($scope) {
            $scope.funding = { starFunding: 0 };//初始化
            completeNeeded = function () {//去掉$scope.
                $scope.funding.needResult = $scope.funding.starFunding * 10;//增加10倍
                window.alert($scope.funding.needResult);
            };
            $scope.requstFunding = function () {
                window.alert("对不起，请让更多的客户第一！");
            };
            $scope.$watch("funding.starFunding", completeNeeded);//funding.starFunding 改变时（这里为0），触发completeNeeded
        }
    </script>--%>
    <!--重置按钮 用第一种方法非自动触发-->
    <form id="form1" runat="server" ng-submit="requstFunding()">
        输入：<input  ng-model="starFunding" /> <%--去掉 ng-change="completeNeeded()"--%>
        <button>提交</button>
        
        输出结果：<p ng-bind-html-unsafe="needResult"></p>
    </form><button ng-click="reset()">重置</button>
    <script src="js/angular-1.0.1.min.js"></script>
    <script>
        function StartUpController($scope) {
            $scope.completeNeeded = function () {
                $scope.needResult = $scope.starFunding * 10;//增加10倍
                window.alert($scope.funding.needResult);
            };
            $scope.requstFunding = function () {
                window.alert("对不起，请让更多的客户第一！");
            };
            $scope.reset = function () {
                $scope.starFunding = 0;//初始化变量
            };
        }
    </script>
</body>
</html>
