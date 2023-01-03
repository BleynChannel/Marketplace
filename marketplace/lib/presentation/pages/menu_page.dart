import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/presentation/widgets/category_list.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late bool _receivedNotificationSwitch;
  late bool _receivedNewsletterSwitch;

  void _onChangeNickname(BuildContext context) {}

  void _onChangePassword(BuildContext context) {}

  Future _onSignOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    context.router.replaceAll([const WelcomeRoute()]);
  }

  void _onChangeLanguage(BuildContext context) {}

  void _onChangeReceivedNotification(BuildContext context) {}

  void _onChangeReceivedNewsletter(BuildContext context) {}

  @override
  void initState() {
    _receivedNotificationSwitch = true;
    _receivedNewsletterSwitch = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> menuCategory = {
      'Profile': _buildCategoryProfile(context),
      'Settings': _buildCategorySettings(context),
      'Notification': _buildCategoryNotification(context),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BackgroundBlur(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ...menuCategory.entries
                .map((category) => CategoryList(
                      isHidingEnabled: true,
                      title: Text(
                        category.key,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: category.value,
                    ))
                .expand((element) => [element, const SizedBox(height: 10)]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCategory(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(
            width: 2,
            color: Color.lerp(secondaryColor, Colors.grey, 0.3) ?? Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 16,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            listTileTheme: ListTileThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Column(children: children),
        ),
      ),
    );
  }

  ListTile _buildInkListTile({
    Widget? title,
    Widget? subTitle,
    Widget? leading,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: title,
      subtitle: subTitle,
      leading: leading,
      trailing: const Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }

  ListTile _buildSwitchListTile({
    Widget? title,
    required bool value,
    required void Function(bool value) onChanged,
  }) {
    return ListTile(
      title: title,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildCategoryProfile(BuildContext context) {
    return _buildBackgroundCategory(context, children: [
      _buildInkListTile(
        title: const Text("Change nickname"),
        leading: const Icon(Icons.person_outlined),
        onTap: () => _onChangeNickname(context),
      ),
      _buildInkListTile(
        title: const Text("Change password"),
        leading: const Icon(Icons.lock_outline),
        onTap: () => _onChangePassword(context),
      ),
      ListTile(
        title: const Text("Sign Out"),
        leading: const Icon(Icons.exit_to_app, color: Colors.red),
        onTap: () async => await _onSignOut(context),
      ),
    ]);
  }

  Widget _buildCategorySettings(BuildContext context) {
    return _buildBackgroundCategory(context, children: [
      _buildInkListTile(
        title: const Text("Change language"),
        subTitle: Text(
          "English",
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white70,
          ),
        ),
        leading: const Icon(Icons.language),
        onTap: () => _onChangeLanguage(context),
      ),
    ]);
  }

  Widget _buildCategoryNotification(BuildContext context) {
    return _buildBackgroundCategory(context, children: [
      _buildSwitchListTile(
        title: const Text("Received notification"),
        value: _receivedNotificationSwitch,
        onChanged: (value) => setState(() {
          _receivedNotificationSwitch = !_receivedNotificationSwitch;

          _onChangeReceivedNotification(context);
        }),
      ),
      _buildSwitchListTile(
        title: const Text("Received newsletter"),
        value: _receivedNewsletterSwitch,
        onChanged: (value) => setState(() {
          _receivedNewsletterSwitch = !_receivedNewsletterSwitch;

          _onChangeReceivedNewsletter(context);
        }),
      ),
    ]);
  }
}
