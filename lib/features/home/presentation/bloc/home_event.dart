part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesWithProductsEvent extends HomeEvent {}

class GetBannerEvent extends HomeEvent {}

class SearchProductEvent extends HomeEvent {
  final String productId;
  const SearchProductEvent({required this.productId});
  @override
  List<Object> get props => [
        productId,
      ];
}
