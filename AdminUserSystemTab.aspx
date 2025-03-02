﻿<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="AdminUserSystemTab.aspx.cs" Inherits="FixAMz_WebApplication.AdminUserSystemTab" %>

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
                                <span id="userName" runat="server">Vihanga Liyanage</span> | <a id="A1" href="#" runat="server" onserverclick="SignOutLink_clicked">Sign out</a>
                            </div>
                        </div>
                        <ul class="custom-nav-bar nav nav-tabs">
                            <li><a href="#">HOME</a> </li>
                            <li><a href="AdminUserPeopleTab.aspx">PEOPLE</a></li>
                            <li><a href="#"><u>SYSTEM</u></a> </li>
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
<!--Add location-->
                    <div class="row expand-item">
                        <div class="col-md-12">
                            <img src="img/AddNewIcon.png" />
                            <div class="expand-item-title" id="AddLocationHeader">Add Location</div>
                            <div class="expand-item-content" id="AddLocationContent">
                                <div class="col-md-8">
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Location ID</div>
                                        <div id="AddNewLocID" runat="server" class="custom-label"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Name</div>
                                        <asp:TextBox ID="AddLocationNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationNameValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Address</div>
                                        <asp:TextBox ID="AddLocationAddressTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationAddressValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Contact</div>
                                        <asp:TextBox ID="AddLocationContactTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationContactValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Manager Office</div>
                                        <asp:TextBox ID="AddLocationManagerOfficeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationManagerOfficeValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Department</div>
                                        <asp:TextBox ID="AddLocationDepartmentTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationDepartmentValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Branch</div>
                                        <asp:TextBox ID="AddLocationBranchTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationBranchValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Zonal Office</div>
                                        <asp:TextBox ID="AddLocationZonalOfficeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddLocationZonalOfficeValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="AddLocationUserBtn" runat="server" Text="Add Location" class="expand-item-btn"
                                            OnClick="AddLocationBtn_Click" OnClientClick="return isValidAddLoc()" />
                                        <asp:Button ID="AddLocationCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                            OnClientClick="return addLocationClearAll()" />
                                    </div>
                                </div>
                                <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                    <div class="add-location-icon hidden-sm hidden-xs"></div>
                                    <div class="validator-container">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
<!--Update location-->
                    <div class="row expand-item">
                        <div class="col-md-12">
                        <div id="Div3" runat="server"></div>
                            <img src="img/UpdateIcon.png" />
                            <div class="expand-item-title" id="UpdateLocationHeader">Update Location</div>
                            <div class="expand-item-content" id="UpdateLocationContent" runat="server">
                                <div class="col-md-8">
                                    <div id="updatelocationInitState" runat="server">
                                        <div class="info-div">Enter Location ID to start </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Location ID</div>
                                            <asp:TextBox ID="UpdateLocationIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocationIDValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <asp:Button ID="LocFindBtn" runat="server" Text="Go" class="expand-item-btn" 
                                            onclick="LocFindBtn_Click" OnClientClick="return isValidUpdateLocID()"/>
                                        </div>
                                    </div>

                                    <div id="updatelocationSecondState" runat="server">
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Location ID</div>
                                            <div id="UpdateLocID" runat="server" class="custom-label"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Name</div>
                                            <asp:TextBox ID="UpdateLocNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocNameValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Address</div>
                                            <asp:TextBox ID="UpdateLocAddressTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocAddressValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Contact</div>
                                            <asp:TextBox ID="UpdateLocContactTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocContactValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Manager Office</div>
                                            <asp:TextBox ID="UpdateLocManagerOfficeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocManagerOfficeValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Department</div>
                                            <asp:TextBox ID="UpdateLocDepartmentTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocDepartmentValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Branch</div>
                                            <asp:TextBox ID="UpdateLocBranchTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocBranchValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Zonal Office</div>
                                            <asp:TextBox ID="UpdateLocZonalOfficeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLocZonalOfficeValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <asp:Button ID="UpdateLocBtn" runat="server" Text="Update Location" class="expand-item-btn"
                                                OnClientClick="return isValidUpdateLoc()" OnClick="UpdateLocBtn_click" />
                                            <asp:Button ID="updateLocCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                                OnClientClick="return updateLocationClearAll() " />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                    <div class="update-location-icon hidden-sm hidden-xs"></div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--Add category-->
                    <div class="row expand-item">
                        <div class="col-md-12">
                            <div id="Div2" runat="server"></div>
                            <img src="img/AddNewIcon.png" />
                            <div class="expand-item-title" id="AddCategoryHeader">Add Category</div>
                            <div class="expand-item-content" id="AddCategoryContent">
                                <div class="col-md-8">
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Category ID</div>
                                        <div id="AddNewCatID" runat="server" class="custom-label">></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Name</div>
                                        <asp:TextBox ID="AddCategoryNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddCategoryNameValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="AddCategoryUserBtn" runat="server" Text="Add Category"
                                            class="expand-item-btn" OnClick="AddCategoryBtn_Click" OnClientClick="return isValidAddCat()" />
                                        <asp:Button ID="AddCategoryCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                            OnClientClick="return addCategoryClearAll()" />
                                    </div>
                                </div>
                                <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                    <div class="add-categoy-icon hidden-sm hidden-xs"></div>
                                </div>
                            </div>
                        </div>
                    </div>                        
