//import 'dart:math';
import 'package:flutter/material.dart';

// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'users_bloc.dart';

enum UsersEventEnum {
  none,
  init,
  toggleUserGroup,
  changeActiveUserIndex,
  showUserInfo,
  selectShowUserInfo,
//enum UserAction{USER_VIEW, USER_ADD, USER_EDIT, USER_REMOVE}
}

class UsersEventInit extends UsersEvent {}

class UsersEventLoadFileData extends UsersEvent {}
class UsersEventUpdateAge extends UsersEvent {}
class UsersEventClear extends UsersEvent {}

class UsersEvent {
  /// Events
  final UsersEventEnum eEvent;

  /// Parameters
  int iUserIdx;

  UsersEvent({
    this.eEvent,
    this.iUserIdx,
  });

  factory UsersEvent.init() {
    return UsersEvent(
      // Event
      eEvent: UsersEventEnum.none,
      iUserIdx: 1,
    );
  }

  // Events without parameters
  //void incrementAnswer(BuildContext context) {
  //  dispatchEnum(context, UserEventEnum.incrementAnswer);
  //}

  //void decrementAnswer(BuildContext context) {
  //  dispatchEnum(context, UserEventEnum.decrementAnswer);
  //}
  // Events without parameters
  void showUserInfo(BuildContext context, int iUserIdx) {
    UsersEvent objEvent = UsersEvent(
      iUserIdx: iUserIdx,
      eEvent: UsersEventEnum.showUserInfo,
    ); // create event
    dispatchParam(context, objEvent);
  }

  // Events with parameters

  void selectShowUserInfo(BuildContext context, int iQIdx) {
    UsersEvent objEvent = UsersEvent(
      iUserIdx: iQIdx,
      eEvent: UsersEventEnum.selectShowUserInfo,
    ); // create event
    dispatchParam(context, objEvent);
  }

  void changeActiveUserIndex(BuildContext context, int iUserIdx) {
    UsersEvent objEvent = UsersEvent(
      iUserIdx: iUserIdx,
      eEvent: UsersEventEnum.changeActiveUserIndex,
    ); // create event
    dispatchParam(context, objEvent);
  }

  void toggleUserGroup(BuildContext context, int iQIdx) {
    UsersEvent objEvent = UsersEvent(
      iUserIdx: iQIdx,
      eEvent: UsersEventEnum.toggleUserGroup,
    ); // create event
    dispatchParam(context, objEvent);
  }

  // Dispatch event with the parameters
  void dispatchParam(BuildContext context, UsersEvent objEvent) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(objEvent); // Send event
  }
}
