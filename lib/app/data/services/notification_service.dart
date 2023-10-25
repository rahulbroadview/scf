// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../../../main.dart';
// import '../../config/firbase_config.dart';

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// /// Create a [AndroidNotificationChannel] for heads up notifications
// AndroidNotificationChannel channel = const AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   importance: Importance.high,
// );

// /// Define a top-level named handler which background/terminated messages will
// /// call.
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestorm,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
//   // logger.i('Handling a background message ${message.messageId}');
//   // logger.i('A new onMessageOpenedApp event was published! =>${message.data}');

//   // showNotification(message.data, false);
// }

// Map<String, dynamic>? dataFromNotification = {};
// bool isFlutterLocalNotificationsInitialized = false;

// class NotificationService {
//   Future<void> initialize() async {
//     if (!kIsWeb) {
//       if (isFlutterLocalNotificationsInitialized) {
//         logger.i("AlreadyInitilized");
//         return;
//       }

//       /// Create an Android Notification Channel.
//       ///
//       /// We use this channel in the `AndroidManifest.xml` file to override the
//       /// default FCM channel to enable heads up notifications.
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);

//       /// Update the iOS foreground notification presentation options to allow
//       /// heads up notifications.
//       await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//       isFlutterLocalNotificationsInitialized = true;
//       const AndroidInitializationSettings initializationSettingsAndroid =
//           AndroidInitializationSettings('@mipmap/ic_launcher');
//       DarwinInitializationSettings initializationSettingsIOS = const DarwinInitializationSettings();

//       final InitializationSettings initializationSettings = InitializationSettings(
//           android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//       await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//           onDidReceiveNotificationResponse: (details) => onSelectNotification);

//       FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//       FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
//         if (message != null) {
//           dataFromNotification = message.data;
//           _handleNavigationOnNotificationClick();
//         } else {
//           // logger.i("message null found => notification_type");
//         }
//       });

//       FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
//         // logger.w("Message received from source if you are not able to see the notification the please check notification permission from app settings");
//         RemoteNotification? notification = message?.notification;
//         AndroidNotification? android = message?.notification?.android;
//         dataFromNotification = message?.data;
//         if (notification != null && android != null && !kIsWeb) {
//           flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 // icon: 'drawable/ic_ketshop_notification',
//               ),
//             ),
//           );
//         }
//       });

//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         // logger.i('A new onMessageOpenedApp event was published!');
//         dataFromNotification = message.data;
//         _handleNavigationOnNotificationClick();
//       });
//     }
//   }

//   Future<String?> getToken() async {
//     try {
//       String? token = await FirebaseMessaging.instance.getToken();
//       assert(token != null);
//       return token ?? "";
//     } catch (e) {
//       // logger.i("from notification dart file line no 115==>${e.toString()}");
//     }
//     return null;
//   }

//   void onSelectNotification(String payload) {
//     _handleNavigationOnNotificationClick();
//   }

//   navigateToPendingScreen() {}

//   void _handleNavigationOnNotificationClick() {}
// }
