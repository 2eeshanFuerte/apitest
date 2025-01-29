import 'package:apitest/features/reels/data/repositories/reel_repository.dart';
import 'package:apitest/features/reels/data/repositories/reel_repository_impl.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; // Initialize the GetIt instance

void init() {
  // sl.registerLazySingleton<http.Client>(() => http.Client());

  // // Register ReelRepository and its implementation
  // sl.registerLazySingleton<ReelRepository>(() => ReelRepositoryImpl(sl()));

  // // Register other dependencies like the BLoC
  // sl.registerFactory(() => ReelsBloc(reelRepository: sl()));

  // sl.registerFactory(() => ReelsBloc(reelRepository: sl()));
  if (!sl.isRegistered<http.Client>()) {
    sl.registerLazySingleton<http.Client>(() => http.Client());
  }

  // Register Repository
  if (!sl.isRegistered<ReelRepository>()) {
    sl.registerLazySingleton<ReelRepository>(() => ReelRepositoryImpl(sl()));
  }

  // Register Bloc only if not already registered
  if (!sl.isRegistered<ReelsBloc>()) {
    sl.registerFactory(() => ReelsBloc(reelRepository: sl()));
  }
}
