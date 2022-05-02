import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nit_quiz/modules/Login/cubit/cubit.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/home/HomeScreen.dart';
import 'package:nit_quiz/modules/sign_up/cubit/cubit.dart';
import 'package:nit_quiz/shared/bloc_observer.dart';
import 'package:nit_quiz/shared/components/constants.dart';
import 'package:nit_quiz/shared/local/cache_helper.dart';
import 'modules/home/cubit/cubit.dart';
import 'modules/quiz/quiz_finished/cubit/cubit.dart';
import 'modules/quiz/quiz_in_progress/cubit/cubit.dart';
import 'modules/quiz/start_quiz/cubit/cubit.dart';
import 'shared/local/applocal.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(()async {

      await CacheHelper.init();
      await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
      );
      Widget widget;
       uId = CacheHelper.getData(key: 'uId');
      if (uId != null) {
        widget = HomeScreen();
      } else {
        widget = LoginScreen();
      }

      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => SignUpCubit()),
        BlocProvider(create: (BuildContext context) => HomeCubit()),
        BlocProvider(create: (BuildContext context) => StartQuizCubit()),
        BlocProvider(create: (BuildContext context) => QuizProgressCubit()),
        BlocProvider(create: (BuildContext context) => QuizFinishedCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: startWidget,
        localizationsDelegates:const [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales:[
          Locale('en',''),
          Locale('ar',''),
        ] ,
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                CacheHelper.sharedPreferences!.setString("lang",currentLang.languageCode) ;
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
      ),
    );

  }
}
