<%@ Page Language="C#" AutoEventWireup="true" Inherits="WebTinTuc.admin.Login" Codebehind="Login.aspx.cs" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Quản lý sinh viên</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">
<div class="container">
    <form class="form-signin" runat="server" DefaultButton="loginButton">
        <h2 class="form-signin-heading">Đăng nhập</h2>
        <div class="login-wrap">
            <asp:Panel runat="server" ID="thongbao" class="alert alert-info alert-block fade in" Visible="false">
                <asp:Label runat="server" ID="lblMessage">Thông báo</asp:Label>
            </asp:Panel>
            <asp:TextBox runat="server" id="txtUsername" class="form-control" placeholder="Tên đăng nhập" autofocus="autofocus"/>
            <asp:TextBox runat="server" id="txtPassword" TextMode="Password" class="form-control" placeholder="Mật khẩu" autofocus="autofocus"/>
            <asp:LinkButton ID="loginButton" runat="server" class="btn btn-lg btn-login btn-block" OnClick="Check" Text="Đăng nhập"/>
        </div>
    </form>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>