<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryPage.aspx.cs" Inherits="WebTinTuc.CategoryPage" %>
<asp:Content ContentPlaceHolderID="Content" runat="server">
    <asp:Repeater runat="server" ID="repPost">
        <ItemTemplate>
            <div class="panel">
                <asp:PlaceHolder runat="server" Visible='<%# Eval("HasThumbnail") %>'>
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/PostPage.aspx?id=" + Eval("ID") %>'><img src="<%# Eval("ThumbnailUrl") %>" class="post-thumbnail" alt="post thumbnail"/></asp:HyperLink>
                </asp:PlaceHolder>
                <div class="panel-body">
                    <asp:HyperLink runat="server" NavigateUrl='<%# "~/PostPage.aspx?id=" + Eval("ID") %>'><span class="post-title"><%# Eval("Title") %></span></asp:HyperLink><br />
                    <%# Eval("Description") %>
                </div>
                <div class="panel-body text-right p5">
                    <span class="post-meta">
                        <span class="author"><i class="fa fa-user" aria-hidden="true"></i> Viết bởi <b><%# Eval("User.Username") %></b></span>
                        <span class="category"><a href="/CategoryPage.aspx?id=<%# Eval("Category.ID") %>"><b><%# Eval("Category.Title") %></b></a></span>
                        <span class="time"><i class="fa fa-clock-o" aria-hidden="true"></i> <%# Eval("Updated", "{0:dd/MM/yyyy}") %></span>
                    </span>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
