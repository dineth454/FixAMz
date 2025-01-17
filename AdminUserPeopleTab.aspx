﻿<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="AdminUserPeopleTab.aspx.cs"
    Inherits="FixAMz_WebApplication.AdminUserPeopleTab" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <asp:SqlDataSource ID="SqlDataSourceFixAMz" runat="server" ConnectionString="<%$ ConnectionStrings:SystemUserConnectionString %>"
        SelectCommand="SELECT * FROM [SystemUser]"></asp:SqlDataSource>
    <div class="container-fluid">
<!--Header-->
        <div class="row">
            <div class="col-md-12">
                <div class="row header">
                    <div class="col-md-3">
                        <img src="img/fixamz.png" class="logo" />
                    </div>
                    <div class="col-md-5 logo-text hidden-xs hidden-sm">
                        The Web Based Asset Management System
                    </div>
                    <div class="col-md-4" style="padding-top: 10px; padding-right: 0px; text-align: right;">
                        <asp:TextBox ID="SearchTextBox" class="search-box" runat="server"></asp:TextBox>
                        <div id="user-name-box">
                            <span id="userName" runat="server">Vihanga Liyanage</span> | <a id="A1" href="#"
                                runat="server" onserverclick="SignOutLink_clicked">Sign out</a>
                        </div>
                    </div>
                    <ul class="custom-nav-bar nav nav-tabs">
                        <li><a href="#">HOME</a> </li>
                        <li><a href="#"><u>PEOPLE</u></a> </li>
                        <li><a href="AdminUserSystemTab.aspx">SYSTEM</a> </li>
                        <li><a href="#">ABOUT</a> </li>
                        <li><a href="#">HELP</a> </li>
                    </ul>
                </div>
            </div>
        </div>
<!--Main content-->
        <div class="row">
            <div class="col-md-10 col-xs-offset-1 expand-item-container">
                <div id="responseBoxGreen" runat="server">
                    <a href="#" onclick="this.parentNode.style.display = 'none';">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true" style="float: right; color: #B8F0AD; margin-top: 5px;"></span>
                    </a>
                    <div id="responseMsgGreen" runat="server"></div>
                </div>
                <div id="responseBoxRed" runat="server">
                    <a href="#" onclick="this.parentNode.style.display = 'none';">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true" style="float: right; color: #F0AEAE;; margin-top: 5px;"></span>
                    </a>
                    <div id="responseMsgRed" runat="server"></div>
                </div>
