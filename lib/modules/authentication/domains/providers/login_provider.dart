// ignore_for_file: use_build_context_synchronously

import 'package:cbt_platform/core/app/domains/models/user.model.dart';
import 'package:cbt_platform/core/app/domains/providers/app_provider.dart';
import 'package:cbt_platform/modules/admin/views/admin_hp.dart';
import 'package:cbt_platform/modules/authentication/domains/entities/user_enum.dart';
import 'package:cbt_platform/modules/candidate/domains/providers/candidate_exam_provider.dart';
import 'package:cbt_platform/modules/candidate/screens/exam_selection.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/app/repositories/preference_repository.dart';
import '../../../../core/app_constants.dart';
import '../../../../utilities/custom_navigator.dart';
import '../../../../utilities/service_locator.dart';
import '../../../../utilities/snack_bar_util.dart';
import '../../../admin/views/examiner_screen.dart';
import '../../repository/auth_repository.dart';
import '../../screens/login.screen.dart';

ChangeNotifierProvider<LoginProvider> loginProvider = ChangeNotifierProvider((ref) => LoginProvider(ref: ref));

class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.ref});
  Ref ref;

  bool _passVisible = false;
  bool _passRem = false;
  bool _loading = false;
  bool _showBackButton = true;

  bool get loading => _loading;
  bool get passVisible => _passVisible;
  bool get passRem => _passRem;
  bool get showBackButton => _showBackButton;

  set showBackButton(bool state) {
    _showBackButton = state;
    notifyListeners();
  }

  set passVisible(bool state) {
    _passVisible = state;
    notifyListeners();
  }

  set passRem(bool state) {
    _passRem = state;
    notifyListeners();
  }

  set loading(bool state) {
    _loading = state;
    notifyListeners();
  }

  Future<void> login(
    BuildContext context, {
    required String idNumber,
    required String password,
    bool routeAfter = true,
  }) async {
    loading = true;
    final loginRes = await locator.get<AuthRepository>().login(
          idNumber: idNumber.trim(),
          password: password.trim(),
        );

    if (loginRes.hasError()) {
      loading = false;

      SnackbarUtil.showErrorSnack(
        context,
        loginRes.error!.message,
      );
    } else {
      await locator.get<PreferenceRepository>().put(AppConstants.isLoggedIn, true);
      loading = false;

      if (routeAfter) {
        final user = loginRes.response as UserModel;
        await ref.read(appProvider).onLogin(user, context);

        if (user.data?.userType == UserEnum.ADMIN.name) {
          CustomNavigator.routeForEver(context, AdminHomePage.routeName);
        } else if (user.data?.userType == UserEnum.STUDENT.name) {
          ref.read(candidateExamProvider).fetchAllRegisteredCoursesForStudent(context);
          CustomNavigator.route(context, ExamSelectionScreen.routeName);
        } else if (user.data?.userType == UserEnum.EXAMINER.name) {
          CustomNavigator.route(context, ExaminerScreen.routeName);
        } else {
          SnackbarUtil.showErrorSnack(context, "Invalid user type");
        }
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    for (final repo in repositories) {
      await repo.clear(ref);
    }
    CustomNavigator.route(context, LoginScreen.routeName);
  }
}
