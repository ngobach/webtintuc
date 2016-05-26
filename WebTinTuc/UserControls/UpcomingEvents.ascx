<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpcomingEvents.ascx.cs" Inherits="WebTinTuc.UserControls.UpcomingEvents" %>
<asp:Repeater runat="server" ID="rep">
    <ItemTemplate>
        <div class="panel panel-events">
            <div class="event">
                <div class="title">
                    <%# Eval("Title") %>
                </div>
                <div class="info">
                    <p><%# Eval("Content") %></p>
                </div>
                <div class="place">
                    <i class="fa fa-map-marker" aria-hidden="true"></i> <%# Eval("Place") %>
                </div>
                <div class="time">
                    <div class="time-from">
                        <span class="small">Từ</span>
                        <span class="big"><%# Eval("Start", "{0:hh:mm}") %></span>
                        <span class="small"><%# Eval("Start", "{0:d}") %></span>
                    </div>
                    <span class="divider"><i class="fa fa-calendar faa-ring animated" aria-hidden="true"></i></span>
                    <div class="time-to">
                        <span class="small">Đến</span>
                        <span class="big"><%# Eval("End", "{0:hh:mm}") %></span>
                        <span class="small"><%# Eval("End", "{0:d}") %></span>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>