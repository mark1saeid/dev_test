import 'package:bloc/bloc.dart';
import 'package:dev_test/layers/presentation/auth/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  void login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }

  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
}
