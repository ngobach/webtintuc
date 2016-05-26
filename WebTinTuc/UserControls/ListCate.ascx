<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListCate.ascx.cs" Inherits="WebTinTuc.UserControls.ListCate" %>
<div class="panel panel-default" id="categories">
    <div class="panel-heading">
        <h4 class="panel-title"><i class="fa fa-rss" aria-hidden="true"></i> Chuyên mục</h4>
    </div>
    <div class="list-group">
        <asp:Repeater runat="server" ID="Rep">
            <ItemTemplate>
                <a class="list-group-item" href="CategoryPage.aspx?id=<%# Eval("ID") %>"><%# Eval("Title") %></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>