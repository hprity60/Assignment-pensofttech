// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_app/core/network/dio_client.dart';
import 'package:assignment_app/core/values/strings.dart';
import 'package:assignment_app/features/home/data/models/feature_product_model.dart';
import 'package:assignment_app/features/home/data/models/slider_list_model.dart';
import 'package:assignment_app/features/home/data/models/today_deal_product.dart';
import 'package:dio/dio.dart';

import '../../models/category_list_model.dart';
import '../../models/product_detail.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  DioProvider dio;

  HomeRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<SliderList> getSliderList() async {
    try {
      Response response = await dio.client.get(AppStrings.sliderListUrl);
      final responseBody = response.data;
      final SliderList sliderList = SliderList.fromJson(responseBody);
      return sliderList;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CategoryList> getCategoryList() async {
    try {
      Response response = await dio.client.get(AppStrings.categoryListUrl);
      final responseBody = response.data;
      final CategoryList categoryList = CategoryList.fromJson(responseBody);
      return categoryList;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodayDealProduct> getDealList() async {
    try {
      Response response = await dio.client.get(AppStrings.dealListUrl);
      final responseBody = response.data;
      final TodayDealProduct dealList = TodayDealProduct.fromJson(responseBody);
      return dealList;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FeaturedProduct> getFeatureProductList() async {
    try {
      Response response = await dio.client.get(AppStrings.featureProductListUrl);
      final responseBody = response.data;
      final FeaturedProduct featureProductList = FeaturedProduct.fromJson(responseBody);
      return featureProductList;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDetail> getProductDetail({required String path}) async {
    try {
      Response response = await dio.client.get(path);
      final responseBody = response.data;
      final ProductDetail productDetails = ProductDetail.fromJson(responseBody);
      return productDetails;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
