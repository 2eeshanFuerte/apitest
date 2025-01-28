import 'package:apitest/features/reels/data/repositories/reel_repository.dart';
import 'package:apitest/features/reels/data/repositories/reel_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void setup() {
  // Register the HTTP client
  sl.registerLazySingleton(() => http.Client());

  // Register the ReelRepository implementation
  sl.registerLazySingleton<ReelRepository>(() => ReelRepositoryImpl(sl()));
}
