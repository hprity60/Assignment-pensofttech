// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_app/features/home/data/models/category_list_model.dart';
import 'package:assignment_app/features/home/data/models/feature_product_model.dart';
import 'package:assignment_app/features/home/data/models/product_detail.dart';
import 'package:assignment_app/features/home/data/models/slider_list_model.dart';
import 'package:assignment_app/features/home/data/models/today_deal_product.dart';
import 'package:dio/dio.dart';

import '../datasources/remote_data_source/home_remote_data_source.dart';
import 'home_remote_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<SliderList> getSliderList() async {
    try {
      final SliderList sliderList = await homeRemoteDataSource.getSliderList();
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
      final CategoryList categoryList = await homeRemoteDataSource.getCategoryList();
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
      final TodayDealProduct dealList = await homeRemoteDataSource.getDealList();
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
      final FeaturedProduct featuredProductList = await homeRemoteDataSource.getFeatureProductList();
      return featuredProductList;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDetail> getProductDetail({required String path}) async {
    try {
      final ProductDetail productDetail = await homeRemoteDataSource.getProductDetail(path: path);
      return productDetail;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
