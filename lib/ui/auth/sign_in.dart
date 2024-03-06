import 'package:bitcoin/constants/app_config.dart';
import 'package:bitcoin/controllers/auth/auth_bloc.dart';
import 'package:bitcoin/controllers/auth/auth_event.dart';
import 'package:bitcoin/controllers/auth/auth_state.dart';
import 'package:bitcoin/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_enums.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_validators.dart';
import '../../widgets/buttons/app_button.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController userNameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightGreen[100], body: _content());
  }

  Widget _content() {
    return SingleChildScrollView(
      padding: AppStyles.commonScreenHorizonPadding20,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppStyles.boxHeight50,
            AppStyles.boxHeight50,
            WidgetUtils.appLogo(),
            Text(
              'Welcome To \n${AppConfig.appName.toUpperCase()}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            AppStyles.boxHeight50,
            AppStyles.boxHeightLarge,
            TextFormField(
              controller: userNameTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                label: Text("User Name"),
                hintText: "User Name",
                fillColor: Colors.white,
                hintStyle: TextStyle(fontSize: 12),
                filled: true,
                counterText: '',
                alignLabelWithHint: false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                border: getBorder(),
                errorBorder: getBorder(color: Colors.red),
                focusedBorder: getBorder(),
                focusedErrorBorder: getBorder(color: Colors.red),
                enabledBorder: getBorder(),
                disabledBorder: getBorder(color: Colors.grey),
              ),
              validator: AppValidators.nameValidator,
            ),
            AppStyles.boxHeightMedium,
            AppStyles.boxHeightMedium,
            AppStyles.boxHeightMedium,
            _signInButton(),
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return BlocSelector<AuthBloc, AuthStates, AuthStatus>(
        selector: (AuthStates state) => state.authStatus,
        builder: (context, AuthStatus data) {
          return AppButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(
                  LoginEvent(userName: userNameTextEditingController.text));
            },
            borderRadius: 10,
            height: 50,
            expandWidth: true,
            text: "Sign In",
            fontSize: 16,
            isLoading: data == AuthStatus.authenticating,
          );
        });
  }
}

InputBorder getBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(width: 1, color: color ?? AppColors.primary),
  );
}