<!--Update Category-->                
                    <div class="row expand-item">
                        <div class="col-md-12">
                        <div id="Div1" runat="server"></div>
                            <img src="img/UpdateIcon.png" />
                            <div class="expand-item-title" id="UpdateCategoryHeader">Update Category</div>
                            <div class="expand-item-content" id="UpdateCategoryContent" runat="server">
                                <div class="col-md-8">
                                    <div id="updateCategoryInitState" runat="server">
                                        <div class="info-div">Enter category ID to start </div>                                
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Category ID</div>
                                        <asp:TextBox ID="UpdateCategoryIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateCategoryIDValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row"> 
                                        <asp:Button ID="UpdateCategoryGoBtn" runat="server" Text="Find" class="expand-item-btn" 
                                        OnClientClick="return isValidCategoryCatID()" onclick="UpdateCategoryGoBtn_click"  />
                                    </div>
                                    </div>
                                    <div id="updateCategorySecondState" runat="server">
                                        <div class="expand-item-row"> 
                                            <div class="expand-item-label">Category ID</div>
                                            <div id="UpdateCatID" runat="server" class="custom-label">></div>   
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Category Name</div>
                                            <asp:TextBox ID="UpdateCategoryNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateCategoryNameValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <asp:Button ID="UpdateCatBtn" runat="server" Text="Update Category" class="expand-item-btn" 
                                                OnClientClick="return isValidUpdateCat()"  onclick="UpdateCatBtn_click" />
                                            <asp:Button ID="updateCatCancelBtn" runat="server" Text="Cancel" class="expand-item-btn" 
                                                OnClientClick="return updateCategoryClearAll() " />
                                        </div> 
                                    </div>
                                </div>
                                <div class="col-md-4" style="position:relative; padding-left:0px;">
                                    <div class="update-category-icon hidden-sm hidden-xs"></div>
                                </div>
                            </div>
                            </div>
                        </div>
