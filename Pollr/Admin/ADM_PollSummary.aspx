<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ADM_PollSummary.aspx.cs" Inherits="Pollr.Admin.ADM_PollSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <h1>Poll Summary</h1>
            </div>
            <br />
            <div class="row">
                <div class="jumbotron">
                    <p style="font-size:25px;">Welcome to Poll Summary, Administrator. Here you can view completed polls as well as their corresponding results. Thank you. </p>
                </div>
            </div>
            <div class="row">

            </div>
            <div class="row">
                <div class="form-group">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="View Results">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="idedit" ToolTip="VIEW RESULTS" runat="server" AlternateText="VIEW RESULTS" CausesValidation="False"
                                        CommandArgument='<%# Eval("PollID") %>' CommandName="ViewResults" ImageUrl="~/Assets/Images/editb.png"
                                        ImageAlign="AbsMiddle" />
                                    <controlstyle bordercolor="LightGray" cssclass="form" forecolor="Black" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="30px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>There are no completed polls</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <div class="row">
                <h4 class="text-left">Vote Count Appears below...</h4>
            </div>
            <div class="row">
                <div class="form-group">
                    <asp:GridView ID="GridView2" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="Option" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Count" HeaderText="Count" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>Theres nothing to display</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
