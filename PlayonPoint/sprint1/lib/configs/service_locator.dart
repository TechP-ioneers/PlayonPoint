import 'package:map_mvvm/app/service_locator.dart';
import 'package:sprint1/models/user.dart';
import '../features/profile/profile_viewmodel.dart';
import '../features/home/home_viewmodel.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_memory.dart';

final locator = ServiceLocator.locator;

void initilizeServiceLocator() {
  locator.registerLazySingleton<UserService>(() => UserServiceMemory());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ProfileViewModel>(() => ProfileViewModel(passUser: User()));
}
