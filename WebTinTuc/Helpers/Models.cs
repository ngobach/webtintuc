using System;

namespace WebTinTuc
{
    [Serializable]
    public partial class Post
    {
        public string ThumbnailUrl
        {
            get
            {
                if (HasThumbnail)
                {
                    return "/uploads/" + Thumbnail;
                }
                return DefaultThumbnail;
            }
        }

        public bool HasThumbnail
        {
            get { return Thumbnail != null; }
        }

        public static string DefaultThumbnail
        {
            get { return "/uploads/placeholder.jpg"; }
        }
    }

    [Serializable]
    public partial class Category
    {
        public string Permalink
        {
            get { return "~/CategoryPage.aspx?id=" + this.ID; }
        }
    }
    [Serializable]
    public partial class User { }

    [Serializable]
    public partial class Banner
    {
        public String ImageUrl
        {
            get
            {
                if (Image != "")
                    return "/uploads/banners/" + Image;
                return "/uploads/placeholder.jpg";
            }
        }
    }

    public partial class Member
    {
        public int PhotoID
        {
            get
            {
                return 1+(ID%98);
            }
        }
    }
}