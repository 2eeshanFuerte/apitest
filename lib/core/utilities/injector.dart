import 'package:apitest/features/reels/data/repositories/reel_repository.dart';
import 'package:apitest/features/reels/data/repositories/reel_repository_impl.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // Initialize the GetIt instance

void init() {
  // Register ReelRepository and its implementation
  sl.registerLazySingleton<ReelRepository>(() => ReelRepositoryImpl(sl()));

  // Register other dependencies like the BLoC
  sl.registerFactory(() => ReelsBloc(reelRepository: sl()));
}
