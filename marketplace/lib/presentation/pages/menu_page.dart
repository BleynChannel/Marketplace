import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:crop_image/crop_image.dart';
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
import 'package:marketplace/presentation/app_translations.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/provider/home_avatar_provider.dart';
import 'package:marketplace/presentation/widgets/background_blur.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/presentation/widgets/expansion_category.dart';
import 'package:marketplace/presentation/widgets/value_builder_fix.dart';
import 'package:marketplace/presentation/controller/menu_controller.dart' as c;

@RoutePage()
// ignore: must_be_immutable
class MenuPage extends GetView<c.MenuController> {
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
      'profile': _MenuCategory(title: 'profile'.tr, fields: {
        'nickname': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangeNickname'.tr),
              leading: const Icon(Icons.person_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.nicknameAction,
        ),
        'status': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangeStatus'.tr),
              leading: const Icon(Icons.more_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.statusAction,
        ),
        'avatar': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangeAvatar'.tr),
              leading: const Icon(Icons.person_pin_outlined),
              onTap: () => action(),
            );
          },
          action: menuActions.avatarAction,
        ),
        'background': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangeBackground'.tr),
              leading: const Icon(Icons.image),
              onTap: () => action(),
            );
          },
          action: menuActions.backgroundAction,
        ),
        'password': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangePassword'.tr),
              leading: const Icon(Icons.lock_outline),
              onTap: () => action(),
            );
          },
          action: menuActions.passwordAction,
        ),
        'signout': _MenuField(
          builder: (context, action) {
            return ListTile(
              title: Text('menuSignOut'.tr),
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              onTap: () => action(),
            );
          },
          action: menuActions.signoutAction,
        ),
      }),
      'settings': _MenuCategory(title: 'menuSettingsCategory'.tr, fields: {
        'language': _MenuField(
          builder: (context, action) {
            return _buildInkListTile(
              title: Text('menuChangeLanguage'.tr),
              subTitle: ObxValue(
                (language) => Text(
                  AppTranslations.language[language.value] ?? '',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                ),
                controller.userRepository.rxLanguage,
              ),
              leading: const Icon(Icons.language),
              onTap: () => action(),
            );
          },
          action: menuActions.languageAction,
        ),
      }),
      'notification': _MenuCategory(title: 'notification'.tr, fields: {
        'received_notification': _MenuField(
          builder: (context, action) {
            return Obx(
              () => _buildSwitchListTile(
                title: Text('menuReceivedNotification'.tr),
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
                title: Text('menuReceivedNewsletter'.tr),
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
          'menu'.tr,
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
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
  final c.MenuController controller;

  _MenuActions(this.context, this.controller);

  void nicknameAction() {
    //TODO: Брать ник из user
    final inputController = TextEditingController(text: debugProfile.nickname);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    _MenuDialogUtils.alertDialog(
      context,
      title: 'menuNicknameEnterNickname'.tr,
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: inputController,
          validator: (value) => Utils.isNicknameValid(value ?? ''),
          autovalidateMode: AutovalidateMode.always,
        ),
      ),
      onChangePressed: () async {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          String nickname = inputController.text.trim();

          final result = await controller.userRepository
              .changeProfileNickname(nickname: nickname);

          String message = '';
          bool isCorrect = false;

          result.fold<void>(
            (failure) {
              failure.when(
                unknown: () => message = 'unknownError'.tr,
              );
              isCorrect = false;
            },
            (data) {
              message = 'changesSaved'.tr;
              isCorrect = true;
            },
          );

          // ignore: use_build_context_synchronously
          await _MenuDialogUtils.messageDialog(
            context,
            message: message,
            isCorrect: isCorrect,
          );
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      },
    );
  }

  void statusAction() {
    //TODO: Брать статус из user
    final inputController =
        TextEditingController(text: debugProfile.status?.title);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Color changeColor = Colors.black;

    _MenuDialogUtils.alertDialog(
      context,
      title: 'menuStatusEnterStatus'.tr,
      content: _MenuStatusContent(
        formKey: formKey,
        inputController: inputController,
        color: debugProfile.status?.color ?? Colors.white,
        onColorChanged: (color) => changeColor = color,
      ),
      onChangePressed: () async {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          String title = inputController.text.trim();

          final result = await controller.userRepository.changeProfileStatus(
              status: Status(title: title, color: changeColor));

          String message = '';
          bool isCorrect = false;

          result.fold<void>(
            (failure) {
              failure.when(
                unknown: () => message = 'unknownError'.tr,
              );
              isCorrect = false;
            },
            (data) {
              message = 'changesSaved'.tr;
              isCorrect = true;
            },
          );

          // ignore: use_build_context_synchronously
          await _MenuDialogUtils.messageDialog(
            context,
            message: message,
            isCorrect: isCorrect,
          );
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      },
    );
  }

  void avatarAction() {
    _MenuDialogUtils.imagePickerBottomSheet(
      context,
      onPickFile: (image) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _MenuImageCropWidget(
            initialImage: image,
            onCrop: (image) {
              controller.userRepository
                  .changeProfileAvatar(
                      avatar: Media(type: MediaType.image, data: image))
                  .then((result) async {
                String message = '';
                bool isCorrect = false;

                result.fold<void>(
                  (failure) {
                    failure.when(
                      unknown: () => message = 'unknownError'.tr,
                    );
                    isCorrect = false;
                  },
                  (data) {
                    Get.find<HomeAvatarProvider>().image = image;

                    message = 'changesSaved'.tr;
                    isCorrect = true;
                  },
                );

                await _MenuDialogUtils.messageDialog(
                  context,
                  message: message,
                  isCorrect: isCorrect,
                ).then((_) => Navigator.pop(context));
              });
            },
          ),
        ),
      ),
    );
  }

  void backgroundAction() {
    _MenuDialogUtils.imagePickerBottomSheet(
      context,
      onPickFile: (image) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _MenuImageCropWidget(
            initialImage: image,
            aspectRatio: 16.0 / 9.0,
            onCrop: (image) {
              controller.userRepository
                  .changeProfileBackgroundImage(
                      backgroundImage:
                          Media(type: MediaType.image, data: image))
                  .then((result) async {
                String message = '';
                bool isCorrect = false;

                result.fold<void>(
                  (failure) {
                    failure.when(
                      unknown: () => message = 'unknownError'.tr,
                    );
                    isCorrect = false;
                  },
                  (data) {
                    message = 'changesSaved'.tr;
                    isCorrect = true;
                  },
                );

                await _MenuDialogUtils.messageDialog(
                  context,
                  message: message,
                  isCorrect: isCorrect,
                ).then((_) => Navigator.pop(context));
              });
            },
          ),
        ),
      ),
    );
  }

  void passwordAction() {
    final inputController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    _MenuDialogUtils.alertDialog(
      context,
      title: 'menuPasswordEnterPassword'.tr,
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: inputController,
              validator: (value) => Utils.isPasswordValid(value ?? ''),
              autovalidateMode: AutovalidateMode.always,
            ),
          ],
        ),
      ),
      onChangePressed: () async {
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          String newPassword = inputController.text.trim();

          final result = await controller.userRepository
              .changeProfilePassword(newPassword: newPassword);

          String message = '';
          bool isCorrect = false;

          result.fold<void>(
            (failure) {
              failure.when(
                unknown: () => message = 'unknownError'.tr,
                weakPassword: () => message = 'weakPassword'.tr,
                requiresRecentLogin: () => message = 'requiresRecentLogin'.tr,
              );
              isCorrect = false;
            },
            (data) {
              message = 'changesSaved'.tr;
              isCorrect = true;
            },
          );

          // ignore: use_build_context_synchronously
          await _MenuDialogUtils.messageDialog(
            context,
            message: message,
            isCorrect: isCorrect,
          );
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      },
    );
  }

  void signoutAction() async {
    final repository = Get.find<AuthRepository>();
    final result = await repository.signOut();
    result.fold<void>((failure) {
      String message = '';

      failure.when(
        unknown: () => message = 'unknownError'.tr,
        networkRequestFailed: () => message = 'noInternet'.tr,
      );

      Utils.sendScaffoldMessage(context, message: message);
    }, (_) {});
  }

  void languageAction() {
    _MenuDialogUtils.dialog(
      context,
      child: AlertDialog(
        title: Text(
          'menuLanguageSelectLanguage'.tr,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: ValueBuilderFix(
            initialValue: controller.userRepository.language,
            builder: (value, update) {
              return DropdownButton<String>(
                value: value,
                items: AppTranslations.language.entries
                    .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                              value: e.key,
                              child: Text(e.value),
                            ))
                    .toList(),
                onChanged: (key) async {
                  if (key != null) {
                    final result = await controller.userRepository
                        .changeLanguage(language: key);

                    result.fold<void>(
                      (failure) async {
                        String message = '';

                        failure.when(
                          unknown: () => message = 'unknownError'.tr,
                        );

                        // ignore: use_build_context_synchronously
                        await _MenuDialogUtils.messageDialog(
                          context,
                          message: message,
                          isCorrect: false,
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      (_) => update(key),
                    );
                  }
                },
              );
            }),
        actions: [
          ElevatedButton(
            child: Text('close'.tr),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void receivedNotificationAction() {
    //Отправлять уведомления?
  }

  void receivedNewsletterAction() {
    //Отправлять новостную рассылку?
  }
}

class _MenuDialogUtils {
  static Future<T?> dialog<T>(
    BuildContext context, {
    required Widget child,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme:
                const ColorScheme.dark(primary: AppColors.primaryColor),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
          child: child,
        );
      },
    );
  }

  static Future<T?> bottomSheet<T>(
    BuildContext context, {
    required Widget child,
  }) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => child,
    );
  }

  static Future<T?> alertDialog<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    void Function()? onChangePressed,
  }) async {
    return await dialog(
      context,
      child: AlertDialog(
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: content,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr),
          ),
          ElevatedButton(
            onPressed: onChangePressed,
            child: Text('change'.tr),
          ),
        ],
      ),
    );
  }

  static Future<T?> imagePickerBottomSheet<T>(
    BuildContext context, {
    required void Function(Uint8List image) onPickFile,
  }) async {
    return await bottomSheet(
      context,
      child: _MenuImagePicker(
        onPickFile: (image) {
          Navigator.pop(context);
          onPickFile(image);
        },
      ),
    );
  }

  static Future<T?> messageDialog<T>(
    BuildContext context, {
    required String message,
    required bool isCorrect,
  }) async {
    return await dialog(
      context,
      child: AlertDialog(
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
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('close'.tr),
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> waitingDialog<T>(
      BuildContext context, Future<T> future) async {
    return await _MenuDialogUtils.dialog<T>(
      context,
      child: AlertDialog(
        content: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Navigator.pop(context, snapshot.data);
            } else if (snapshot.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${'error'.tr}: ${snapshot.error}'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('close'.tr),
                  ),
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                  "${'menuWaitingDialogWaiting'.tr}...",
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MenuImagePicker extends StatelessWidget {
  final void Function(Uint8List image) onPickFile;

  const _MenuImagePicker({
    Key? key,
    required this.onPickFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ValueBuilderFix(
            initialValue: true,
            builder: (enabled, update) {
              return ElevatedButton.icon(
                onPressed: enabled!
                    ? () {
                        update(false);

                        ImagePicker()
                            .pickImage(source: ImageSource.gallery)
                            .then((file) async {
                          if (file != null) {
                            final image = await File(file.path).readAsBytes();
                            onPickFile(image);
                          }

                          update(true);
                        });
                      }
                    : null,
                icon: const Icon(Icons.collections),
                label: Text('menuImagePickerBrowseGallery'.tr),
              );
            },
          ),
          const SizedBox(height: 6),
          Text(
            'or'.tr.toUpperCase(),
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          ValueBuilderFix(
            initialValue: true,
            builder: (enabled, update) {
              return ElevatedButton(
                onPressed: enabled!
                    ? () async {
                        update(false);

                        final inputController = TextEditingController();
                        final GlobalKey<FormState> formKey =
                            GlobalKey<FormState>();

                        _MenuDialogUtils.alertDialog<String>(
                          context,
                          title: 'menuImagePickerEnterUrl'.tr,
                          content: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: inputController,
                                  validator: (value) =>
                                      Utils.isImageValid(value ?? ''),
                                  autovalidateMode: AutovalidateMode.always,
                                ),
                              ],
                            ),
                          ),
                          onChangePressed: () async {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              Navigator.pop(
                                  context, inputController.text.trim());
                            }
                          },
                        ).then((url) async {
                          if (url != null) {
                            final response =
                                await _MenuDialogUtils.waitingDialog(
                                    context, http.get(Uri.parse(url)));

                            if (response != null) {
                              final imageBytes = response.bodyBytes;
                              onPickFile(imageBytes);
                            }
                          }

                          update(true);
                        });
                      }
                    : null,
                child: Text('menuImagePickerEnterUrl'.tr),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MenuImageCropWidget extends StatelessWidget {
  final Uint8List initialImage;
  final double aspectRatio;
  final void Function(Uint8List image) onCrop;

  const _MenuImageCropWidget({
    Key? key,
    required this.initialImage,
    double? aspectRatio,
    required this.onCrop,
  })  : aspectRatio = aspectRatio ?? 1,
        super(key: key);

  Future _crop(CropController controller) async {
    final bitmap = await controller.croppedBitmap();
    final bitmapData = await bitmap.toByteData(format: ImageByteFormat.png);
    onCrop(bitmapData!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    final controller = CropController(aspectRatio: aspectRatio);

    return Material(
      child: SafeArea(
        top: false,
        child: Column(children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CropImage(
                  image: Image.memory(initialImage),
                  controller: controller,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 32,
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.check),
                    onPressed: () async {
                      await _MenuDialogUtils.waitingDialog(
                        context,
                        _crop(controller),
                      ).then((_) => Navigator.pop(context));
                    },
                  ),
                ]),
          ),
        ]),
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
                data: ThemeData.dark().copyWith(
                  colorScheme:
                      const ColorScheme.dark(primary: AppColors.primaryColor),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
                child: AlertDialog(
                  title: Text(
                    'menuStatusContentPickColor'.tr,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: debugProfile.status?.color ?? Colors.white,
                      onColorChanged: (value) => setState(() {
                        _changeColor = value;
                        widget.onColorChanged(value);
                      }),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('close'.tr),
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
