<%@ Page Title="Take Poll" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="USR_TakePoll.aspx.cs" Inherits="Pollr.User.USR_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div>
            <asp:Image ID="imgDP" runat="server" CssClass="img-responsive center-block img-rounded" Height="250" Width="250" BorderStyle="Double" BorderColor="Black" BorderWidth="5px" />
        </div>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-3 control-label">Select a Poll</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpPolls" runat="server" OnSelectedIndexChanged="drpPolls_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="drpPolls" ForeColor="Red" ValidationGroup="Vote"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-6 col-sm-offset-5">
                        <asp:Label ID="lblDesc" runat="server" Text="" Visible="false" />
                    </div>
                </div>
            </div>
            <br />
            <asp:Panel ID="pnlPoll" runat="server" Visible="false" OnLoad="pnlPoll_Load">
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <asp:RadioButtonList ID="rbtOptions" runat="server"></asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="rbtOptions" ForeColor="Red" ValidationGroup="Vote"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <asp:Button ID="btnVote" runat="server" CssClass="btn btn-success" Text="Vote" OnClick="btnVote_Click" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <br />
            <br />
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-6 col-sm-offset-3">
                        <asp:Label ID="lblMesg" runat="server" Text="" CssClass="alert alert-success" Visible="false"  />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
