import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:port_tracker/ui/pages/login_page.dart';
import 'package:get_it/get_it.dart';
import 'package:port_tracker/application/events/location/send-location.event.dart';
import 'package:port_tracker/application/handlers/send-location-event-handler.dart';
import 'package:port_tracker/domain/interfaces/i-event-publisher.dart';
import 'package:port_tracker/infrastructure/services/grpc-event-publisher.dart';
import 'package:port_tracker/infrastructure/services/grpc-event-subscriber.dart';
import 'package:port_tracker/application/shared-state/app.state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final globalAppState = AppState();

  @override
  void initState() {
    super.initState();
    initialiseDependencies();
  }

  void initialiseDependencies() async {
    final publisher = GrpcEventPublisher();
    GetIt.I.registerSingleton<IEventPublisher>(publisher);

    final subscriber = GrpcEventSubscriber();

    subscriber.addSubscriber(
      SendLocationEvent.stream["topic"],
      SendLocationEvent.stream["action"],
      SendLocationEventHandler(globalAppState.chatList),
    );

    subscriber.listenForEvents();

    globalAppState.initialisationFinished();
  }

  @override
  Widget build(BuildContext context) {
    // Sets the application to always display in portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: globalAppState)
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Port Tracker',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Roboto'
      ),
      home: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          return LoginPage();
        }
      ),
    ),
    );
  }
}