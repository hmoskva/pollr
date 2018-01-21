<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADM_Login.aspx.cs" Inherits="Pollr.Admin.ADM_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />

    <link href="../Assets/Bootstrap/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/Stylesheets/login.css" rel="stylesheet" type="text/css" />
    <link href="../Assets/Stylesheets/menusheet.css" rel="stylesheet" type="text/css" />
    <title>Admin Login</title>
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
                    <li class="active"><a href="ADM_Login.aspx">Admin Login</a></li>
                </ul>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <br />
            <br />
            <div class="col-sm-6 col-sm-offset-3">
                <div class="panel panel-default box-shadow" style="background-color: rgba(1, 1, 1, 0.13); padding:60px; border:none;">
                    <div class="panel-heading" style="background-color: transparent;">
                        <h2 class="text-center" style="font-family: 'Comic Sans MS'; text-shadow: 0 0 10px white;">Sign In</h2>
                    </div>
                    <div class="panel-body">
                        <img src="../Assets/Images/user2.png" class="img-responsive center-block" style="width: 180px; height: 180px;" />
                        <br />
                        <form id="form1" runat="server">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                    <%--<input type="email" id="email" class="form-control" placeholder="Your email" tabindex="1" />--%>
                                    <asp:TextBox ID="txtEmall" runat="server" CssClass="form-control" placeholder="Email" TabIndex="1" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmall" ValidationGroup="ADM_L"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <%--<a href="#forget-password" class="btn btn-xs btn-link" tabindex="4">Forget password?</a>--%>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                                    <%--<input type="password" class="form-control" placeholder="Your password" tabindex="2" />--%>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" TabIndex="1" placeholder="Password" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ValidationGroup="ADM_L"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" ValidationGroup="ADM_L" OnClick="btnLogin_Click" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblMesg" runat="server" CssClass="text-center" Text=""/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <p style="font-family: 'Comic Sans MS'; font-size: 16px; text-align: center;">
            Pollr<br />
            &copy; 2016.
        </p>
    </footer>
</body>
</html>
