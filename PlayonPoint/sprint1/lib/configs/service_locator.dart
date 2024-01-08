import 'package:map_mvvm/app/service_locator.dart';
import 'package:sprint1/features/setting/setting_viewmodel.dart';
import 'package:sprint1/models/user_model.dart';
import 'package:sprint1/services/news/news_service.dart';
import 'package:sprint1/services/news/news_service_memory.dart';
import '../features/profile/profile_viewmodel.dart';
import '../features/home/home_viewmodel.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_memory.dart';

final locator = ServiceLocator.locator;

void initilizeServiceLocator() {
  locator.registerLazySingleton<UserService>(() => UserServiceMemory());
  locator.registerLazySingleton<NewsService>(() => NewsServiceMemory());

  locator.registerFactory<HomeViewModel>(() => HomeViewModel(passUser: User()));
  locator.registerFactory<ProfileViewModel>(
      () => ProfileViewModel(passUser: User()));
  locator.registerFactory<SettingViewModel>(
      () => SettingViewModel(passUser: User()));
  //locator.registerFactory<LoginViewModel>(() => LoginViewModel(viewModel: LoginViewModel(UserServiceMemory())));
}
