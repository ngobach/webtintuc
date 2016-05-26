<%@ Page Title="Quản lý banner" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="Banner.aspx.cs" Inherits="WebTinTuc.admin.Banner" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-8">
            <div class="form-group">
                <label>Tiêu đề</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtTitle"/>
            </div>
            <div class="form-group">
                <label>Đường dẫn</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLink" placeholder="Ví dụ 'http://google.com.vn/'"/>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Bắt đầu</label>
                        <div class="input-group" id="dtpStart">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtStart"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Kết thúc</label>
                        <div class="input-group" id="dtpEnd">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtEnd"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Vị trí</label>
                <asp:DropDownList runat="server" ID="dropPos" CssClass="form-control"/>
            </div>
        </div>
        <div class="col-sm-4">
            <asp:Image runat="server" CssClass="img-thumbnail" ID="img" ImageUrl="~/uploads/placeholder.jpg" style="margin-bottom: 5px"/>
            <asp:FileUpload runat="server" ID="fileImg"/>
        </div>
        <div class="col-sm-12 text-center">
            <div class="form-group">
                <asp:LinkButton runat="server" ID="btnAdd" CssClass="btn btn-primary" OnClick="btnAdd_OnClick"><i class="fa fa-plus-square"></i> Thêm mới</asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnUpdate" CssClass="btn btn-primary" OnClick="btnUpdate_OnClick"><i class="fa fa-floppy-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-warning" OnClick="btnCancel_OnClick"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Trở về</asp:LinkButton>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    Danh sách chuyên mục
                </div>
                <div class="panel-body">
                    <asp:GridView runat="server" AutoGenerateColumns="False" ID="gridView" CssClass="table table-bordered table-hover table-centered" OnRowCommand="gridView_OnRowCommand">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Title" HeaderText="Tiêu đề"/>
                            <asp:BoundField DataField="Start" HeaderText="Bắt đầu"/>
                            <asp:BoundField DataField="End" HeaderText="Kết thúc"/>
                            <asp:BoundField DataField="Position" HeaderText="Vị trí"/>
                            <asp:TemplateField HeaderText="Thao tác">
                                <HeaderStyle Width="140px"></HeaderStyle>
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
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Scripts">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/locale/vi.js"></script>
    <script type="text/javascript">
        $(function () {
            var $dtpStart = $('#dtpStart');
            var $dtpEnd = $('#dtpEnd');
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
            $(":file").filestyle({ buttonName: "btn-primary" });
        });
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Styles">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
</asp:Content>