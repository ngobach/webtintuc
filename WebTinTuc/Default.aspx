<%@ Page Title="Trang chủ D8CNPM" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebTinTuc.Default" MasterPageFile="Main.Master"%>
<%@ Register tagPrefix="nb" tagName="Banner" src="UserControls/Banner.ascx"%>
<%@ Register tagPrefix="nb" tagName="Events" src="UserControls/UpcomingEvents.ascx"%>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <h4>Các bài viết mới</h4>
    <asp:Repeater runat="server" ID="rpPost">
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
    <h4>Quảng cáo</h4>
    <nb:Banner runat="server" Position="giua"/>
    <h4 id="events">Lịch thi & kiểm tra</h4>
    <nb:Events runat="server"/>
</asp:Content>