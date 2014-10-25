<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="购物车列表.aspx.cs" Inherits="WebApplication1.购物车列表" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table ng-controller="CartController">
            <thead>
                <tr>
                    <th>名称</th>
                    <th>数量</th>
                    <th>单价</th>
                </tr>
            </thead>
            <tr ng-repeat="item in items">
                <th ng-bind-html-unsafe="item.title"></th>
                <%--<th ng-model="item.quantity" />--%>
                <th><inpunt ng-model="item.quantity" /></th>
                <th ng-bind-html-unsafe="item.price | currency"></th>
                <%--<thead>
  <tr>
    <th ng-repeat="column in vm.columns" ng-if="!column.hidden" ng-click="vm.sort.toggle(column)"
        ng-class="{sortable: column.sortable !== false}">
      {{column.label}}
      <i ng-if="column.name === vm.sort.column && vm.sort.direction"
         class="glyphicon {{vm.sort.direction|orderClass}}"></i>
    </th>
  </tr>
  </thead>--%>
            </tr>
            <script src="js/angular-1.0.1.min.js"></script>
            <script>
                function CartController($scope) {
                    $scope.bill = {};
                    $scope.items = [
                    { title: '油漆罐', quantity: 8, price: 3.95 },
                    { title: '圆点', quantity: 17, price: 12.95 },
                    { title: '鹅卵石', quantity: 5, price: 6.95 }
                    ];
                    $scope.totalCart = function () {
                        var total = 0;
                        for (var i = 0, len = $scope.items.length; i < len; i++) {
                            total = total + $scope.items[i].price * $scope.items[i].quantity;
                        }
                        return total;
                    }
                    $scope.subtotal = function () {
                        return $scope.totalCart() - $scope.bill.discount;
                    };
                    function calculateDiscount(newValue, oldValue, scope) {
                        $scope.bill.discount = newValue > 100 ? 10 : 0;
                    }

                    $scope.$watch($scope.totalCart, calculateDiscount);
                }
            </script>

        </table>
    </form>
</body>
</html>
