import 'package:advanced_flutter/blocs/auth_blocs/auth_bloc.dart';
import 'package:advanced_flutter/blocs/navigator_blocs/navigator_bloc.dart' as navigator_bloc;
import 'package:advanced_flutter/blocs/notifications_blocs/notification_bloc.dart';
import 'package:advanced_flutter/blocs/themes_blocs/themes_bloc.dart';
import 'package:advanced_flutter/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKeys = GlobalKey<NavigatorState>(); // Flutter's NavigatorState

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ThemesBloc()),
        BlocProvider(create: (BuildContext context) => navigator_bloc.NavigatorBloc()),
        BlocProvider(create: (BuildContext context) => AuthBloc()),
        BlocProvider(create: (BuildContext context) => NotificationBloc())
      ],
      child: const MyAppContent(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    // This context now has access to ThemesBloc
    return MaterialApp(
      title: 'FlutterBase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.select((ThemesBloc bloc) => bloc.state.themeMode),
      home: const HomePage(),
    );
  }
}
