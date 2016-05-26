<%@ Page Title="Quản lý phiếu thăm dò" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="WebTinTuc.admin.Vote" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-user"></i> Thông tin phiếu thăm dò
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>Tiêu đề</label>                
                <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label>Nội dung cần thăm dò</label>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" TextMode="MultiLine" Rows="10"/>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_OnClick" CssClass="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_OnClick" CssClass="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnEditItems" OnClick="btnEditItems_OnClick" CssClass="btn btn-primary"><i class="fa fa-list-ol" aria-hidden="true"></i> Các lựa chọn</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" CssClass="btn btn-warning"><i class="fa fa-times" aria-hidden="true"></i> Trở về</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            Danh sách phiếu thăm dò
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Tiêu đề"/>
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
