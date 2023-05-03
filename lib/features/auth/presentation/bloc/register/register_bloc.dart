import 'package:ploff_kebab/core/inputs/name_input.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/core/mixins/register_validation.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/auth/domain/usecases/register_usecase.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with RegisterValidation, CacheMixin {
  final RegisterUseCase signUp;

  RegisterBloc({
    required this.signUp,
  }) : super(const RegisterState(status: FormzSubmissionStatus.initial)) {
    on<RegisterButtonPressed>(_registerButtonPressedHandler);
  }

  void _registerButtonPressedHandler(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    final name = NameInput.dirty(event.name.trim());
    emit(const RegisterState(status: FormzSubmissionStatus.inProgress));
    Map<dynamic, String>? errorMessage = validateRegister(name);
    if (errorMessage == null) {
      final request = RegisterRequestEntity(
        name: name.value,
        phone: event.phone,
        tag: event.tag,
        registrationSource: event.registrationSource,
      );
      final response = await signUp(RegisterParams(request));
      response.fold(
        (error) => emit(
          RegisterState(
            status: FormzSubmissionStatus.failure,
            message: (error is ServerFailure)
                ? error.message
                : Validations.INTERNET_FAILURE,
          ),
        ),
        (response) {
          setName(
            name: name.value,
          );
          emit(
            const RegisterState(status: FormzSubmissionStatus.success),
          );
        },
      );
    } else {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: errorMessage.values.first,
          errors: errorMessage.keys.first,
        ),
      );
    }
  }
}
