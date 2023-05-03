part of 'card_bloc.dart';

class CartState extends Equatable {
  const CartState({
    required this.status,
  });

  final FormzSubmissionStatus status;

  @override
  List<Object> get props => [];
}
