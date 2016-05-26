<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeBehind="PostEdit.aspx.cs" Inherits="WebTinTuc.admin.PostEdit" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel">
        <div class="panel-heading">
            <i class="fa fa-edit"></i> Bài viết
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-7">
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Tiêu đề bài viết"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" placeholder="Mô tả bài viết"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Danh mục</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropDanhMuc"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Đã xuất bản?</label><br/>
                        <asp:CheckBox runat="server" ID="chkPublished" CssClass="bs-switch" Checked="false"/>
                    </div>
                </div>
                <div class="col-sm-5">
                    <asp:Image runat="server" ID="imgThumbnail" CssClass="img-thumbnail post-thumbnail"/>
                    <asp:FileUpload runat="server" ID="fileThumbnail"/>
                </div>
                <div class="col-sm-12">
                    <h3>Nội dung bài viết</h3>
                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtContent" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <div class="text-center">
                <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnAdd" OnClick="btnAdd_OnClick"><i class="fa fa-plus-square" aria-hidden="true"></i> Thêm mới</asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnUpdate" OnClick="btnUpdate_OnClick"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Cập nhật</asp:LinkButton>
                <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btnCancel" OnClick="btnCancel_OnClick"><i class="fa fa-times" aria-hidden="true"></i> Hủy bỏ</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Scripts">
    <script src="assets/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.bs-switch input[type="checkbox"]').bootstrapSwitch();
            $(":file").filestyle({ buttonName: "btn-primary" });
            CKEDITOR.replace($('#<%=txtContent.ClientID%>').attr('name'), { height: 500 });
        });
    </script>
</asp:Content>