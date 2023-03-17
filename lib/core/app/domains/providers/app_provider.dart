// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utilities/helper_util.dart';
import '../../../../utilities/service_locator.dart';
import '../../db.dart';
import '../../repositories/user_repository.dart';

ChangeNotifierProvider<AppProvider> appProvider =
    ChangeNotifierProvider((ref) => AppProvider(ref: ref));

class AppProvider extends ChangeNotifier {
  AppProvider({this.ref});
  Ref? ref;

  bool _isLogged = false;
  bool _canUseBiometrics = false;
  bool _sendPushNotification = false;
  bool _sendEmailNotification = false;

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
        // _user = User.fromJson(rawUser.userData);
      }
      // if (isLogged) {
      //   // await ref!.read(profileProvider).fetchLoggedinUser(context, fromLogin: false);
      //   await Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     DashboardNavPage.routeName,
      //     (route) => false,
      //   );
      // } else {
      //   CustomNavigator.routeForEver(context, WelcomeScreen.routeName);
      // }
    } catch (e) {
      Helpers.logc(e.toString());
      resetUser();
      // await locator.get<PreferenceRepository>().put(AppConstants.isLoggedIn, false);
      //   CustomNavigator.routeForEver(context, WelcomeScreen.routeName);
    }
  }

  void setup(BuildContext context) {
    try {} catch (e) {
      Helpers.logc("here $e");
    }
  }

  void resetUser() {
    _isLogged = false;

    notifyListeners();
  }
}
