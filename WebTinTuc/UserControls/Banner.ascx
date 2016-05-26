<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Banner.ascx.cs" Inherits="WebTinTuc.UserControls.Banner" %>
<div class="list-group">
    <asp:Repeater runat="server" ID="rep">
        <ItemTemplate>
            <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Link") %>' CssClass="list-group-item banner">
                <asp:Image runat="server" ImageUrl='<%# Eval("ImageUrl") %>' alt="banner"/>
                <span class="desc"><%# Eval("Title") %></span>
            </asp:HyperLink>
        </ItemTemplate>
    </asp:Repeater>
</div>