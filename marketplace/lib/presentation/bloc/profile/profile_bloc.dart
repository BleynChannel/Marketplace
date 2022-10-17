import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/presentation/bloc/profile/profile_event.dart';
import 'package:marketplace/presentation/bloc/profile/profile_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static bool debugIsNoNetwork = false;
  static bool debugIsError = false;

  ProfileBloc() : super(const ProfileState.load()) {
    on<ProfileOnLoaded>((event, emit) async {
      //? Есть ли подключение к интернету?
      if (!debugIsNoNetwork) {
        emit(const ProfileState.load());
      } else {
        emit(const ProfileState.noNetwork());
      }

      //TODO: Получать данные с репозитория
      var profile = debugProfile;
      await Future.delayed(const Duration(milliseconds: 3000));

      if (!debugIsError) {
        emit(ProfileState.loading(profile: profile));
      } else {
        emit(const ProfileState.error());
      }
    });
  }
}
