<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ADM_Report.aspx.cs" Inherits="Pollr.Admin.ADM_Report" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h1>Reports</h1>
    </div>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Filter Options</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpFilter" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpFilter_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="Status Based" />
                            <asp:ListItem Value="2" Text="Time Based" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <asp:Panel ID="pnlStatus" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">Status:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="Ongoing" />
                            <asp:ListItem Value="2" Text="Completed" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpStatus"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
            <div class="row">
                <asp:Panel ID="pnlTime" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">Time Category:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpTime" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpTime_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="Year" />
                            <asp:ListItem Value="2" Text="Year Range" />
                            <asp:ListItem Value="3" Text="Specific Month" />
                            <asp:ListItem Value="4" Text="Month Range" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpTime"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
            <div class="row">
                <asp:Panel ID="pnlyear" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">Year:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpyear" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="2015" />
                            <asp:ListItem Value="2" Text="2016" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpyear"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
            <div class="row">
                <asp:Panel ID="pnlendyear" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">End Year:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpEndyear" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="2015" />
                            <asp:ListItem Value="2" Text="2016" />
                            <asp:ListItem Value="3" Text="2017" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpEndyear"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
            <div class="row">
                <asp:Panel ID="pnlmonth" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">Month:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpmonth" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="January" />
                            <asp:ListItem Value="2" Text="February" />
                            <asp:ListItem Value="3" Text="March" />
                            <asp:ListItem Value="4" Text="April" />
                            <asp:ListItem Value="5" Text="May" />
                            <asp:ListItem Value="6" Text="June" />
                            <asp:ListItem Value="7" Text="July" />
                            <asp:ListItem Value="8" Text="August" />
                            <asp:ListItem Value="9" Text="September" />
                            <asp:ListItem Value="10" Text="October" />
                            <asp:ListItem Value="11" Text="November" />
                            <asp:ListItem Value="12" Text="December" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*!" ForeColor="Red" ControlToValidate="drpmonth"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
            <div class="row">
                <asp:Panel ID="pnlendmonth" runat="server" class="form-group" Visible="false">
                    <label class="control-label col-sm-2">End Month:</label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="drpendmonth" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="--Select--" />
                            <asp:ListItem Value="1" Text="January" />
                            <asp:ListItem Value="2" Text="February" />
                            <asp:ListItem Value="3" Text="March" />
                            <asp:ListItem Value="4" Text="April" />
                            <asp:ListItem Value="5" Text="May" />
                            <asp:ListItem Value="6" Text="June" />
                            <asp:ListItem Value="7" Text="July" />
                            <asp:ListItem Value="8" Text="August" />
                            <asp:ListItem Value="9" Text="September" />
                            <asp:ListItem Value="10" Text="October" />
                            <asp:ListItem Value="11" Text="November" />
                            <asp:ListItem Value="12" Text="December" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpendmonth"
                            ValidationGroup="RPT" InitialValue="0" />
                    </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="form-group">
            <div class="col-sm-6 btn-group">
                <asp:Button ID="btnGen" Text="Generate" runat="server" CssClass="btn btn-primary" ValidationGroup="RPT" OnClick="btnGen_Click" />
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="form-group">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="S/N">
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Name" SortExpression="" DataField="Name">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />

                    </asp:BoundField>
                    <asp:BoundField HeaderText="Description" SortExpression="" DataField="Description">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />

                    </asp:BoundField>
                    <asp:BoundField HeaderText="Start Date" SortExpression="" DataField="StartDate">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />

                    </asp:BoundField>
                    <asp:BoundField HeaderText="End Date" SortExpression="" DataField="EndDate">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />

                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("DateCreated")).Year %>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <%-- <asp:TemplateField>
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Button ID="btnSelect" runat="server" CssClass="btn btn-link" Text="View Details" CommandArgument='<%# Eval("PollID") %>' CommandName="View" />
                        </ItemTemplate>

                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <asp:Button ID="btnSavetoExcel" runat="server" CssClass="btn btn-block btn-default" Text="Download Report" OnClick="btnSavetoExcel_Click" Visible="false" />
        </div>
    </div>
</asp:Content>
