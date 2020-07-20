import 'dart:async';

// Store
import 'users_store.dart';

// BLoC includes
import 'package:bloc/bloc.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

// Events
import 'users_event.dart';

// File open
//import 'package:open_file/open_file.dart';

// Open CSV with excel.
import 'FileServices.dart';

class UserBloc extends HydratedBloc<UsersEvent, UsersStore> {
  // Check if Hydrated bloc has state restored or stor is null to reinitalize
  UserBloc() : super(UsersStore.init());

  @override
  UsersStore fromJson(Map<String, dynamic> json) {
    try {
      print("USER BLOC: fromJson $json");
      final _usersStore = UsersStore.fromJson(json);
      print("USER BLOC: fromJson try: $_usersStore");
      return _usersStore;
    }
    catch (e)
    //catch (_)
    {
      print("*** USER BLOC: fromJson nullllll e: ${e.toString()}");
      return null; // this will make the initialState null and thus reset will be called
      // i.e. UserBloc():super(super.state ?? UsersStore.init());
    }
  }

  @override
  Map<String, dynamic> toJson(UsersStore state) {
    print("*** USER BLOC: toJson state:$state");
    //return this.toJson(state);
    if (state != null) {
      return state.toJson();
    } else {
      return null; // returning null wlll not over write, but retains old data.
    }
  }

  // START OF BLoC MAPPING
  @override
  Stream<UsersStore> mapEventToState(UsersEvent event) async* {
    print("UserBloc mapEventToState ");
    UsersStore updateState = UsersStore(
      userMeta: state.userMeta,
      userProfile: state.userProfile,
    );


    if (event is UsersEventLoadFileData) {
      print("UserBloc UsersEventLoadFileData fsLoadUsersData");
      updateState = await fsLoadUsersData();
      print("After file load ..${updateState.userMeta}");
      yield updateState;


    } else if (event is UsersEventClear) {
      print("users_bloc: clear data");
      /// Clear the hydrated store?
      this.clear();
      updateState = UsersStore.init();
      yield updateState;

    } else if (event is UsersEventUpdateAge) {
      print("users_bloc: update age");
      String age = updateState.userProfile[0].sAge;

      if (age == "") {
        updateState.userProfile[0].sAge = "20";
      }

      if (age == "a") {
        updateState.userProfile[0].sAge = "20";
      }

      if (age == "20") {
        updateState.userProfile[0].sAge = "40";
      }

      if (age == "40") {
        updateState.userProfile[0].sAge = "100";
      }

      if (age == "100") {
        updateState.userProfile[0].sAge = "a";
      }

      yield updateState;
    } else {
      switch (event.eEvent) {
        case UsersEventEnum.init:
          updateState = await fsLoadUsersData();
          yield updateState;
          break;
        //   case UsersEventEnum.showUserInfo:
        //     updateState.objUserMeta.iShowInfo ^= 1;
        //     print("*** UserBloc: ${event.eEvent}, "
        //         "${updateState.objUserMeta.iShowInfo}");
        //     break;
        //   case UsersEventEnum.changeActiveUserIndex:
        //     updateState.objUserMeta.iActiveUserIdx = event.iUserIdx;
        //     break;
        //   case UsersEventEnum.toggleUserGroup:
        //     updateState.objUserMeta.iActiveUserIdx = event.iUserIdx;
        //     //updateState.toggleGroupNone(event.iUserIdx);
        //     break;
        //   case UsersEventEnum.selectShowUserInfo:
        //     updateState.objUserMeta.iActiveUserIdx = event.iUserIdx;
        //     updateState.objUserMeta.iShowInfo ^= 1;
        //     break;

        default:
      }
    }

    //yield updateState;
  }
}
