// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cbt_platform/modules/authentication/screens/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utilities/custom_navigator.dart';
import '../../../../utilities/helper_util.dart';
import '../../../../utilities/service_locator.dart';
import '../../../app_constants.dart';
import '../../db.dart';
import '../../repositories/preference_repository.dart';
import '../../repositories/user_repository.dart';
import '../models/user.model.dart';

ChangeNotifierProvider<AppProvider> appProvider = ChangeNotifierProvider((ref) => AppProvider(ref: ref));

class AppProvider extends ChangeNotifier {
  AppProvider({this.ref});
  Ref? ref;

  bool _isLogged = false;
  UserModel _user = UserModel();
  bool _canUseBiometrics = false;
  bool _sendPushNotification = false;
  bool _sendEmailNotification = false;

  UserModel get user => _user;
  bool get isLogged => _isLogged;
  bool get canUseBiometrics => _canUseBiometrics;
  bool get sendPushNotification => _sendPushNotification;
  bool get sendEmailNotification => _sendEmailNotification;

  set canUseBiometrics(bool state) {
    _canUseBiometrics = state;
    notifyListeners();
  }

  set sendPushNotification(bool state) {
    _sendPushNotification = state;
    notifyListeners();
  }

  set sendEmailNotification(bool state) {
    _sendEmailNotification = state;
    notifyListeners();
  }

  Future<void> initialise(BuildContext context) async {
    await locator.get<DbConfig>().init();
  }

  Future<void> goHome(BuildContext context) async {
    try {
      final rawUser = await locator.get<UserRepository>().getUser();
      if (rawUser != null) {
        _user = UserModel.fromJson(rawUser.userData);
      }
      Helpers.logc("logged in => $isLogged");
      if (isLogged) {
        // await ref!.read(profileProvider).fetchLoggedinUser(context, fromLogin: false);
      } else {
        CustomNavigator.routeForEver(context, LoginScreen.routeName);
      }
    } catch (e) {
      Helpers.logc(e.toString());
      resetUser();
      await locator.get<PreferenceRepository>().put(AppConstants.isLoggedIn, false);
      CustomNavigator.routeForEver(context, LoginScreen.routeName);
    }
  }

  Future<void> onLogin(
    UserModel user,
    BuildContext context, {
    bool shouldSetup = true,
  }) async {
    _user = user;
    if (shouldSetup) {
      setup(context);
    }
  }

  void setup(BuildContext context) {
    locator.get<AppProvider>()._user = _user;

    try {} catch (e) {
      Helpers.logc("here $e");
    }
  }

  void resetUser() {
    _isLogged = false;

    notifyListeners();
  }
}
