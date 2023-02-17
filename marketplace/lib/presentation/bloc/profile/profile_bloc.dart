import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:marketplace/domain/repository/user_repository.dart';
import 'package:marketplace/presentation/bloc/profile/profile_event.dart';
import 'package:marketplace/presentation/bloc/profile/profile_state.dart';
import 'package:marketplace/presentation/debug_data.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.load()) {
    final userRepository = Get.find<UserRepository>();

    on<ProfileOnLoaded>((event, emit) async {
      if (!debugIsNetwork) {
        emit(const ProfileState.noNetwork());
        return;
      }

      emit(const ProfileState.load());

      var result = await userRepository.getProfile(userId: event.userId);
      await Future.delayed(const Duration(milliseconds: 3000));

      result.fold((failure) {
        String message = '';

        failure.when(
          unknown: () => message = 'unknownError'.tr,
        );

        emit(ProfileState.error(message: message));
      }, (data) => emit(ProfileState.loading(profile: data)));
    });
  }
}
