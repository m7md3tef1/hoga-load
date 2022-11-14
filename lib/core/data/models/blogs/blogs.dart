class Blogs {
  Blogs({
      this.id, 
      this.title, 
      this.slug, 
      this.image, 
      this.keywords, 
      this.blogContent, 
      this.blogCategory, 
      this.blogStatus, 
      this.enableComment, 
      this.createdAt, 
      this.updatedAt,});

  Blogs.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    keywords = json['keywords'];
    blogContent = json['blog_content'];
    blogCategory = json['blog_category'];
    blogStatus = json['blog_status'];
    enableComment = json['enable_comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? slug;
  String? image;
  String? keywords;
  String? blogContent;
  String? blogCategory;
  int? blogStatus;
  int? enableComment;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['image'] = image;
    map['keywords'] = keywords;
    map['blog_content'] = blogContent;
    map['blog_category'] = blogCategory;
    map['blog_status'] = blogStatus;
    map['enable_comment'] = enableComment;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}