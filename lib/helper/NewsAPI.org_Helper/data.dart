//method untuk model view list category diatas (dijadiin tempat data)
import 'package:news_aplikasi/helper/model/NewsAPI.ORG_Model/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> category = new List<CategoryModel>(); //nama listnya category
  CategoryModel categoryModel = new CategoryModel();

  //sport
  categoryModel.namaCategory = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel); //ngeadd category model ke list category diatas
  categoryModel = new CategoryModel(); //memperbarui category model untuk menghindari error

  //bisnis
  categoryModel.namaCategory = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //kesehatan
  categoryModel.namaCategory = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1535914254981-b5012eebbd15?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //entertaiment
  categoryModel.namaCategory = "Entertaiment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1428790067070-0ebf4418d9d8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //science
  categoryModel.namaCategory = "Science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  //tekonolog
  categoryModel.namaCategory = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1486611367184-17759508999c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=966&q=80";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category; //berninlai balik category jadi nanti bisa di panggil di kelas lain
}
