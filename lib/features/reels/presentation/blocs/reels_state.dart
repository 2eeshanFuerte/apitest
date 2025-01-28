import 'package:equatable/equatable.dart';
import '../../data/models/reel_model.dart';

// Base class for Reels states
abstract class ReelsState extends Equatable {
  const ReelsState();

  @override
  List<Object> get props => [];
}

// Initial state: No data loaded
class ReelsInitial extends ReelsState {}

// Loading state: Data is being fetched
class ReelsLoading extends ReelsState {}

// Loaded state: Data has been successfully fetched
class ReelsLoaded extends ReelsState {
  final List<ReelModel> reels;
  final bool hasMore;

  const ReelsLoaded({
    required this.reels,
    required this.hasMore,
  });

  @override
  List<Object> get props => [reels, hasMore];
}

// Error state: If something went wrong while fetching the data
class ReelsError extends ReelsState {
  final String message;

  const ReelsError({required this.message});

  @override
  List<Object> get props => [message];
}
