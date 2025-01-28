import '../../data/models/reel_model.dart';

abstract class ReelRepository {
  Future<List<ReelModel>> getReels({required int page});
}
