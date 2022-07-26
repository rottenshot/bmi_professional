import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero/views/home_screen.dart';
import 'package:zero/styles/themes.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';
import 'network/local_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDarkCached = CacheHelper.getBool(key: 'isDark')??false;
  runApp(MyApp(isDarkCached));
}
class MyApp extends StatelessWidget {
  final isDarkCached;
  const MyApp(this.isDarkCached, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..themeToggle(isDarkCached: isDarkCached),
      child: BlocConsumer<AppCubit,AppStates>(
        builder: (context,state) {
          return MaterialApp(
            themeMode: AppCubit.get(context).isDark? ThemeMode.light : ThemeMode.dark,
            darkTheme: darkTheme,
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
        listener: (context,state){},
      ),
    );
  }
}
