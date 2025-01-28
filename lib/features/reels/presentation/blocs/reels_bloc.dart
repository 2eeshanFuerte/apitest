import 'package:apitest/features/reels/presentation/blocs/reels_event.dart';
import 'package:apitest/features/reels/presentation/blocs/reels_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/reel_repository.dart';
import '../../data/models/reel_model.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final ReelRepository reelRepository;

  ReelsBloc({required this.reelRepository}) : super(ReelsInitial());

  @override
  Stream<ReelsState> mapEventToState(ReelsEvent event) async* {
    if (event is LoadReelsEvent) {
      yield ReelsLoading(); // Use the concrete state
      try {
        final List<ReelModel> reels =
            await reelRepository.fetchReels(page: event.page, limit: 10);
        yield ReelsLoaded(reels: reels, hasMore: reels.isNotEmpty);
      } catch (error) {
        yield ReelsError(message: error.toString());
      }
    }
  }
}
