class CategoryModel{
  String imageurl="";
  String categoryname="";

  // CategoryModel({required this.imageurl, required this.categoryname});
}

List<CategoryModel> getCategories(){
  List<CategoryModel> ca = [];

  var obj = CategoryModel();
  obj.categoryname = "Business";
  obj.imageurl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  ca.add(obj);

  //2
  obj = CategoryModel();
  obj.categoryname = "Entertainment";
  obj.imageurl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  ca.add(obj);

  //3
  obj = CategoryModel();
  obj.categoryname = "General";
  obj.imageurl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  ca.add(obj);

  //4
  obj = CategoryModel();
  obj.categoryname = "Health";
  obj.imageurl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  ca.add(obj);

  //5
  obj = CategoryModel();
  obj.categoryname = "Science";
  obj.imageurl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  ca.add(obj);

  //5
  obj = CategoryModel();
  obj.categoryname = "Sports";
  obj.imageurl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  ca.add(obj);

  //5
  obj = CategoryModel();
  obj.categoryname = "Technology";
  obj.imageurl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  ca.add(obj);
  
  return ca;
}