import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pay_day_manager/app/core/constant/size_constant.dart';
import 'package:pay_day_manager/app/core/them/const_color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/config/push_notification_service.dart';
import 'app/routes/app_pages.dart';

String fcmToken = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ConstColor.color1E3F84, // status bar color
  ));
  runApp(const MyApp());
}

String? customerId;
String? staffId;

enum CalendarViews { dates, months, year }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initializeNotificationSettings() async {
    NotificationService firebaseService = NotificationService();
    await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    debugPrint(
        '---------- initializeNotificationSettings splash -------------');
    fcmToken = (await firebaseService.getToken())!;
    print('-----fcmToken-----$fcmToken');
    var status = await Permission.notification.status;
    if (status.isDenied) {
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      } else {}
    } else if (status.isLimited) {
    } else if (status.isRestricted) {
    } else {
      // openAppSettings();
    }
    Future.delayed(const Duration(milliseconds: 200), () async {
      await firebaseService.initialize();
    });
  }

  @override
  void initState() {
    super.initState();
    initializeNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: MediaQueryData.fromView(WidgetsBinding.instance.window).size,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          builder: EasyLoading.init(),
          getPages: AppPages.routes,
          theme: ThemeData(
                  colorScheme: const ColorScheme.light().copyWith(
                      primary: ConstColor.color1E3F84,
                      secondary: ConstColor.color1E3F84),
                  fontFamily: "Poppins")
              .copyWith(
            scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(ConstColor.color1E3F84),
              trackColor: MaterialStateProperty.all(ConstColor.trackColor),
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                  fontSize: textSize40Px,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Poppins"),
              labelMedium:
                  const TextStyle(fontFamily: "Poppins", color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
