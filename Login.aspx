﻿<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Login.aspx.cs" Inherits="FixAMz_WebApplication.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FixAMz</title>
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
    <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/CustomStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SystemUserConnectionString %>" 
            SelectCommand="SELECT * FROM [SystemUser]"></asp:SqlDataSource>
        <div class="row">
            <div class="col-md-12" >
                <div class="row header">
                    <div class="col-md-3">
                        <img src="img/fixamz.png" class="logo" />
                    </div>
                    <div class="col-md-5 logo-text hidden-xs hidden-sm">
                        The Web Based Asset Management System
                    </div>
                    <div class="col-md-4" style="padding-top: 10px; padding-right: 0px; text-align: right;">
                        <asp:TextBox ID="SearchTextBox" class="search-box" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 login-box-container">
                <div class="login-welcome">Welcome to FixAMz</div>
                <div class="input-group login-box">
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="UsernameTextBox" runat="server" style="border-radius:8px;" 
                            class="form-control login-textbox" placeholder="Username"></asp:TextBox>
                        <i class="glyphicon glyphicon-user form-control-feedback custome-glyphicon"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="PasswordTextBox" runat="server" type="password" style="border-radius:8px;" 
                            class="form-control login-textbox" placeholder="Password"></asp:TextBox>
                        <i class="glyphicon glyphicon-lock form-control-feedback custome-glyphicon"></i>
                    </div>
                    <div class="remember-me-container">
                        <asp:CheckBox ID="RememberMeCheckBox" runat="server" />Remember me
                    </div>
                    <div>
                        <asp:Button ID="SignInBtn" runat="server" Text="Sign in" 
                            class="expand-item-btn login-btn" onclick="SignInBtn_Click"/>
                    </div>
                    <div class="forgot-password-container">
                        <a href="#" >Forgot password?</a>
                    </div>
                </div>
                <div id="responseArea" runat="server"></div>
            </div>
            <div class="col-md-7 image-container">
                <img src="img/1.png" />
            </div>
        </div>
        <div id="footer" class="row">
            <div class="row footer-up">
                <ul class="footer-nav">
				    <li><a href="#">About</a></li>
				    <li><a href="#">help</a></li>
				    <li><a href="#">site map</a></li>
			    </ul>
            </div>
            <div class="row footer-down">
                <div class="col-md-5">Copyright &copy; 2015 National Water Supply and Drainage Board.<br>All Rights Reserved.</div>
		        
                <div class="col-md-7 developer-link">    
                    <a href="#">Developer site<img src="img/developerIcon.png" /></a>
                </div>
                <img src="img/logoSimble.png" style="float:right; width:47px; opacity:0.25" />
            </div>
        </div>
    </div>
    <script src="Scripts/JQuery-1.11.3.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/CustomScripts.js" type="text/javascript"></script>
    </form>
</body>
</html>
