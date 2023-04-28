part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({this.menu = BottomMenu.home});
  final BottomMenu menu;

  MainState copyWith({BottomMenu? menu}) {
    return MainState(menu: menu ?? this.menu);
  }

  @override
  List<Object> get props => [menu];
}

enum BottomMenu { home, cart, orders, profile }
