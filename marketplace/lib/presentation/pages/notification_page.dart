import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/domain/entity/notification.dart' as entity;

class NotificationPage extends StatefulWidget {
  final Map<entity.Notification, bool> _debugNotification = {
    debugNotification[0]: false,
  };

  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ListView.separated(
              itemBuilder: (context, index) => _buildNotificationItem(
                context,
                widget._debugNotification.entries.elementAt(index).key,
                widget._debugNotification.entries.elementAt(index).value,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: widget._debugNotification.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    entity.Notification notification,
    bool isRead,
  ) {
    return IntrinsicHeight(
      child: Row(children: [
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: Image.asset(notification.pathToImage).image,
                  fit: BoxFit.cover,
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
              Text(
                notification.title,
                style: GoogleFonts.roboto(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                notification.description,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
