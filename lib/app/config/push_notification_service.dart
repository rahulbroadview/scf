import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:pay_day_manager/app/modules/staffDashboard/views/staffDashboard_view.dart';
import 'package:pay_day_manager/app/modules/staffileslist/views/staaflist_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modules/adminfilelisting/views/adminfile_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
  showBadge: true,
);

/// Define a top-level named handler which background/terminated messages will
/// call.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("message------$message");
  await Firebase.initializeApp();
}

Map<String, dynamic> dataFromNotification = {};
bool isFlutterLocalNotificationsInitialized = false;

class NotificationService {
  static String? breedKeyName;
  static int? feedId;

  Future<String?> getToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      assert(token != null);
      return token!;
    } catch (e) {
      // print("from notification dart file line no 115==>${e.toString()}");
    }
    return null;
  }

  Future<void> initialize() async {
    if (isFlutterLocalNotificationsInitialized) {
      // print("AlreadyInitilized");
      return;
    }
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .createNotificationChannel(channel);
    }

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // DarwinInitializationSettings initializationSettingsIOS =
    //     const DarwinInitializationSettings();
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {
        print("=======================");
        dataFromNotification = jsonDecode(payload!);
        print("=======$dataFromNotification");
        _handleNavigationOnNotificationClick();
        print(payload);
      },
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message != null) {
        dataFromNotification = message.data;
        _handleNavigationOnNotificationClick();
      } else {}
    });
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      print("=======================");
      dataFromNotification = jsonDecode(details.payload!);
      print("=======$dataFromNotification");
      _handleNavigationOnNotificationClick();
      print(details.payload);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("---message......");
      print(message.data);
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      dataFromNotification = message.data;
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          payload: jsonEncode(message.data),
          NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  color: ConstColor.buttonColor),
              iOS: const DarwinNotificationDetails()),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      dataFromNotification = message!.data;
      _handleNavigationOnNotificationClick();
    });
  }

  // void onSelectNotification(String payload) {
  //   print("**********");
  //   print("nooooooooo");
  //   _handleNavigationOnNotificationClick();
  // }

  void _handleNavigationOnNotificationClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("====####");
    print(dataFromNotification);
    if (dataFromNotification['type'] == 1.toString()) {
      if (prefs.getString('userType') == 'staff') {
        Get.offAll(const StaffFileListView());
      } else {
        Get.offAll(const AdminFileListView());
      }
    } else {
      if (prefs.getString('userType') == 'staff') {
        Get.offAll(const StaffDashboardView());
      } else {
        Get.offAll(const DashboardView());
      }
    }
  }
}
