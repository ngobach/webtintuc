<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="WebTinTuc.admin.Event" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-user"></i> Thông tin người dùng
        </div>
        <div class="panel-body">
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Tiêu đề"/>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtContent" CssClass="form-control" placeholder="Nội dung" TextMode="MultiLine" Rows="5"/>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Bắt đầu từ</span>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtStart"/>
                    <span class="input-group-addon">đến</span>
                    <asp:TextBox runat="server" CssClass="form-control" Id="txtEnd"/>
                </div>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="txtPlace" CssClass="form-control" placeholder="Địa điểm"/>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_OnClick" CssClass="btn btn-primary"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnUpdate" OnClick="btnUpdate_OnClick" CssClass="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_OnClick" CssClass="btn btn-warning"><i class="fa fa-times" aria-hidden="true"></i> Trở về</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            Danh sách lịch thi, kiểm tra
        </div>
        <div class="panel-body">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="100px"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Tên sự kiện"/>
                    <asp:BoundField DataField="Start" HeaderText="Bắt đầu"/>
                    <asp:BoundField DataField="End" HeaderText="Kết thúc"/>
                    <asp:BoundField DataField="Place" HeaderText="Địa điểm"/>
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
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Scripts">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/locale/vi.js"></script>
    <script type="text/javascript">
        $(function () {
            var $dtpStart = $('#<%= txtStart.ClientID %>');
            var $dtpEnd = $('#<%= txtEnd.ClientID %>');
            $dtpStart.datetimepicker({
                locale: 'vi'
            });
            $dtpEnd.datetimepicker({
                locale: 'vi',
                useCurrent: false
            });
            $dtpStart.on("dp.change", function (e) {
                $dtpEnd.data("DateTimePicker").minDate(e.date);
            });
            $dtpEnd.on("dp.change", function (e) {
                $dtpStart.data("DateTimePicker").maxDate(e.date);
            });
        });
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Styles">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
</asp:Content>