import 'package:apitest/features/reels/data/models/reel_model.dart';
import 'package:apitest/features/reels/data/repositories/api_service.dart';

import '../../domain/repositories/reel_repository.dart';

class ReelRepositoryImpl implements ReelRepository {
  final ApiService apiService;

  ReelRepositoryImpl(this.apiService);

  @override
  Future<List<ReelModel>> getReels({required int page}) async {
    final data = await apiService.fetchReels(page: page);
    return (data['data'] as List)
        .map((item) => ReelModel.fromJson(item))
        .toList();
  }
}
