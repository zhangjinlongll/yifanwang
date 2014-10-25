<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="折扣购物车.aspx.cs" Inherits="WebApplication1.折扣购物车" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server" ng-controller="CartController">
        <div >
            <div ng-repeat="item in items">
                <span  ng-bind-html-unsafe="item.title"></span>
                <input ng-model="item.quantity" />
                <span ng-bind-html-unsafe="item.price | currency"></span>
                <span ng-bind-html-unsafe="item.price * item.quantity  | currency"></span>
            </div>

            <div>原价:  {{totalCart()  | currency}}</div>
            <div>折扣:    {{bill.discount  | currency}}</div>
            <div>优惠后:  {{subtotal()  | currency}}</div>
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
        </div>
    </form>
</body>
</html>
