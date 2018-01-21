<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ADM_CreatePoll.aspx.cs" Inherits="Pollr.Admin.ADM_CreatePoll" EnableEventValidation="true" %>

<%@ Register Assembly="JuiceUI" Namespace="Juice" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row">
                <h1 class="text-center col-sm-3">Create Polls</h1>
            </div>
            <br />
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Poll Name</label>
                    <div class="col-sm-6">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control " />
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="ADM_CR" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Poll Description</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtDes" runat="server" CssClass="form-control" TextMode="MultiLine" Height="120px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="ADM_CR" ControlToValidate="txtDes"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Start Date</label>
                    <div class="col-sm-6">
                        <div class="input-group input-group-lg date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="txtStartDate" data-link-format="yyyy-mm-dd"">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control"/>
                            <%--<cc1:Datepicker ID="Datepicker1" runat="server" TargetControlID="txtStartDate" />--%>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="ADM_CR" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <label class="col-sm-2 control-label">End Date</label>
                    <div class="col-sm-6">
                        <div class="input-group input-group-lg date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="txtEndDate" data-link-format="yyyy-mm-dd""">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" />
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="ADM_CR" ControlToValidate="txtEndDate"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-6 col-sm-offset-2 btn-group">
                        <asp:Button ID="btnSavePoll" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="ADM_CR" OnClick="btnSavePoll_Click" />
                        <asp:Button ID="btnUpdatePoll" runat="server" Text="Update" CssClass="btn btn-default" ValidationGroup="ADM_CR" Enabled="false" OnClick="btnUpdatePoll_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-offset-2 col-sm-6">
                    <asp:Label ID="lblMesg" runat="server" Text="" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="form-group">
                    <asp:GridView ID="gdvPolls" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" DataKeyNames="PollID" OnRowCommand="gdvPolls_RowCommand" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
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
                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="idedit" ToolTip="EDIT" runat="server" AlternateText="EDIT" CausesValidation="False"
                                        CommandArgument='<%# Eval("PollID") %>' CommandName="EditRow" ImageUrl="~/Assets/Images/editb.png"
                                        ImageAlign="AbsMiddle" />
                                    <controlstyle bordercolor="LightGray" cssclass="form" forecolor="Black" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="30px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DELETE">
                                <ItemTemplate>
                                    <asp:ImageButton ID="iddelete" ToolTip="DELETE" runat="server" AlternateText="DELETE"
                                        CausesValidation="False" ImageUrl="~/Assets/Images/delete.jpg" ImageAlign="AbsMiddle"
                                        CommandArgument='<%# Eval("PollID") %>' CommandName="DeleteRow" OnClientClick="if ( !confirm('Are you sure you want to delete this poll?')) return false;" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30px" Height="10px"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <p>There are no polls to display</p>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlOptions" runat="server" Visible="false" OnLoad="pnlOptions_Load">
                <div class="row">
                    <h1 class="text-center col-sm-3">Add Options</h1>
                </div>
                <%--<div class="row">
            <div class="form-group">
                <label class="col-sm-2 control-label">Select Poll</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="drpPolls" runat="server">
                        <asp:ListItem Value="0" Text="--Select--" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="drpPolls" ForeColor="Red" ValidationGroup="ADM_PO"></asp:RequiredFieldValidator>
                </div>
            </div>

        </div>--%>
                <br />
                <div class="row">
                    <div class="form-group">
                        <asp:GridView ID="gdvOptions" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" DataKeyNames="PollOptionID" OnRowCommand="gdvOptions_RowCommand" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
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
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="idedit" ToolTip="EDIT" runat="server" AlternateText="EDIT" CausesValidation="False"
                                            CommandArgument='<%# Eval("PollOptionID") %>' CommandName="EditRow" ImageUrl="~/Assets/Images/editb.png"
                                            ImageAlign="AbsMiddle" />
                                        <controlstyle bordercolor="LightGray" cssclass="form" forecolor="Black" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px" Height="30px"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DELETE">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="iddelete" ToolTip="DELETE" runat="server" AlternateText="DELETE"
                                            CausesValidation="False" ImageUrl="~/Assets/Images/delete.jpg" ImageAlign="AbsMiddle"
                                            CommandArgument='<%# Eval("PollOptionID") %>' CommandName="DeleteRow" OnClientClick="if ( !confirm('Are you sure you want to delete this Option?')) return false;" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px" Height="10px"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <p>There are no options for this poll </p>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Option</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtOption" runat="server" CssClass="form-control" />
                            <asp:Button ID="btnOptionAdd" runat="server" CssClass="btn btn-default" Text="Add" OnClick="btnOptionAdd_Click" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtOption" ForeColor="Red" ValidationGroup="ADM_PO"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group">
                        <asp:GridView ID="gdvabsPoll" runat="server" CssClass="table table-responsive mydatagrid" AutoGenerateColumns="False" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True">
                            <Columns>
                                <asp:TemplateField HeaderText="S/N">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Option">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbltitle" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-2 btn-group">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btnOpUpdate" runat="server" CssClass="btn btn-default" Enabled="false" Text="Update" OnClick="btnOpUpdate_Click" />
                                <asp:Button ID="btnOpCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnOpCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <br />
    <br />
    <%--<asp:TextBox runat="server" ID="txt" />
    <cc1:Datepicker ID="Datepicker2" runat="server" TargetControlID="txt" DateFormat="dd/mm/yyyy"  />--%>
     <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            //language:  'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
        $('.form_date').datetimepicker({
            //language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('.form_time').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0
        });
</script>
</asp:Content>
