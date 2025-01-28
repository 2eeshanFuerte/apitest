import '../repositories/reel_repository.dart';
import '../../data/models/reel_model.dart';

class GetReelsUseCase {
  final ReelRepository repository;

  GetReelsUseCase(this.repository);

  Future<List<ReelModel>> call(int page) {
    return repository.getReels(page: page);
  }
}
