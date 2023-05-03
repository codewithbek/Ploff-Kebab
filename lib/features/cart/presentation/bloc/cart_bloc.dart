import 'package:ploff_kebab/export_files.dart';
part 'card_event.dart';
part 'card_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  HomeRemoteDataSource remoteDataSource;
  CartBloc({
    required this.remoteDataSource,
  }) : super(const CartState(status: FormzSubmissionStatus.initial)) {
    on<CartEvent>((event, emit) {});
  }
}
