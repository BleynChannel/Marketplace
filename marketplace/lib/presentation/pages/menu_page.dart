import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/domain/repository/auth_repository.dart';
import 'package:marketplace/core/const/colors.dart';
import 'package:marketplace/presentation/controller/menu_controller.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/provider/home_avatar_provider.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/core/utils/utils.dart' as ui_utils;
import 'package:marketplace/presentation/widgets/expansion_category.dart';

// ignore: must_be_immutable
class MenuPage extends GetView<MenuController> {
  void Function()? action;

  late final String path;

  String? _categoryPath;
  String? _fieldPath;

  void _initPath(String? path) {
    this.path = path != null ? path.substring(1) : '';
    if (this.path.isNotEmpty) {
      final paths = this.path.split('.');
      if (paths.length == 1) {
        _categoryPath = paths[0];
      } else if (paths.length == 2) {
        _categoryPath = paths[0];
        _fieldPath = paths[1];
      }
    }
  }

  MenuPage({Key? key, @PathParam() String? path}) : super(key: key) {
    _initPath(path);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (action != null) {
        action!();
      }
    });
  }

  Map<String, _MenuCategory> _getFields(BuildContext context) {
    final menuActions = _MenuActions(context, controller);

    return {
      'profile': _MenuCategory(title: 'Profile', fields: {
        'nickname': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: const Text("Change nickname"),
              leading: const Icon(Icons.person_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.nicknameAction,
        ),
        'status': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: const Text("Change status"),
              leading: const Icon(Icons.more_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.statusAction,
        ),
        'avatar': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: const Text("Change avatar"),
              leading: const Icon(Icons.person_pin_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.avatarAction,
        ),
        'background': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: const Text("Change background"),
              leading: const Icon(Icons.image),
              onTap: () => action(),
            );
          },
          action: menuActions.backgroundAction,
        ),
        'password': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: const Text("Change password"),
              leading: const Icon(Icons.lock_outline),
              onTap: () => action(),
            );
          },
          action: menuActions.passwordAction,
        ),
        'signout': _MenuField(
          builder: (context, action) {
            return ListTile(
              title: const Text("Sign Out"),
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              onTap: () => action(),
            );
          },
          action: menuActions.signoutAction,
        ),
      }),
      'settings': _MenuCategory(title: 'Settings', fields: {
        'language': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
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
              onTap: () => action(),
            );
          },
          action: menuActions.languageAction,
        ),
      }),
      'notification': _MenuCategory(title: 'Notification', fields: {
        'received_notification': _MenuField(
          builder: (context, action) {
            return Obx(
              () => _buildSwitchListTile(
                title: const Text("Received notification"),
                value: controller.receivedNotificationSwitch,
                onChanged: (value) {
                  controller.receivedNotificationSwitch =
                      !controller.receivedNotificationSwitch;
                  action();
                },
              ),
            );
          },
          action: () {},
        ),
        'received_newsletter': _MenuField(
          builder: (context, action) {
            return Obx(
              () => _buildSwitchListTile(
                title: const Text("Received newsletter"),
                value: controller.receivedNewsletterSwitch,
                onChanged: (value) {
                  controller.receivedNewsletterSwitch =
                      !controller.receivedNewsletterSwitch;
                  action();
                },
              ),
            );
          },
          action: () {},
        ),
      }),
    };
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

  @override
  Widget build(BuildContext context) {
    final fields = _getFields(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            ...fields.entries
                .map((category) => _buildCategory(
                      context,
                      title: category.value.title,
                      initiallyExpanded: path.isEmpty ||
                          (_categoryPath != null &&
                              _categoryPath == category.key),
                      children: category.value.fields.entries.map((field) {
                        if (_fieldPath != null && _fieldPath == field.key) {
                          action = field.value.action;
                        }

                        return field.value.builder(context, field.value.action);
                      }).toList(),
                    ))
                .expand((element) => [element, const SizedBox(height: 10)]),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required String title,
    required bool initiallyExpanded,
    required List<Widget> children,
  }) {
    return ExpansionCategory(
      key: UniqueKey(),
      initiallyExpanded: initiallyExpanded,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w700,
            ),
        overflow: TextOverflow.ellipsis,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            border: Border.all(
              width: 2,
              color: Color.lerp(AppColors.secondaryColor, Colors.grey, 0.3) ??
                  Colors.white,
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
      ),
    );
  }
}

class _MenuCategory {
  final String title;
  final Map<String, _MenuField> fields;

  _MenuCategory({required this.title, required this.fields});
}

class _MenuField {
  final Widget Function(
    BuildContext context,
    void Function() action,
  ) builder;
  final void Function() action;

  _MenuField({required this.builder, required this.action});
}

class _MenuActions {
  final BuildContext context;
  final MenuController controller;

  _MenuActions(this.context, this.controller);

