<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoteControl.ascx.cs" Inherits="WebTinTuc.UserControls.VoteControl" %>
<div class="panel panel-default" id="votes">
    <div class="panel-heading">
        <span class="panel-title"><i class="fa fa-comments" aria-hidden="true"></i> Thăm dò ý kiến</span>
    </div>
    <asp:Repeater runat="server" ID="repMain" OnItemDataBound="repMain_OnItemDataBound" OnItemCommand="repMain_OnItemCommand">
        <ItemTemplate>
            <div class="panel-body">
                <div class="form-group">
                    <b><%# Eval("Description") %></b>
                </div>
                
                <div class="form-group">
                    <asp:RadioButtonList runat="server" ID="rad"/>
                </div>

                <asp:Panel runat="server" CssClass="form-group" ID="panelResult">
                    <ul class="list-group">
                    <asp:Repeater runat="server" ID="repResult">
                        <ItemTemplate>
                            <li class="list-group-item"><%# Eval("Title") %> <span class="badge"><%# Eval("Total") %></span></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    </ul>
                </asp:Panel>
                
                <div class="form-group">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-block" CommandName="Gui" ID="btnVote" CommandArgument='<%# Eval("ID") %>'>Gửi ý kiến</asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>