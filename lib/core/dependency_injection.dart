import 'package:get_it/get_it.dart';
import '../data/repos/service_repo.dart';
import '../ui/viewmodels/home_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Repositories
  getIt.registerLazySingleton(() => ServiceRepository());

  // ViewModels
  getIt.registerFactory(() => HomeViewModel(getIt<ServiceRepository>()));
}