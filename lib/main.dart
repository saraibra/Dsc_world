import 'package:dsc_world_app/screens/splash_screen.dart';
import 'package:dsc_world_app/shared/cubit/cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/states.dart';
import 'package:dsc_world_app/shared/network/cashe_helper.dart';
import 'package:dsc_world_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // this method for making sure that async methods started before runing app
  await CasheHelper.init();
  bool? isDark = CasheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({Key? key, required this.isDark}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitDown,
   DeviceOrientation.portraitUp,
]);
    return MultiBlocProvider(
      providers: [
      
        BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..changeAppMode(sharedValue: isDark)),
            BlocProvider(create: (BuildContext context) =>DataCubit(),)
      ],
      child: 
        BlocConsumer<AppCubit, DscWorldStates>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'DSC World',
                theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      bodyText2: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      headline1: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    appBarTheme: AppBarTheme(
                        titleSpacing: 20,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        titleTextStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        iconTheme: IconThemeData(color: Colors.black),
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark)),
                    primarySwatch: Colors.deepOrange,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.deepOrange,
                        elevation: 20)),
                darkTheme: ThemeData(
                    canvasColor: black,
                    scaffoldBackgroundColor: black,
                    appBarTheme: AppBarTheme(
                        backgroundColor: black,
                        elevation: 0,
                        titleSpacing: 20,
                        titleTextStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        iconTheme: IconThemeData(color: Colors.white),
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: black,
                            statusBarIconBrightness: Brightness.light)),
                    primarySwatch: Colors.deepOrange,
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      headline1: TextStyle(fontSize: 14, color: Colors.white),
                      bodyText2: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        backgroundColor: black,
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.deepOrange,
                        unselectedItemColor: Colors.grey,
                        elevation: 20)),
                themeMode: AppCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: SplashScreen(
                  isDark: isDark,
                ),
              );
            },
            listener: (context, state) {}),
      
    );
  }
}
