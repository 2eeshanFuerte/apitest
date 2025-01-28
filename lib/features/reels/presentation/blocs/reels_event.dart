// Abstract class for all events related to the reels
abstract class ReelsEvent {}

// Specific event for loading reels
class LoadReelsEvent extends ReelsEvent {
  final int page;

  LoadReelsEvent({required this.page});
}
