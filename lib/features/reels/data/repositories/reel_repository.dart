import '../models/reel_model.dart';

abstract class ReelRepository {
  /// Fetches a list of reels from the API.
  /// 
  /// Accepts [page] and [limit] for pagination.
  Future<List<ReelModel>> fetchReels({
    required int page,
    required int limit,
  });
}
