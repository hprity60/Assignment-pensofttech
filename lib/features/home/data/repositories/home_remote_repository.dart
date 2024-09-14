import 'package:assignment_app/features/home/data/models/feature_product_model.dart';
import 'package:assignment_app/features/home/data/models/today_deal_product.dart';

import '../models/category_list_model.dart';
import '../models/product_detail.dart';
import '../models/slider_list_model.dart';

abstract class HomeRepository {
  Future<SliderList> getSliderList();
  Future<CategoryList> getCategoryList();
  Future<TodayDealProduct> getDealList();
  Future<FeaturedProduct> getFeatureProductList();
  Future<ProductDetail> getProductDetail({required String path});
}
