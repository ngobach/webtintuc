<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PostPage.aspx.cs" Inherits="WebTinTuc.PostPage" %>
<asp:Content ContentPlaceHolderID="Content" runat="server">
    <div class="panel panel-primary">
        <asp:Panel runat="server" ID="panelThumbnail" class="panel-body nopadding">
            <asp:Image runat="server" ID="imgThumbnail" ImageUrl="/uploads/placeholder.jpg" CssClass="post-thumbnail"/>
        </asp:Panel>
        <div class="panel-body">
            <asp:HyperLink runat="server" CssClass="post-category-link" ID="hlCategory"></asp:HyperLink>
            <h4><asp:Literal runat="server" ID="ltTitle">Tiêu đề bài</asp:Literal></h4>
        </div>
        <div class="panel-body">
            <asp:Literal runat="server" ID="content"></asp:Literal>
        </div>
        <div class="panel-body post-info">
            Bởi <b><asp:Literal runat="server" ID="ltAuthor"></asp:Literal></b>, cập nhật lần cuối lúc <i><asp:Literal runat="server" ID="ltTime"></asp:Literal></i>
        </div>
    </div>
</asp:Content>
