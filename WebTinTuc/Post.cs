//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebTinTuc
{
    using System;
    using System.Collections.Generic;
    
    public partial class Post
    {
        public int ID { get; set; }
        public int Category_ID { get; set; }
        public string Title { get; set; }
        public System.DateTime Updated { get; set; }
        public string Description { get; set; }
        public bool Published { get; set; }
        public string Thumbnail { get; set; }
        public int Owner { get; set; }
        public string Content { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual User User { get; set; }
    }
}
