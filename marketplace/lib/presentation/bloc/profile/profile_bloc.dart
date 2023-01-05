import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/presentation/bloc/profile/profile_event.dart';
import 'package:marketplace/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.load()) {
    on<ProfileOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const ProfileState.noNetwork());
        return;
      }

      emit(const ProfileState.load());

      var result = await userRepository.getProfile();
      await Future.delayed(const Duration(milliseconds: 3000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'Unknown error',
        );

        emit(ProfileState.error(message: message));
      }, (data) => emit(ProfileState.loading(profile: data)));
    });
  }
}
