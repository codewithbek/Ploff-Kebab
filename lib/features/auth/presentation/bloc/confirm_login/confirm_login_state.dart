part of 'confirm_login_bloc.dart';

abstract class ConfirmLoginState extends Equatable {
  const ConfirmLoginState();
}

class ConfirmLoginInitial extends ConfirmLoginState {
  @override
  List<Object> get props => [];
}
