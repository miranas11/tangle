// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tangle/data/models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUser>(_onLoadUser);
    on<SwipeLeft>(onSwipeLeft);
    on<SwipeRight>(onSwipeRight);
  }

  void _onLoadUser(event, Emitter<SwipeState> emit) {
    emit(SwipeLoaded(users: event.users));
  }

  void onSwipeLeft(event, Emitter<SwipeState> emit) {
    final state = this.state;
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }

  void onSwipeRight(event, Emitter<SwipeState> emit) {
    final state = this.state;
    if (state is SwipeLoaded) {
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }
}