<!--Add user-->
                <div class="row expand-item">
                    <div class="col-md-12">
                        <img src="img/AddNewIcon.png" />
                        <div class="expand-item-title" id="AddNewUserHeader">
                            Add New User</div>
                        <div class="expand-item-content" id="AddNewUserContent">
                            <div class="col-md-8">
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Employee ID</div>
                                    <div id="AddNewEmpID" runat="server" class="custom-label">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        First Name</div>
                                    <asp:TextBox ID="AddNewFirstNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                    <div class="validator" id="AddNewFirstNameValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Last Name</div>
                                    <asp:TextBox ID="AddNewLastNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                    <div class="validator" id="AddNewLastNameValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Email</div>
                                    <asp:TextBox ID="AddNewEmailTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                    <div class="validator" id="AddNewEmailValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Contact</div>
                                    <asp:TextBox ID="AddNewContactTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                    <div class="validator" id="AddNewContactValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Access Level</div>
                                    <asp:DropDownList ID="TypeDropDown" class="expand-item-textbox" runat="server">
                                        <asp:ListItem Text="-- Select Level --" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Administrator" Value="admin"></asp:ListItem>
                                        <asp:ListItem Text="Manage assets" Value="manageAssetUser"></asp:ListItem>
                                        <asp:ListItem Text="View assets" Value="viewAssetUser"></asp:ListItem>
                                        <asp:ListItem Text="Generate report" Value="generateAssetReportUser"></asp:ListItem>
                                        <asp:ListItem Text="Manage and view assets" Value="manageView"></asp:ListItem>
                                        <asp:ListItem Text="Manage assets and generate reports" Value="manageReport"></asp:ListItem>
                                        <asp:ListItem Text="View assets and generate reports" Value="viewReport"></asp:ListItem>
                                        <asp:ListItem Text="All" Value="all"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="validator" id="TypeValidator" runat="server"></div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Username</div>
                                    <asp:TextBox ID="AddNewUsernameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                    <div class="validator" id="AddNewUsernameValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Password</div>
                                    <asp:TextBox ID="AddNewPasswordTextBox" class="expand-item-textbox" runat="server"
                                        type="password"></asp:TextBox>
                                    <div class="validator" id="AddNewPasswordValidator" runat="server">
                                    </div>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Confirm Password</div>
                                    <asp:TextBox ID="AddNewConfirmPasswordTextBox" class="expand-item-textbox" runat="server"
                                        type="password"></asp:TextBox>
                                    <div class="validator" id="AddNewConfirmPasswordValidator" runat="server">
                                    </div>
                                </div>
                                <div class="expand-item-row">
                                    <asp:Button ID="AddUserBtn" runat="server" Text="Add User" OnClick="AddUserBtn_Click"
                                        class="expand-item-btn" OnClientClick="return isValidAddNew()" />
                                    <asp:Button ID="AddNewCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                        OnClientClick="return addNewClearAll()" />
                                </div>
                            </div>
                            <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                <div class="add-user-icon hidden-sm hidden-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<!--Advanced user search-->
                <div class="row expand-item">
                    <div class="col-md-12">
                        <img src="img/SearchIcon.png" />
                        <div class="expand-item-title" id="AdvancedUserSearchHeader">
                            Advanced User Search</div>
                        <div class="expand-item-content" id="AdvancedUserSearchContent" runat="server">
                            <div class="col-md-8">
                            <div id="UserSearchInitState" runat="server">
                                <div class="info-div">
                                    Enter any information you have on the user to search.</div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Employee ID</div>
                                    <asp:TextBox ID="SearchEmployeeIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        First Name</div>
                                    <asp:TextBox ID="SearchFirstNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Last Name</div>
                                    <asp:TextBox ID="SearchLastNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Email</div>
                                    <asp:TextBox ID="SearchEmailTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div>
                                <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Contact</div>
                                    <asp:TextBox ID="SearchContactTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div>
                               <!-- <div class="row expand-item-row">
                                    <div class="expand-item-label">
                                        Username</div>
                                    <asp:TextBox ID="SearchUsernameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                </div> -->
                                <div class="row expand-item-row">
                                    <asp:Button ID="SearchUserBtn" runat="server" Text="Search" class="expand-item-btn"
                                        OnClick="SearchUserBtn_Click" OnClientClick="return isValidUserSearch()" />
                                    <asp:Button ID="CancelSearchBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                        OnClick="CancelSearchBtn_Click" />
                                </div>
                            </div>
                             <div id="UserSearchSecondState" runat="server">
                                    <asp:GridView ID="UserSearchGridView" runat="server" CssClass="table table-hover table-bordered" ></asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                <div class="adv-user-search-icon">
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
<!--Update user-->
                <div class="row expand-item">
                    <div class="col-md-12">
                        <div id="Div2" runat="server">
                        </div>
                        <img src="img/UpdateIcon.png" />
                        <div class="expand-item-title" id="UpdateUserHeader">
                            Update User</div>
                        <div class="expand-item-content" id="UpdateUserContent" runat="server">
                            <div class="col-md-8">
                                <div id="updateUserInitState" runat="server">
                                    <div class="info-div">
                                        Enter employee ID to start or use the advanced search below.</div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Employee ID</div>
                                        <asp:TextBox ID="UpdateEmpIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateEmpIDValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="UpdateUserFindBtn" runat="server" Text="Go" class="expand-item-btn"
                                            OnClientClick="return isValidUpdateEmpID()" OnClick="UpdateUserFindBtn_Click" />
                                    </div>
                                </div>
                                <div id="updateUserSecondState" runat="server">
                                    <div class="expand-item-row">
                                        <div class="expand-item-label">
                                            Employee ID</div>
                                        <div id="UpdateEmpID" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            First Name</div>
                                        <asp:TextBox ID="UpdateFirstNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateFirstNameValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Last Name</div>
                                        <asp:TextBox ID="UpdateLastNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateLastNameValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Email</div>
                                        <asp:TextBox ID="UpdateEmailTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateEmailValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Contact</div>
                                        <asp:TextBox ID="UpdateContactTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateContactValidator" runat="server">
                                        </div>
                                    </div>
                                    <asp:RadioButtonList ID = "RadioButtonList1" class="expand-item-textbox" runat="server">
                                        <asp:ListItem Text="Admin" Value="admin" Selected="True" ></asp:ListItem>
                                        <asp:ListItem Text="Manage Assets User" Value="manageAssetUser"></asp:ListItem>
                                        <asp:ListItem Text="View Assets User" Value="viewAssetUser"></asp:ListItem>
                                        <asp:ListItem Text="Generate Report" Value="generateAssetReportUser"></asp:ListItem>
                                        <asp:ListItem Text="Manage + View" Value="manageView"></asp:ListItem>
                                        <asp:ListItem Text="Manage + Report" Value="manageReport"></asp:ListItem>
                                        <asp:ListItem Text="View + Report" Value="viewReport"></asp:ListItem>
                                        <asp:ListItem Text="All" Value="all"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="UpdateUserBtn" runat="server" Text="Update User" class="expand-item-btn"
                                            OnClientClick="return isValidUpdate()" OnClick="UpdateUserBtn_Click" />
                                        <asp:Button ID="UpdateUserCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                            OnClientClick="return updateClearAll()" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                <div class="update-user-icon">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<!--Disable user-->
                <div class="row expand-item">
                    <div class="col-md-12">
                        <div id="Div1" runat="server">
                        </div>
                        <img src="img/DeleteIcon.png" />
                        <div class="expand-item-title" id="DeleteUserHeader">
                            Delete User</div>
                        <div class="expand-item-content" id="DeleteUserContent" runat="server">
                            <div class="col-md-8">
                                <div id="deleteUserInitState" runat="server">
                                    <div class="info-div">
                                        Enter employee ID to delete the user</div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Employee ID</div>
                                        <asp:TextBox ID="DeleteUserEmpIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="DeleteUserEmpIDValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="DeleteUserFindBtn" runat="server" Text="Go" class="expand-item-btn"
                                            OnClientClick="return isValidDeleteEmpID()" OnClick="DeleteUserFindBtn_Click" />
                                    </div>
                                </div>
                                <div id="deleteUserSecondState" runat="server">
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Employee ID</div>
                                        <div id="DeleteEmpID" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            First Name</div>
                                        <div id="DeleteFirstName" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Last Name</div>
                                        <div id="DeleteLastName" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Email</div>
                                        <div id="DeleteEmail" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Contact</div>
                                        <div id="DeleteContact" runat="server" class="custom-label">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="DeleteUserBtn" runat="server" Text="Delete User" class="expand-item-btn"
                                            OnClick="DeleteUserBtn_Click" OnClientClick="return window.confirm('Confirm user deletion.')" />
                                        <asp:Button ID="DeleteUserCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                            OnClientClick="return " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                <div class="delete-user-icon">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Ectra div for space-->
                    <div class="row">
                    </div>
                </div>
            </div>
        </div>
<!--Footer-->
        <div id="footer" class="row">
            <div class="row footer-up">
                <ul class="footer-nav">
                    <li><a href="#">About</a></li>
                    <li><a href="#">help</a></li>
                    <li><a href="#">site map</a></li>
                </ul>
            </div>
            <div class="row footer-down">
                <div class="col-md-5">
                    Copyright &copy; 2015 National Water Supply and Drainage Board.<br>
                    All Rights Reserved.</div>
                <div class="col-md-7 developer-link">
                    <a href="#">Developer site<img src="img/developerIcon.png" /></a>
                </div>
                <img src="img/logoSimble.png" style="float: right; width: 47px; opacity: 0.25" />
            </div>
        </div>
    </div>
    <script src="Scripts/JQuery-1.11.3.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/CustomScripts.js" type="text/javascript"></script>
    </form>
</body>
</html>
