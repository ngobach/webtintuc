<%@ Page Title="Danh sách thành viên" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="WebTinTuc.MemberList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <asp:Repeater runat="server" ID="rep">
            <ItemTemplate>
                <div class="col-sm-6">
                    <div class="member">
                        <div class="user-heading">
                            <%# Eval("FullName") %>
                        </div>
                        <div class="user-body">
                            <ul>
                                <li><i class="fa fa-envelope" aria-hidden="true" style="color: #4ECDC4"></i> <%# Eval("Email") %></li>
                                <li><i class="fa fa-calendar-check-o" aria-hidden="true" style="color: #556270"></i> <%# Eval("DayOfBirth", "{0:d}") %></li>
                                <li><i class="fa fa-map" aria-hidden="true" style="color: #FF6B6B"></i> <%# Eval("Address") %></li>
                                <li><i class="fa fa-phone" aria-hidden="true" style="color: #C44D58"></i> <%# Eval("Phone") %></li>
                            </ul>
                        </div>
                        <img src="/uploads/pp/<%# Eval("PhotoID") %>.jpg" class="user-pp"/>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foot" runat="server">
</asp:Content>
