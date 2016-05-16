<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideMenu.ascx.cs" Inherits="WebTinTuc.admin.SideMenu" %>
<ul class="sidebar-menu" id="nav-accordion">
    <li>
        <a href="Default.aspx">
            <i class="fa fa-dashboard"></i>
            <span>Bảng điều khiển</span>
        </a>
    </li>

    <li class="sub-menu">
        <a href="javascript:;" class="active">
            <i class="fa fa-newspaper-o"></i>
            <span>Quản lý tin tức</span>
        </a>
        <ul class="sub">
            <li><a href="Category.aspx">Quản lý danh mục</a></li>
            <li><a href="Post.aspx">Quản lý bài viết</a></li>
        </ul>
    </li>
    <li>
        <a href="User.aspx">
            <i class="fa fa-user"></i>
            <span>Quản lý user</span>
        </a>
    </li>
    <li>
        <a href="Banner.aspx">
            <i class="fa fa-picture-o" aria-hidden="true"></i>
            <span>Quản lý banner</span>
        </a>
    </li>
    <!--multi level menu end-->
</ul>