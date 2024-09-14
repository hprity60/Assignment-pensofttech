part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeDataEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends HomeEvent {
  final String path;

  const GetProductDetailEvent({required this.path});

  @override
  List<Object> get props => [path];
}
