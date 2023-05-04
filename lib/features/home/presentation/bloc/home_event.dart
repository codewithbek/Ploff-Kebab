part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesWithProductsEvent extends HomeEvent {}

class GetBannerEvent extends HomeEvent {}

class AddProductEvent extends HomeEvent {
  final ProductModel product;
  const AddProductEvent({
    required this.product,
  });
}
