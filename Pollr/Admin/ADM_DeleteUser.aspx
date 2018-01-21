<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ADM_DeleteUser.aspx.cs" Inherits="Pollr.Admin.ADM_DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <h1 class="text-center">Delete Users</h1>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
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
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="iddelete" ToolTip="DELETE" runat="server" AlternateText="DELETE"
                                        CausesValidation="False" ImageUrl="~/Assets/Images/delete.jpg" ImageAlign="AbsMiddle"
                                        CommandArgument='<%# Eval("UserID") %>' CommandName="DeleteRow" OnClientClick="if ( !confirm('Are you sure you want to delete this user?')) return false;" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="10px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>There are no users</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <div class="row">
                    <asp:Label ID="lblMesg" runat="server" Text="" CssClass="alert alert-success col-sm-8 col-sm-offset-2" Visible="false" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