  void nicknameAction() {
    showDialog(
      context: context,
      builder: (context) {
        //TODO: Брать ник из user
        final inputController =
            TextEditingController(text: debugProfile.nickname);
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

        return Theme(
          data: ThemeData.dark(),
          child: AlertDialog(
            title: Text(
              'Enter a nickname',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: inputController,
                validator: (value) => ui_utils.isNicknameValid(value ?? ''),
                autovalidateMode: AutovalidateMode.always,
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Change'),
                onPressed: () async {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    String nickname = inputController.text.trim();

                    final result = await controller.userRepository
                        .changeProfileNickname(nickname: nickname);

                    String message = '';
                    bool isCorrect = false;

                    result.fold<void>(
                      (failure) {
                        failure.when(
                          unknown: () => message = 'Unknown error',
                        );
                        isCorrect = false;
                      },
                      (data) {
                        debugProfile.nickname = nickname;
                        message = 'Changes saved';
                        isCorrect = true;
                      },
                    );

                    await _showMessageDialog(
                      message: message,
                      isCorrect: isCorrect,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void statusAction() {
    showDialog(
      context: context,
      builder: (context) {
        //TODO: Брать статус из user
        final inputController =
            TextEditingController(text: debugProfile.status.title);
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

        Color changeColor = Colors.black;

        return Theme(
          data: ThemeData.dark(),
          child: AlertDialog(
            title: Text(
              'Enter a status',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: _MenuStatusContent(
              formKey: formKey,
              inputController: inputController,
              color: debugProfile.status.color,
              onColorChanged: (color) => changeColor = color,
            ),
            actions: [
              TextButton(
                child: const Text('Change'),
                onPressed: () async {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    String title = inputController.text.trim();

                    final result = await controller.userRepository
                        .changeProfileStatus(
                            status: Status(title: title, color: changeColor));

                    String message = '';
                    bool isCorrect = false;

                    result.fold<void>(
                      (failure) {
                        failure.when(
                          unknown: () => message = 'Unknown error',
                        );
                        isCorrect = false;
                      },
                      (data) {
                        debugProfile.status.title = title;
                        debugProfile.status.color = changeColor;
                        message = 'Changes saved';
                        isCorrect = true;
                      },
                    );

                    await _showMessageDialog(
                      message: message,
                      isCorrect: isCorrect,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void avatarAction() {
    showDialog(
      context: context,
      builder: (context) {
        Uint8List image = debugProfile.avatar.data.toImage();

        return Theme(
          data: ThemeData.dark(),
          child: AlertDialog(
            title: Text(
              'Pick a avatar',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: _MenuAvatarContent(
              image: image,
              onImageChange: (Uint8List img) => image = img,
            ),
            actions: [
              TextButton(
                child: const Text('Change'),
                onPressed: () async {
                  Media media = Media(
                    type: MediaType.image,
                    location: MediaLocation.remote,
                    data: MediaData(data: image),
                  );

                  final result = await controller.userRepository
                      .changeProfileAvatar(avatar: media);

                  String message = '';
                  bool isCorrect = false;

                  result.fold<void>(
                    (failure) {
                      failure.when(
                        unknown: () => message = 'Unknown error',
                      );
                      isCorrect = false;
                    },
                    (data) {
                      debugProfile.avatar = media;
                      Get.find<HomeAvatarProvider>().image = image;

                      message = 'Changes saved';
                      isCorrect = true;
                    },
                  );

                  await _showMessageDialog(
                    message: message,
                    isCorrect: isCorrect,
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void backgroundAction() {
    showDialog(
      context: context,
      builder: (context) {
        Uint8List image = debugProfile.backgroundImage.data.toImage();

        return Theme(
          data: ThemeData.dark(),
          child: AlertDialog(
            title: Text(
              'Pick a background',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: _MenuBackgroundContent(
              image: image,
              onImageChange: (Uint8List img) => image = img,
            ),
            actions: [
              TextButton(
                child: const Text('Change'),
                onPressed: () async {
                  Media media = Media(
                    type: MediaType.image,
                    location: MediaLocation.remote,
                    data: MediaData(data: image),
                  );

                  final result = await controller.userRepository
                      .changeProfileBackgroundImage(backgroundImage: media);

                  String message = '';
                  bool isCorrect = false;

                  result.fold<void>(
                    (failure) {
                      failure.when(
                        unknown: () => message = 'Unknown error',
                      );
                      isCorrect = false;
                    },
                    (data) {
                      debugProfile.backgroundImage = media;
                      message = 'Changes saved';
                      isCorrect = true;
                    },
                  );

                  await _showMessageDialog(
                    message: message,
                    isCorrect: isCorrect,
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void passwordAction() {
    showDialog(
      context: context,
      builder: (context) {
        final inputController = TextEditingController();
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();

        return Theme(
          data: ThemeData.dark(),
          child: AlertDialog(
            title: Text(
              'Enter a new password',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: inputController,
                    validator: (value) => ui_utils.isPasswordValid(value ?? ''),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Change'),
                onPressed: () async {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    String newPassword = inputController.text.trim();

                    final result = await controller.userRepository
                        .changeProfilePassword(newPassword: newPassword);

                    String message = '';
                    bool isCorrect = false;

                    result.fold<void>(
                      (failure) {
                        failure.when(
                          unknown: () => message = 'Unknown error',
                          weakPassword: () =>
                              message = 'The password is not strong enough',
                          requiresRecentLogin: () => message =
                              'User\'s last sign-in time does not meet the security threshold',
                        );
                        isCorrect = false;
                      },
                      (data) {
                        debugProfile.nickname = newPassword;
                        message = 'Changes saved';
                        isCorrect = true;
                      },
                    );

                    await _showMessageDialog(
                      message: message,
                      isCorrect: isCorrect,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
              ),
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void signoutAction() async {
    final repository = Get.find<AuthRepository>();
    final result = await repository.signOut();
    result.fold<void>((failure) {
      String message = '';

      failure.when(
        unknown: () => message = 'Unknown error',
        networkRequestFailed: () => message = 'No network',
      );

      ui_utils.sendScaffoldMessage(context, message: message);
    }, (_) {});
  }

  void languageAction() {
    //Менять язык

    showDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData.dark(),
        child: AlertDialog(
          title: Text(
            'Enter a new password',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: DropdownButton(
            items: const [
              DropdownMenuItem(child: Text('English')),
            ],
            onChanged: (value) {
              //Менять язык
            },
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void receivedNotificationAction() {
    //Отправлять уведомления?
  }

  void receivedNewsletterAction() {
    //Отправлять новостную рассылку?
  }

  Future _showMessageDialog({
    required String message,
    required bool isCorrect,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LottieBuilder.asset(
              "assets/lottie/${isCorrect ? 'check' : 'uncheck'}.json",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: GoogleFonts.roboto(fontSize: 16),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuStatusContent extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController inputController;
  final Color color;
  final void Function(Color color) onColorChanged;

  const _MenuStatusContent({
    Key? key,
    required this.formKey,
    required this.inputController,
    required this.color,
    required this.onColorChanged,
  }) : super(key: key);

  @override
  State<_MenuStatusContent> createState() => _MenuStatusContentState();
}

class _MenuStatusContentState extends State<_MenuStatusContent> {
  late Color _changeColor;

  @override
  void initState() {
    super.initState();

    _changeColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(
        children: [
          InkWell(
            child: Container(
              color: _changeColor,
              width: 32,
              height: 32,
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => Theme(
                data: ThemeData.dark(),
                child: AlertDialog(
                  title: Text(
                    'Pick a color',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: debugProfile.status.color,
                      onColorChanged: (value) => setState(() {
                        _changeColor = value;
                        widget.onColorChanged(value);
                      }),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: widget.inputController,
              autovalidateMode: AutovalidateMode.always,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuAvatarContent extends StatefulWidget {
  final Uint8List image;
  final void Function(Uint8List image) onImageChange;

  const _MenuAvatarContent({
    Key? key,
    required this.image,
    required this.onImageChange,
  }) : super(key: key);

  @override
  State<_MenuAvatarContent> createState() => _MenuAvatarContentState();
}

class _MenuAvatarContentState extends State<_MenuAvatarContent> {
  late Uint8List _image;

  late TextEditingController _urlController;

  @override
  void initState() {
    super.initState();

    _image = widget.image;

    _urlController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.memory(
          _image,
          width: 64,
          height: 64,
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _urlController,
          decoration: const InputDecoration(hintText: 'Enter a url'),
          onEditingComplete: () async {
            http.Response response =
                await http.get(Uri.parse(_urlController.text.trim()));

            setState(() {
              _image = response.bodyBytes;
              widget.onImageChange(_image);
            });
          },
        ),
        const SizedBox(height: 8),
        const Text('or'),
        TextButton(
          onPressed: () async {
            final picker = ImagePicker();
            final XFile? file =
                await picker.pickImage(source: ImageSource.gallery);
            if (file != null) {
              final image = await file.readAsBytes();
              setState(() {
                _image = image;
                widget.onImageChange(_image);
              });
            }
          },
          child: const Text('Choose from storage'),
        ),
      ],
    );
  }
}

class _MenuBackgroundContent extends StatefulWidget {
  final Uint8List image;
  final void Function(Uint8List image) onImageChange;

  const _MenuBackgroundContent({
    Key? key,
    required this.image,
    required this.onImageChange,
  }) : super(key: key);

  @override
  State<_MenuBackgroundContent> createState() => _MenuBackgroundContentState();
}

class _MenuBackgroundContentState extends State<_MenuBackgroundContent> {
  late Uint8List _image;

  late TextEditingController _urlController;

  @override
  void initState() {
    super.initState();

    _image = widget.image;

    _urlController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.memory(_image),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _urlController,
          decoration: const InputDecoration(hintText: 'Enter a url'),
          onEditingComplete: () async {
            http.Response response =
                await http.get(Uri.parse(_urlController.text.trim()));

            setState(() {
              _image = response.bodyBytes;
              widget.onImageChange(_image);
            });
          },
        ),
        const SizedBox(height: 8),
        const Text('or'),
        TextButton(
          onPressed: () async {
            final picker = ImagePicker();
            final XFile? file =
                await picker.pickImage(source: ImageSource.gallery);
            if (file != null) {
              final image = await file.readAsBytes();
              setState(() {
                _image = image;
                widget.onImageChange(_image);
              });
            }
          },
          child: const Text('Choose from storage'),
        ),
      ],
    );
  }
}
