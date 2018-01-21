<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USR_Register.aspx.cs" Inherits="Pollr.User.USR_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />

    <link href="../Assets/Bootstrap/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/Stylesheets/login.css" rel="stylesheet" type="text/css" />
    <link href="../Assets/Stylesheets/menusheet.css" rel="stylesheet" type="text/css" />
    <title>Register</title>
</head>
<body>
    <header style="box-shadow: 0 4px 8px 0 black, 0 6px 20px 0 black;">
        <div class="container">
            <img src="../Assets/Images/logo.png" style="float: left; height: 150px; width: 150px;" />
            <div style="float: right;">
                <br />
                <br />
                <br />
                <ul>
                    <li><a href="../Home.aspx">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="../Admin/ADM_Login.aspx">Admin Login</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="container">
        <form id="form1" runat="server">
            <div class="col-xs-6 col-xs-offset-3">
                <div style="margin: auto; height: 100%; font-family: 'Comic Sans MS';">
                    <h1 style="text-align: center; font-family: 'Comic Sans MS'; color: black; text-shadow: 0 0 10px white;">R E G I S T E R</h1>
                    <div class="container">
                        <br />
                        <div class="form-group">
                            <label for="name" class="control-label">Full Name:</label><br />
                            <div class="input-group col-sm-6">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field cannot be empty!" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="grp1"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="username" class="control-label">Email:</label><br />
                            <div class="input-group col-sm-6">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field cannot be empty!" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="grp1"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="password" class="control-label">Password:</label><br />
                            <div class="input-group col-sm-6">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></div>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field cannot be empty!" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="grp1"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <div class="btn-group">
                                <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn btn-default" ForeColor="Black" BackColor="LightBlue" BorderStyle="Solid" ValidationGroup="grp1" OnClick="btnReg_Click" />
                                <a href="../Home.aspx" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;Back</a>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row" style="font-family: 'Comic Sans MS';">
                            <div class="col-md-offset-1 col-md-8">
                                <asp:Label ID="lblMesg" runat="server" Text="" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    </div>
    <br />
    <br />
    <br />
    <footer>
        <p style="font-family: 'Comic Sans MS'; font-size: x-small; text-align: center;">
            Sogbesan Habib Oladeji<br />
            &copy; 2016.
        </p>
    </footer>
</body>
</html>
