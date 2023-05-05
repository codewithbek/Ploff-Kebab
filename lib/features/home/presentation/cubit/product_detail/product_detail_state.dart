part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.productHiveModel,
    this.status = FormzSubmissionStatus.initial,
    this.errorText = '',
    this.id = '',
  });
  final List<ProductHiveModel>? productHiveModel;
  final FormzSubmissionStatus status;
  final String errorText;
  final String id;

  ProductDetailState copyWith({
    FormzSubmissionStatus? status,
    List<ProductHiveModel>? productHiveModel,
    String? errorText,
    String ?id,
  }) =>
      ProductDetailState(
        productHiveModel: productHiveModel ?? this.productHiveModel,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
        id: id ??this.id,
      );

  @override
  List<Object?> get props => [
        productHiveModel,
        status,
        errorText,
        id,
      ];
}
