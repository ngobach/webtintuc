<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="WebTinTuc.admin.Post" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            Danh sách bài viết
            <div class="pull-right">
                <asp:LinkButton runat="server" CssClass="btn btn-primary btn-sm" ID="btnNewPost" OnClick="btnNewPost_OnClick"><i class="fa fa-plus-square" aria-hidden="true"></i> Bài mới</asp:LinkButton>
            </div>
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Tiêu đề"/>
                    <asp:TemplateField HeaderText="Trạng thái">
                        <ItemTemplate>
                            <%# ((bool)Eval("Published"))?"<span class=\"label label-success\">Đã xuất bản</span>":"<span class=\"label label-default\">Chưa xuất bản</span>"%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cate" HeaderText="Danh mục"/>
                    <asp:BoundField DataField="Owner" HeaderText="Tác giả">
                        <ItemStyle Font-Bold="True"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Updated" HeaderText="Đăng lúc" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                        <HeaderStyle Width="200px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Thao tác">
                        <HeaderStyle Width="130px"></HeaderStyle>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CssClass="btn btn-primary btn-xs" CommandName="Sua" CommandArgument='<%# Eval("ID") %>'>
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="btn btn-danger btn-xs" CommandName="Xoa" CommandArgument='<%# Eval("ID") %>'>
                                <i class="fa fa-trash" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>