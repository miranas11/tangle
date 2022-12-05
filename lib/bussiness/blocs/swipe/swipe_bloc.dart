// ignore: depend_on_referenced_packages
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangle/bussiness/blocs/auth/auth_bloc.dart';
import 'package:tangle/data/models/models.dart';
import 'package:tangle/data/repositories/database/database_repository.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final AuthBloc _authBloc;
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _authSubscription;
  SwipeBloc({
    required AuthBloc authBloc,
    required DatabaseRepository databaseRepository,
  })  : _authBloc = authBloc,
        _databaseRepository = databaseRepository,
        super(
          SwipeLoading(),
        ) {
    on<LoadUser>(_onLoadUser);
    on<UpdateHome>(_onUpdateHome);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);

    _authSubscription = _authBloc.stream.listen(
      (state) {
        if (state.status == AuthStatus.authenticated) {
          add(LoadUser(userId: state.user!.uid));
        }
      },
    );
  }

  void _onLoadUser(event, Emitter<SwipeState> emit) {
    _databaseRepository.getUsers(event.userId, 'Male').listen(
      (users) {
        add(UpdateHome(users: users));
      },
    );
  }

  FutureOr<void> _onUpdateHome(UpdateHome event, Emitter<SwipeState> emit) {
    if (event.users != null) {
      emit(SwipeLoaded(users: event.users!));
    } else {
      emit(SwipeError());
    }
  }

  void _onSwipeLeft(
    event,
    Emitter<SwipeState> emit,
  ) {
    final state = this.state;

    if (state is SwipeLoaded) {
      List<User> users = List.from(state.users)..remove(event.user);
      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    final state = this.state;

    if (state is SwipeLoaded) {
      List<User> users = List.from(state.users)..remove(event.user);
      if (users.isNotEmpty) {
        emit(SwipeLoaded(users: users));
      } else {
        emit(SwipeError());
      }
    }
  }

  @override
  Future<void> close() async {
    _authSubscription!.cancel();
    super.close();
  }
}
