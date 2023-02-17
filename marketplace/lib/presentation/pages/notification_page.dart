import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/bloc/notification/notification_bloc.dart';
import 'package:marketplace/presentation/bloc/notification/notification_event.dart';
import 'package:marketplace/presentation/bloc/notification/notification_state.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/domain/entity/notification.dart' as entity;
import 'package:shimmer/shimmer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static const int _shimerNotificationCount = 6;

  void _onRefreshPage(BuildContext context) {
    context.read<NotificationBloc>().add(const NotificationEvent.onLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationBloc()..add(const NotificationEvent.onLoaded()),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.when<Widget>(
            load: () => _buildMain(context, notifications: null),
            loading: (notifications) =>
                _buildMain(context, notifications: notifications),
            error: (message) => _buildError(context, message: message),
            noNetwork: () =>
                _buildError(context, message: 'noInternet'.tr),
          );
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, {required String message}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              ElevatedButton(
                onPressed: () => _onRefreshPage(context),
                child: Text('refreshPage'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context,
      {required List<entity.Notification>? notifications}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'notification'.tr,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => _buildNotificationItem(
                context,
                notification: notifications?[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: notifications?.length ?? _shimerNotificationCount,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    entity.Notification? notification,
  }) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: notification != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: Image.memory(
                          notification.banner.data.toImage(),
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notification != null
                  ? Text(
                      notification.title,
                      style: GoogleFonts.roboto(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    )
                  : SizedBox(
                      height: 24,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 2),
              notification != null
                  ? Tooltip(
                      message: notification.description,
                      child: Text(
                        notification.description,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
