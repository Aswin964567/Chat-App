import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  FirebaseMessagingService() {
    _setupFCM();
    _setupLocalNotifications();
  }

  void _setupFCM() {
    // Request permissions for iOS
    _firebaseMessaging.requestPermission();

    // Handle messages while app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message while in foreground: ${message.notification?.title}');
      _showLocalNotification(message); // Display notification locally
    });

    // Handle background message
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    // Handle notification click when the app is opened
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked: ${message.notification?.title}');
      // Handle any logic when notification is tapped
    });
  }

  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    print('Handling background message: ${message.notification?.title}');
  }

  void _setupLocalNotifications() {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Show local notification
  void _showLocalNotification(RemoteMessage message) {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'default', // Channel ID
        'Default', // Channel Name
        channelDescription: 'This is the default notification channel', // Named argument
        importance: Importance.max,
        priority: Priority.high,
      );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  _flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title,
    message.notification?.body,
    notificationDetails,
  );
}

}
