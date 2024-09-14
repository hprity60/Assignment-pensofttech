// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final SliderList? sliderList;
  final CategoryList? categoryList;
  final TodayDealProduct? dealList;
  final FeaturedProduct? featuredProductList;

  const HomeSuccessState(
      {this.sliderList,
      this.categoryList,
      this.dealList,
      this.featuredProductList});

  @override
  List<Object> get props => [];
}

class ProductDetailSuccessState extends HomeState {
  final ProductDetail? productDetail;

  const ProductDetailSuccessState({this.productDetail});

  @override
  List<Object> get props => [];
}

class HomeFailureState extends HomeState {
  final String errorMessage;

  const HomeFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
