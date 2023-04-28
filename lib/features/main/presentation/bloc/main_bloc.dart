import 'package:ploff_kebab/export_files.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<TabChangeEvent>((event, emit) {
      emit(state.copyWith(menu: event.index));
    });
  }
}
