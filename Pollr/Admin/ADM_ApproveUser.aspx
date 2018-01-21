<%@ Page Title="Approve/Reject Registration" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ADM_ApproveUser.aspx.cs" Inherits="Pollr.Admin.ADM_ApproveUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <h1 class="text-center">Approve/Reject Pending Registration</h1>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."Lorem ipsum dolor sit amet, consectetur adipiscing elit
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Approve">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="idedit" ToolTip="APPROVE" runat="server" AlternateText="APPROVE" CausesValidation="False"
                                        CommandArgument='<%# Eval("UserID") %>' CommandName="Approve" ImageUrl="~/Assets/Images/check.png"
                                        ImageAlign="AbsMiddle" />
                                    <controlstyle bordercolor="LightGray" cssclass="form" forecolor="Black" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="30px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reject">
                                <ItemTemplate>
                                    <asp:ImageButton ID="iddelete" ToolTip="REJECT" runat="server" AlternateText="REJECT"
                                        CausesValidation="False" ImageUrl="~/Assets/Images/delete.jpg" ImageAlign="AbsMiddle"
                                        CommandArgument='<%# Eval("UserID") %>' CommandName="Reject" OnClientClick="if ( !confirm('Are you sure you want to reject this user?')) return false;" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="10px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>There are no pending registrations</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <div class="row">
                <asp:Panel ID="pnlMesg" runat="server" Visible="false">
                    <div class="col-sm-8 col-sm-offset-2 alert alert-success">
                        <div class="col-sm-4 col-sm-offset-2">
                            <asp:Label ID="lblMesg" runat="server" Text="" />
                        </div>
                    </div>
                    <br />

                </asp:Panel>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
