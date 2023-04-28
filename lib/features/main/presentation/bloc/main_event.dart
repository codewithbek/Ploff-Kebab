part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class TabChangeEvent extends MainEvent {
  final BottomMenu index;
  const TabChangeEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
