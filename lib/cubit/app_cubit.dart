import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero/cubit/app_states.dart';
import 'package:zero/network/local.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
 static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = true;

   themeToggle ({isDarkCached}){
    if(isDarkCached!=null)
     {
      isDark = isDarkCached;
      emit(ThemeModeToggleState());
     } else {
     isDark =! isDark;
     CacheHelper.setBool(key: 'isDark', value: isDark);
     emit(ThemeModeToggleState());
    }
  }
}