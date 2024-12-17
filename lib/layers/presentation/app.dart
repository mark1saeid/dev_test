import 'package:dev_test/layers/presentation/auth/cubit/login_cubit.dart';
import 'package:dev_test/layers/presentation/auth/login_screen.dart';
import 'package:dev_test/layers/presentation/create/cubit/create_cubit.dart';
import 'package:dev_test/layers/presentation/home/cubit/home_cubit.dart';
import 'package:dev_test/layers/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(),
          ),
          BlocProvider<CreateCubit>(
            create: (context) => CreateCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Personal Scheduler',
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/home': (context) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
