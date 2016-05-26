<%@ Page Title="Quản lý chi tiết phiếu thăm dò" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="VoteItem.aspx.cs" Inherits="WebTinTuc.admin.VoteItem" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-user"></i> Thông tin chi tiết phiếu thăm dò
        </div>
        <div class="panel-body">
            <asp:Label runat="server" ID="lblTitle" style="font-size: 18pt"/><br />
            <asp:Label runat="server" ID="lblDesc"/>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>Nội dung bình chọn</label>
                <asp:TextBox runat="server" ID="txtContent" CssClass="form-control" TextMode="MultiLine" Rows="3"/>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_OnClick" CssClass="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_OnClick" CssClass="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Lưu lại</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" CssClass="btn btn-warning"><i class="fa fa-times" aria-hidden="true"></i> Trở về</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            Danh sách lựa chọn
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Nội dung"/>
                    <asp:BoundField DataField="Total" HeaderText="Tổng số bình chọn">
                        <HeaderStyle Width="150px"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Thao tác">
                        <HeaderStyle Width="200px"/>
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
