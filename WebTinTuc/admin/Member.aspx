<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="WebTinTuc.admin.Member" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-user"></i> Thông tin người dùng
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Họ và tên</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtFullname" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Ngày sinh</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control datepicker"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Số điện thoại</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_OnClick" CssClass="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_OnClick" CssClass="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" CssClass="btn btn-warning"><i class="fa fa-times" aria-hidden="true"></i> Trở về</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            Danh sách thành viên
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FullName" HeaderText="Họ và tên"/>
                    <asp:BoundField DataField="DayOfBirth" HeaderText="Ngày sinh" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="Address" HeaderText="Địa chỉ"/>
                    <asp:BoundField DataField="Phone" HeaderText="Số điện thoại"/>
                    <asp:BoundField DataField="Email" HeaderText="Email"/>
                    <asp:TemplateField HeaderText="Thao tác">
                        <HeaderStyle Width="200px"></HeaderStyle>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CssClass="btn btn-primary btn-xs" CommandName="Sua" CommandArgument='<%# Eval("ID") %>'><i class="fa fa-pencil" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="btn btn-danger btn-xs" CommandName="Xoa" CommandArgument='<%# Eval("ID") %>'><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Styles">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.min.css">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Scripts">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/locales/bootstrap-datepicker.vi.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy',
                language: 'vi'
            });
        });
    </script>
</asp:Content>