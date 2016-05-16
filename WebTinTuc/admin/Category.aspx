<%@ Page Title="Quản lý danh mục" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebTinTuc.admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-9">
            <div class="panel">
                <div class="panel-heading">
                    Thông tin chuyên mục
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Nhập tên của danh mục"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="btnMain" runat="server" CssClass="btn btn-primary" Text="Thêm mới" OnClick="OnClick"/>
                            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-warning" Text="Hủy bỏ" OnClick="OnBackClick" Visible="false"/>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 state-overview">
            <section class="panel">
                <div class="symbol terques">
                    <i class="fa fa-list"></i>
                </div>
                <div class="value">
                    <h1 class="count"><asp:Literal runat="server" ID="lblCateCount"/></h1>
                    <p>Số danh mục</p>
                </div>
            </section>
        </div>
        <div class="col-sm-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    Danh sách chuyên mục
                </div>
                <div class="panel-body">
                    <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Title" HeaderText="Tiêu đề" />
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
