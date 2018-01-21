<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="USR_Profile.aspx.cs" Inherits="Pollr.User.USR_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div>
            <asp:Image ID="imgDP" runat="server" CssClass="img-responsive center-block img-rounded" Height="250" Width="250" BorderStyle="Double" BorderColor="Black" BorderWidth="5px" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <label class="col-sm-3 control-label">Name</label>
            <div class="col-sm-6">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <label class="col-sm-3 control-label">Email</label>
            <div class="col-sm-6">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <label class="col-sm-3 control-label">Phone</label>
            <div class="col-sm-6">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="form-group">
            <label class="col-sm-3 control-label">Change Picture</label>
            <div class="col-sm-6">
                <asp:FileUpload ID="flUpload" runat="server" CssClass="form-control" />
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-3 btn-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-3">
                <asp:Label ID="lblMesg" runat="server" Text="" />
            </div>
        </div>
    </div>
</asp:Content>
