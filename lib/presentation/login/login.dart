// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter_template/presentation/common/state_renderer/state_renderer.dart';
import 'package:mobile_flutter_template/presentation/login/login_viewmodel.dart';
import 'package:mobile_flutter_template/presentation/resources/assets_manager.dart';
import 'package:mobile_flutter_template/presentation/resources/color_manager.dart';
import 'package:mobile_flutter_template/presentation/resources/strings_manager.dart';
import 'package:mobile_flutter_template/presentation/resources/values_manager.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final userController = TextEditingController();
  // final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _isThereCurrentDialogShowing(BuildContext context) =>
        ModalRoute.of(context)?.isCurrent != true;
    ref.watch(loginProvider).when(
        loading: () {
          WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return StateRenderer(
                  stateRendererType: StateRendererType.POPUP_LOADING_STATE,
                  message: 'Loading',
                  title: 'Loading',
                  retryActionFunction: () {},
                );
              }));
        },
        initial: (username) => {},
        success: (user) => Text("success"),
        error: (e) {
          WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return StateRenderer(
                  stateRendererType: StateRendererType.POPUP_ERROR_STATE,
                  message: 'ERROR',
                  title: e.toString(),
                  retryActionFunction: () {},
                );
              }));
        });
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
          padding: EdgeInsets.only(top: AppPadding.p100),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image(image: AssetImage(ImageAssets.splashLogo)),
                  SizedBox(height: AppSize.s28),
                  Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => ref
                            .read(userNameControllerProvider.notifier)
                            .state = value,
                        decoration: InputDecoration(
                            hintText: AppStrings.username.tr(),
                            labelText: AppStrings.username.tr(),
                            errorText:
                                ref.watch(userNameControllerProvider).isEmpty
                                    ? AppStrings.usernameError.tr()
                                    : null),
                      )),
                  SizedBox(height: AppSize.s28),
                  Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: TextFormField(
                        // controller: passwordController,
                        onChanged: (value) => ref
                            .read(passwordControllerProvider.notifier)
                            .state = value,
                        decoration: InputDecoration(
                            hintText: AppStrings.password.tr(),
                            labelText: AppStrings.password.tr(),
                            errorText:
                                ref.watch(passwordControllerProvider).isEmpty
                                    ? AppStrings.passwordError.tr()
                                    : null),
                      )),
                  SizedBox(height: AppSize.s28),
                  Padding(
                      padding: EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: !ref.watch(isFormValid)
                                ? null
                                : () =>
                                    ref.read(loginProvider.notifier).login(),
                            child: Text(AppStrings.login.tr())),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppPadding.p8,
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.forgetPassword,
                                  style: Theme.of(context).textTheme.titleSmall)
                              .tr(),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppStrings.registerText,
                                  style: Theme.of(context).textTheme.titleSmall)
                              .tr(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
