import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel;

  categoryModel =  new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.ImageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);


  categoryModel =  new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.ImageUrl = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80";
  category.add(categoryModel);



  categoryModel =  new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.ImageUrl = "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);


  categoryModel =  new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.ImageUrl = "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);


  categoryModel =  new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.ImageUrl = "https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;
}