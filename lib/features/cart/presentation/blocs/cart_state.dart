part of 'cart_bloc.dart';

class CartState extends Equatable {
  final FormzSubmissionStatus status;
  final List<ProductModel> products;

  const CartState({
    this.status = FormzSubmissionStatus.initial,
    this.products = const [],
  });
  CartState copyWith({
    FormzSubmissionStatus? status,
    List<ProductModel>? products,
  }) =>
      CartState(
        status: status ?? this.status,
        products: products ?? this.products,
      );

  @override
  List<Object?> get props => [
        status,
        products,
      ];
}