<!--Add sub category-->
                    <div class="row expand-item">
                        <div class="col-md-12">
                            <img src="img/AddNewIcon.png" />
                            <div class="expand-item-title" id="AddSubCategoryHeader">Add Sub Category</div>
                            <div class="expand-item-content" id="AddSubCategoryContent">
                                <div class="col-md-8">
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Sub Category ID</div>
                                        <div id="AddSubCategoryID" runat="server" class="custom-label"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Sub Category Name</div>
                                        <asp:TextBox ID="AddSubCategoryNameTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="AddSubCategoryNameValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Category</div>
                                        <asp:DropDownList ID="AddSubCategoryCategoryDropDown" class="expand-item-textbox" runat="server">
                                            </asp:DropDownList>
                                        <div class="validator" id="AddSubCategoryCategoryValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Depreciation Rate</div>
                                        <asp:TextBox ID="AddSubCategoryDepreciationRateTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        %
                                        <div class="validator" id="AddSubCategoryDepreciationRateValidator" runat="server"></div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">Life Time</div>
                                        <asp:TextBox ID="AddSubCategoryLifetimeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        years
                                        <div class="validator" id="AddSubCategoryLifetimeValidator" runat="server"></div>
                                    </div>
                                    <div class="expand-item-row">
                                        <asp:Button ID="AddSubCategoryBtn" runat="server" Text="Add Sub Category" OnClick="AddSubCategoryBtn_click"
                                            class="expand-item-btn" OnClientClick="return isValidAddSubCategory()" />
                                        <asp:Button ID="AddSubCategoryCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                            OnClientClick="return addSubCategoryClearAll()" />
                                    </div>
                                </div>
                                <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                    <div class="add-sub-categoy-icon"></div>
                                </div>
                            </div>
                        </div>
                    </div>
<!--Update sub category-->
                    <div class="row expand-item">
                        <div class="col-md-12">
                            <img src="img/UpdateIcon.png" />
                            <div class="expand-item-title" id="UpdateSubCategoryHeader">Update Sub Category</div>
                            <div class="expand-item-content" id="UpdateSubCategoryContent" runat="server">
                                <div class="col-md-8">
                                <div class="row expand-item-row">
                                <div id="updateSubCategoryInitState" runat="server">
                                    <div class="info-div">Enter sub category ID to update sub category</div>
                                    <div class="row expand-item-row">
                                        <div class="expand-item-label">
                                            Sub Category ID</div>
                                        <asp:TextBox ID="UpdateSubCategoryIDTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                        <div class="validator" id="UpdateSubCategoryIDValidator" runat="server">
                                        </div>
                                    </div>
                                    <div class="row expand-item-row">
                                        <asp:Button ID="UpdateSubCategoryFindBtn" runat="server" Text="Go" class="expand-item-btn"
                                            OnClientClick="return isValidUpdateSubCategoryID()" OnClick="UpdateSubCategoryFindBtn_Click" />
                                    </div>
                                </div> 
                                    <div id="updateSubCategorySecondState" runat="server">
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Sub Category ID</div>
                                            <div id="UpdateScatID" runat="server" class="custom-label"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Sub Category Name</div>
                                            <asp:TextBox ID="UpdateScatNameTetBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateScatNameValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Category</div>
                                            <div id="UpdateCategory" runat="server" class="custom-label"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Depreciation Rate</div>
                                            <asp:TextBox ID="UpdateDepRateTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateDepRateValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <div class="expand-item-label">Lifetime</div>
                                            <asp:TextBox ID="UpdateLifetimeTextBox" class="expand-item-textbox" runat="server"></asp:TextBox>
                                            <div class="validator" id="UpdateLifetimeValidator" runat="server"></div>
                                        </div>
                                        <div class="row expand-item-row">
                                            <asp:Button ID="UpdateScatBtn" runat="server" Text="Update Sub Category" class="expand-item-btn"
                                                OnClientClick="return isValidUpdateScat()" OnClick="UpdateScatBtn_click" />
                                            <asp:Button ID="UpdateScatCancelBtn" runat="server" Text="Cancel" class="expand-item-btn"
                                                OnClientClick="return updateSubCategoryClearAll() " />
                                        </div>
                                    </div>
                                </div>
                                </div>
                                <div class="col-md-4" style="position: relative; padding-left: 0px;">
                                    <div class="update-sub-category-icon hidden-sm hidden-xs"></div>
                                </div>
                            </div>
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

