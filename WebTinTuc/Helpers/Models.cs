using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebTinTuc
{
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
}