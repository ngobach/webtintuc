<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebTinTuc.admin.User" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-user"></i> Thông tin người dùng
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Tên đăng nhập</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Mật khẩu</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_OnClick" CssClass="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_OnClick" CssClass="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" CssClass="btn btn-warning"><i class="fa fa-times" aria-hidden="true"></i> Hủy bỏ</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            Danh sách người dùng
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập"/>
                    <asp:BoundField DataField="Email" HeaderText="Email"/>
                    <asp:BoundField DataField="Password" HeaderText="Mật khẩu"/>
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