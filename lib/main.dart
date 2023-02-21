import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/cubit.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/states.dart';
import 'package:mobi_care/modules/chat_details/cubit/cubit.dart';
import 'package:mobi_care/modules/login/login_screen.dart';
import 'package:mobi_care/shared/bloc_observer.dart';
import 'modules/splash/splash_screen.dart';
import 'shared/components/constants.dart';
import 'shared/styles/themes.dart';
import 'shared/network/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData( key: 'isDark');



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientLayoutCubit()..getChats(),
        ),
        BlocProvider(
            create: (context) => ChatMessagesCubit(),
        ),
      ],
      child: BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
