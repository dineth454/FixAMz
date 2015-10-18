﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;

namespace FixAMz_WebApplication
{
    public partial class AdminUserPeopleTab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setEmpID();
            responseArea.InnerHtml = "";
            Page.MaintainScrollPositionOnPostBack = true; //remember the scroll position on post back
            setUserName();
        }

        //Setting user name on header
        protected void setUserName()
        {
            try
            {
                String username = HttpContext.Current.User.Identity.Name;
                String query = "SELECT Employee.firstName, Employee.lastName FROM Employee INNER JOIN SystemUser ON Employee.empID=SystemUser.empID WHERE SystemUser.username='" + username + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                String output = "";
                while (dr.Read())
                {
                    output = dr["firstName"].ToString() + " " + dr["lastName"].ToString();
                }
                userName.InnerHtml = output;
            }
            catch (SqlException exx)
            {
                responseArea.Style.Add("color", "orangered");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(exx.ToString());
            }
        }

        //Signing out
        protected void SignOutLink_clicked(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

        protected void setEmpID() //Reads the last empID from DB, calculates the next and set it in the web page.
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();
                String query = "SELECT TOP 1 empID FROM SystemUser ORDER BY empID DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                String newEmpID;
                if (cmd.ExecuteScalar() != null)
                {
                    String lastEmpID = (cmd.ExecuteScalar().ToString()).Trim();
                    String chr = Convert.ToString(lastEmpID[0]);
                    String temp = "";
                    for (int i = 1; i < lastEmpID.Length; i++)
                    {
                        temp += Convert.ToString(lastEmpID[i]);
                    }
                    temp = Convert.ToString(Convert.ToInt16(temp) + 1);
                    newEmpID = chr;
                    for (int i = 1; i < lastEmpID.Length - temp.Length; i++)
                    {
                        newEmpID += "0";
                    }
                    newEmpID += temp;
                }
                else
                {
                    newEmpID = "E00001";
                }

                AddNewEmpID.InnerHtml = newEmpID;
                conn.Close();
            }
            catch (SqlException e)
            {
                responseArea.Style.Add("color", "Yellow");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(e.ToString());
            }
        }

        [WebMethod]//username validity checking in client side with ajax
        public static int checkUsername(string Username)
        {
            //To send a JSON object -> HttpContext.Current.Response.Write("{'response' : '" + res + "'}");
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();
                String query = "SELECT COUNT(*) FROM SystemUser WHERE username='" + Username + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                int res = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                return res;
            }
            catch (SqlException)
            {
                return 2;
            }
        } 
        
        //Add new user
        protected void AddUserBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();
                string insertion_Employee = "insert into Employee (empID, firstName, lastName, contactNo, email) values (@empid, @firstname, @lastname, @contact, @email)";
                SqlCommand cmd = new SqlCommand(insertion_Employee, conn);
                cmd.Parameters.AddWithValue("@empid", AddNewEmpID.InnerHtml);
                cmd.Parameters.AddWithValue("@firstname", AddNewFirstNameTextBox.Text);
                cmd.Parameters.AddWithValue("@lastname", AddNewLastNameTextBox.Text);
                cmd.Parameters.AddWithValue("@contact", AddNewContactTextBox.Text);
                cmd.Parameters.AddWithValue("@email", AddNewEmailTextBox.Text);

                cmd.ExecuteNonQuery();

                string insertion_User = "insert into SystemUser (empID, username, password, type) values (@empid, @username, @password, @type)";
                cmd = new SqlCommand(insertion_User, conn);

                String encriptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(AddNewPasswordTextBox.Text, "SHA1");

                cmd.Parameters.AddWithValue("@empid", AddNewEmpID.InnerHtml);
                cmd.Parameters.AddWithValue("@username", AddNewUsernameTextBox.Text);
                cmd.Parameters.AddWithValue("@password", encriptedPassword);
                cmd.Parameters.AddWithValue("@type", TypeDropDownList.SelectedValue);

                cmd.ExecuteNonQuery();

                conn.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "addNewClearAll", "addNewClearAll();", true);
                setEmpID();
                responseArea.Style.Add("color", "green");
                responseArea.InnerHtml = "User " + AddNewFirstNameTextBox.Text + " " + AddNewLastNameTextBox.Text + " added successfully!";
                

            }
            catch (Exception ex)
            {
                responseArea.Style.Add("color", "orangered");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(ex.ToString());
            }
        }

        //Update user
        protected void UpdateUserFindBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();

                String empID = UpdateEmpIDTextBox.Text;

                string check = "select count(*) from SystemUser WHERE empID='" + empID + "'";
                SqlCommand cmd = new SqlCommand(check, conn);
                int res = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (res == 1)
                {
                    String query = "SELECT empID, firstName, lastName, contactNo, email FROM Employee WHERE empID='" + empID + "'";
                    cmd = new SqlCommand(query, conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        UpdateEmpID.InnerHtml = dr["empID"].ToString();
                        UpdateFirstNameTextBox.Text = dr["firstName"].ToString();
                        UpdateLastNameTextBox.Text = dr["lastName"].ToString();
                        UpdateContactTextBox.Text = dr["contactNo"].ToString();
                        UpdateEmailTextBox.Text = dr["email"].ToString();
                    }
                    updateUserInitState.Style.Add("display", "none");
                    updateUserSecondState.Style.Add("display", "block");
                    UpdateUserContent.Style.Add("display", "block");
                    UpdateEmpIDValidator.InnerHtml = "";
                }
                else
                {
                    updateUserInitState.Style.Add("display", "block");
                    updateUserSecondState.Style.Add("display", "none");
                    UpdateUserContent.Style.Add("display", "block");
                    UpdateEmpIDValidator.InnerHtml = "Invalid employee ID";
                }
                conn.Close();
                //updating expandingItems dictionary in javascript
                ClientScript.RegisterStartupScript(this.GetType(), "setExpandingItem", "setExpandingItem('UpdateUserContent');", true);
            }
            catch (SqlException ex)
            {
                responseArea.Style.Add("color", "Yellow");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(e.ToString());
            }

        }

        protected void UpdateUserBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();
                String empID = UpdateEmpIDTextBox.Text;
                string insertion_Employee = "UPDATE Employee SET firstName = @firstname, lastName = @lastname, contactNo = @contact, email = @email WHERE empID='" + empID + "'";
                SqlCommand cmd = new SqlCommand(insertion_Employee, conn);

                cmd.Parameters.AddWithValue("@firstname", UpdateFirstNameTextBox.Text);
                cmd.Parameters.AddWithValue("@lastname", UpdateLastNameTextBox.Text);
                cmd.Parameters.AddWithValue("@contact", UpdateContactTextBox.Text);
                cmd.Parameters.AddWithValue("@email", UpdateEmailTextBox.Text);

                cmd.ExecuteNonQuery();

                conn.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "updateClearAll", "updateClearAll();", true);

                responseArea.Style.Add("color", "green");
                responseArea.InnerHtml = "Employee '" + empID + "' updated successfully!";

                updateUserInitState.Style.Add("display", "block");
                updateUserSecondState.Style.Add("display", "none");
                UpdateUserContent.Style.Add("display", "block");
                UpdateEmpIDTextBox.Text = "";

            }
            catch (Exception ex)
            {
                responseArea.Style.Add("color", "orangered");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(ex.ToString());
            }
        }

        //Advanced user search

        protected void SearchUserBtn_Click(object sender, EventArgs e)
         {
             String empID = SearchEmployeeIDTextBox.Text.Trim();
             String firstname = SearchFirstNameTextBox.Text.Trim();
             String lastname = SearchLastNameTextBox.Text.Trim();
             String email = SearchEmailTextBox.Text.Trim();
             String contact = SearchEmailTextBox.Text.Trim();
             String username = SearchUsernameTextBox.Text.Trim();
              
             String resultMessage = "";

             String query = "SELECT * FROM Employee WHERE";
             if (empID != "")
             {
                 query += " empID='" + empID + "'";
                 resultMessage += empID + ", ";
             }
             if (firstname != "")
             {
                 query += " AND firstname like '%" + firstname + "%'";
                 resultMessage += firstname + ", ";
             }
             if (lastname != "")
             {
                 query += " AND lastname='" + lastname + "'";
                 resultMessage += lastname + ", ";
             }
             if (email != "")
             {
                 query += " AND email='" + email + "'";
                 resultMessage += email + ", ";
             }
             if (contact != "")
             {
                 query += " AND contact='" + contact + "'";
                 resultMessage += contact + ", ";
             }
             
             // Clearing the grid view
             UserSearchGridView.DataSource = null;
             UserSearchGridView.DataBind();

             query = query.Replace("WHERE AND", "WHERE ");
             //Response.Write(query + "<br>");
             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString); //database connectivity
             try
             {
                 conn.Open();

                 SqlCommand cmd = new SqlCommand(query, conn);
                 SqlDataReader reader = cmd.ExecuteReader();
                 if (reader != null && reader.HasRows) //if search results found
                 {
                     DataTable dt = new DataTable();
                     dt.Load(reader);

                     UserSearchGridView.DataSource = dt;  //display found data in grid view
                     UserSearchGridView.DataBind();
                     responseArea.Style.Add("color", "rgb(20, 210, 20)");
                     responseArea.InnerHtml = "Search Results Found for " + resultMessage;
                 }
                 else
                 {
                     responseArea.Style.Add("color", "orangered");
                     responseArea.InnerHtml = "No Results Found for " + resultMessage;
                 }
                 conn.Close();
             }
             catch (Exception ex)
             {
                 responseArea.Style.Add("color", "orangered");
                 responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                 Response.Write(ex.ToString());
             }

         }

        /*protected void SearchUserBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString); //database connectivity

            UserSearchGridView.Visible = true;
            int empidLength = SearchEmployeeIDTextBox.Text.Length; //Get length of textbox value
            int firstnameLength = SearchFirstNameTextBox.Text.Length;
            int lastnameLength = SearchLastNameTextBox.Text.Length;
            int emailLength = SearchEmailTextBox.Text.Length;
            int contactLength = SearchContactTextBox.Text.Length;
            int usernameLength = SearchUsernameTextBox.Text.Length;

            try
            {
                if (empidLength != 0)
                {
                    conn.Open();
                    //string pattern =  SearchEmployeeIDTextBox.Text;
                    string Search_User = "Select * FROM Employee WHERE empID LIKE '%'+ @SearchEmployeeIDTextBox +'%'"; //select data from database

                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    cmd.Parameters.AddWithValue("@SearchEmployeeIDTextBox", SearchEmployeeIDTextBox.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows) //if search results found
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;  //display found data in grid view
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else //search results not found
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }
                else if (firstnameLength != 0)
                {
                    string Search_User = "Select * FROM Employee WHERE firstname LIKE '%'+ @SearchFirstNameTextBox +'%'";
                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    cmd.Parameters.AddWithValue("@SearchFirstNameTextBox", SearchFirstNameTextBox.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }
                else if (lastnameLength != 0)
                {
                    string Search_User = "Select * FROM Employee WHERE lastname LIKE '%'+ @SearchLastNameTextBox +'%'";
                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    cmd.Parameters.AddWithValue("@SearchLastNameTextBox", SearchLastNameTextBox.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }

                else if (emailLength != 0)
                {
                    string Search_User = "Select * FROM Employee WHERE email LIKE '%'+ @SearchEmailTextBox +'%'";
                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    cmd.Parameters.AddWithValue("@SearchEmailTextBox", SearchEmailTextBox.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }

                else if (contactLength != 0)
                {
                    string Search_User = "Select * FROM Employee WHERE contact LIKE '%'+ @SearchContactTextBox +'%'";
                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    cmd.Parameters.AddWithValue("@SearchContactTextBox", SearchContactTextBox.Text);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }
                else if (usernameLength != 0)
                {
                    string Search_User = "select * from Employee inner join SystemUser on Employee.empID = SystemUser.empID where (SystemUser.username=@SearchUsernameTextBox)";
                    SqlCommand cmd = new SqlCommand(Search_User, conn);
                    SqlParameter search = new SqlParameter();
                    search.ParameterName = "@SearchUsernameTextBox";
                    search.Value = SearchUsernameTextBox.Text.Trim();
                    cmd.Parameters.Add(search);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        UserSearchGridView.DataSource = dt;
                        UserSearchGridView.DataBind();
                        responseArea.Style.Add("color", "green");
                        responseArea.InnerHtml = "Search Results Found.";
                    }
                    else
                    {
                        responseArea.InnerHtml = "No results found!";
                    }
                }

                else if (empidLength == 0 && firstnameLength == 0 && lastnameLength == 0 && emailLength == 00 && contactLength == 0)
                {
                    responseArea.InnerHtml = "Invalid Search";
                }
            }
            catch (Exception ex)
            {
                responseArea.Style.Add("color", "Yellow");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(e.ToString());
            }
            finally
            {
                conn.Close();
            }
        }*/

        protected void CancelSearchBtn_Click(object sender, EventArgs e)
        {
            var tbs = new List<TextBox>() { SearchEmployeeIDTextBox, SearchFirstNameTextBox, SearchLastNameTextBox, SearchEmailTextBox, SearchContactTextBox, SearchUsernameTextBox };
            foreach (var textBox in tbs)
            {
                textBox.Text = "";
                responseArea.InnerHtml = "";
                UserSearchGridView.Visible = false;
            }
        }
        
        //Delete user
        protected void DeleteUserFindBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();

                String empID = DeleteUserEmpIDTextBox.Text;

                string check = "select count(*) from SystemUser WHERE empID='" + empID + "'";
                SqlCommand cmd = new SqlCommand(check, conn);
                int res = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (res == 1)
                {
                    String query = "SELECT empID, firstName, lastName, contactNo, email FROM Employee WHERE empID='" + empID + "'";
                    cmd = new SqlCommand(query, conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        DeleteEmpID.InnerHtml = dr["empID"].ToString();
                        DeleteFirstName.InnerHtml = dr["firstName"].ToString();
                        DeleteLastName.InnerHtml = dr["lastName"].ToString();
                        DeleteContact.InnerHtml = dr["contactNo"].ToString();
                        DeleteEmail.InnerHtml = dr["email"].ToString();
                    }
                    deleteUserInitState.Style.Add("display", "none");
                    deleteUserSecondState.Style.Add("display", "block");
                    DeleteUserContent.Style.Add("display", "block");
                    DeleteUserEmpIDValidator.InnerHtml = "";
                    DeleteUserEmpIDTextBox.Focus();
                }
                else
                {
                    deleteUserInitState.Style.Add("display", "block");
                    deleteUserSecondState.Style.Add("display", "none");
                    DeleteUserContent.Style.Add("display", "block");
                    DeleteUserEmpIDValidator.InnerHtml = "Employee ID not found!";
                    DeleteEmpID.Focus();
                }
                conn.Close();
                //updating expandingItems dictionary in javascript
                ClientScript.RegisterStartupScript(this.GetType(), "setExpandingItem", "setExpandingItem('DeleteUserContent');", true);
            }
            catch (SqlException ex)
            {
                responseArea.Style.Add("color", "Yellow");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(e.ToString());
            }
        }

        protected void DeleteUserBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SystemUserConnectionString"].ConnectionString);
                conn.Open();

                String empID = DeleteUserEmpIDTextBox.Text;

                string deleteQuerySystemUser = "DELETE FROM SystemUser WHERE empID='" + empID + "'";
                string deleteQueryEmployee = "DELETE FROM Employee WHERE empID='" + empID + "'";
                SqlCommand cmd = new SqlCommand(deleteQuerySystemUser, conn);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(deleteQueryEmployee, conn);
                cmd.ExecuteNonQuery();

                conn.Close();

                responseArea.Style.Add("color", "green");
                responseArea.InnerHtml = "Employee '" + empID + "' deleted successfully!";
                deleteUserInitState.Style.Add("display", "block");
                deleteUserSecondState.Style.Add("display", "none");
                DeleteUserContent.Style.Add("display", "block");
                DeleteUserEmpIDTextBox.Text = "";
            }
            catch (SqlException)
            {
                responseArea.Style.Add("color", "Yellow");
                responseArea.InnerHtml = "There were some issues with the database. Please try again later.";
                Response.Write(e.ToString());
            }
            
        }
    }
        
}
