// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_app/features/home/data/models/feature_product_model.dart';
import 'package:assignment_app/features/home/data/models/product_detail.dart';
import 'package:assignment_app/features/home/data/models/today_deal_product.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/category_list_model.dart';
import '../../data/models/slider_list_model.dart';
import '../../data/repositories/home_remote_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<GetHomeDataEvent>((event, emit) async {
      try {
        emit(HomeLoadingState());

        final sliderList = await homeRepository.getSliderList();
        final categoryList = await homeRepository.getCategoryList();
        final todayDealList = await homeRepository.getDealList();
        final featureDealList = await homeRepository.getFeatureProductList();
        emit(HomeSuccessState(
            sliderList: sliderList,
            categoryList: categoryList,
            dealList: todayDealList,
            featuredProductList: featureDealList));
      } catch (e) {
        emit(HomeFailureState(
            errorMessage: "Failed to load data: ${e.toString()}"));
      }
    });

    on<GetProductDetailEvent>((event, emit) async {
      try {
        emit(HomeLoadingState());
        final productDetail =
            await homeRepository.getProductDetail(path: event.path);
        emit(ProductDetailSuccessState(productDetail: productDetail));
      } catch (e) {
        emit(HomeFailureState(
            errorMessage: "Failed to load data: ${e.toString()}"));
      }
    });
  }
}
