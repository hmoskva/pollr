<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Pollr.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />

    <link href="Assets/Bootstrap/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Stylesheets/login.css" rel="stylesheet" type="text/css" />
    <link href="Assets/Stylesheets/menusheet.css" rel="stylesheet" type="text/css" />
    <title>Home</title>
</head>
<body>
    <header style="box-shadow: 0 4px 8px 0 black, 0 6px 20px 0 black;">
        <div class="container">
            <img src="Assets/Images/logo.png" style="float: left; height: 150px; width: 150px;" />
            <div style="float: right;">
                <br />
                <br />
                <br />
                <ul>
                    <li class="active"><a href="../Home.aspx">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="Admin/ADM_Login.aspx">Admin Login</a></li>
                </ul>
            </div>
        </div>
    </header>

    <section class="">
        <div class="container padding">
            <div class="row">
                <div class="text-center" style="font-family:'Comic Sans MS'; font-size:50px;text-shadow: 0 0 10px white;">W e l c o m e &nbsp;&nbsp;&nbsp;t o &nbsp;&nbsp;&nbsp; P o l l r</div>
            </div>
            <br />
            <div class="row">
                <%--<div class="text-contain col-sm-6">
                    
                    <p class="text-center p-tag">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."Lorem ipsum dolor sit amet, consectetur adipiscing elit
                    </p>
                </div>--%>
                <div class="padding box-shadow login-form col-sm-6 col-sm-offset-3">
                    <img src="Assets/Images/user2.png" class="img-responsive center-block" style="width: 120px; height: 120px;" />
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                <%--<input type="email" id="email" class="form-control" placeholder="Your email" tabindex="1" />--%>
                                <asp:TextBox ID="txtEmall" runat="server" CssClass="form-control" placeholder="Email" TabIndex="1" />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmall" ValidationGroup="PLRHome"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <%--<a href="#forget-password" class="btn btn-xs btn-link" tabindex="4">Forget password?</a>--%>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                                <%--<input type="password" class="form-control" placeholder="Your password" tabindex="2" />--%>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" TabIndex="1" placeholder="Password" />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ValidationGroup="PLRHome"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" ValidationGroup="PLRHome" OnClick="btnLogin_Click" />
                        </div>
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" />
                            </label>
                        </div>
                        <%--<button type="submit" class="btn btn-block btn-primary" tabindex="3">Authenticate</button>--%>
                        <p class="text-center text-muted h4" style="font-family: 'Comic Sans MS';">
                            OR
                               
                        </p>
                        <a href="User/USR_Register.aspx" class="btn btn-block btn-success" tabindex="5">Create account</a>
                        <div class="form-group">
                            <asp:Label ID="lblMesg" runat="server" CssClass="text-center" Text="" />
                            <asp:Label ID="lblerror" runat="server" CssClass="text-center" Text="" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
        
    <br />
    <br />
    <br />
    <footer>
        <p style="font-family: 'Comic Sans MS'; font-size: 16px; text-align: center;">
            Sogbesan Habib Oladeji<br />
            &copy; 2016.
        </p>
    </footer>
</body>
</html>
