//import 'dart:async' show Future;

// Imports
//import 'utils.dart';

// App packages
//import 'FileServices.dart';

// Json serialize and de-serialize
//import 'package:json_annotation/json_annotation.dart';

//part 'users_store.g.dart';

import 'dart:convert';

class UsersStore {
  List<UserProfile> userProfile;
  UserMeta userMeta;

  UsersStore({this.userProfile, this.userMeta});

  factory UsersStore.fromJson(Map<String, dynamic> json) {
    List<UserProfile> userProfile;
    UserMeta _userMeta;

    print("1. UserStore => || $json ||");

    if (json['UserProfile'] != null) {
      print("users_store: map userprofile");
      userProfile = new List<UserProfile>();
      json['UserProfile'].forEach((v) {
        var a = new Map<String, dynamic>.from(v);
        userProfile.add(new UserProfile.fromJson(a));
      });
    } else {
      print("users_store: *** userProfile is null");
    }

    // using directly is result in error as:
    // '_InternalLinkedHashMap<dynamic, dynamic>' is not a subtype of type 'Map<String, dynamic>'
    if (json['UserMeta'] != null) {
      var a = new Map<String, dynamic>.from(json['UserMeta']);
      _userMeta = json['UserMeta'] != null
          //? new UserMeta.fromJson(json['UserMeta'])
          ? new UserMeta.fromJson(a)
          : null;
    } else {
      print('users_store: META: null');
      _userMeta = null;
    }
    print("1. eeeeeeeeeeeeeeeeeee ");
    return UsersStore(userMeta: _userMeta, userProfile: userProfile);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userProfile != null) {
      data['UserProfile'] = this.userProfile.map((v) => v.toJson()).toList();
    }
    if (this.userMeta != null) {
      data['UserMeta'] = this.userMeta.toJson();
    }
    return data;
  }

  factory UsersStore.init() {
    print("User init");
    return UsersStore(
        userMeta: UserMeta.init(), userProfile: [UserProfile.init()]);
  }
}

class UserProfile {
  String sUniqueID;
  String sInitials;
  String sName;
  String sAge;
  String sGender;
  String sCategory;
  String sGroup;
  String sInfo7;
  String sInfo8;
  String sInfo9;

  UserProfile(
      {this.sUniqueID,
      this.sInitials,
      this.sName,
      this.sAge,
      this.sGender,
      this.sCategory,
      this.sGroup,
      this.sInfo7,
      this.sInfo8,
      this.sInfo9});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    print("1. UserProfile fromJson => || $json ||");
    return UserProfile(
      sUniqueID: json['sUniqueID'] as String,
      sInitials: json['sInitials'] as String,
      sName: json['sName'] as String,
      sAge: json['sAge'] as String,
      sGender: json['sGender'] as String,
      sCategory: json['sCategory'] as String,
      sGroup: json['sGroup'] as String,
      sInfo7: json['sInfo7'] as String,
      sInfo8: json['sInfo8'] as String,
      sInfo9: json['sInfo9'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sUniqueID'] = this.sUniqueID;
    data['sInitials'] = this.sInitials;
    data['sName'] = this.sName;
    data['sAge'] = this.sAge;
    data['sGender'] = this.sGender;
    data['sCategory'] = this.sCategory;
    data['sGroup'] = this.sGroup;
    data['sInfo7'] = this.sInfo7;
    data['sInfo8'] = this.sInfo8;
    data['sInfo9'] = this.sInfo9;
    return data;
  }

  factory UserProfile.init() {
    print("UserProfile init");
    return UserProfile(
      sUniqueID: "",
      sInitials: "",
      sName: "",
      sAge: "",
      sGender: "",
      sCategory: "",
      sGroup: "",
      sInfo7: "",
      sInfo8: "",
      sInfo9: "",
    );
  }
}

class UserMeta {
  int iOneRecordSize;
  int iNameRowOffset;
  int iNameColIdx;
  int iVersionRow;
  int iVersionCol;
  int iSelectedUsersCount;
  int iActiveUserIdx;
  int iShowInfo;
  int iShowToast;
  String sToastMessage;

  UserMeta(
      {this.iOneRecordSize,
      this.iNameRowOffset,
      this.iNameColIdx,
      this.iVersionRow,
      this.iVersionCol,
      this.iSelectedUsersCount,
      this.iActiveUserIdx,
      this.iShowInfo,
      this.iShowToast,
      this.sToastMessage});

  factory UserMeta.fromJson(Map<String, dynamic> json) {
    print("1. meta meta ");
    return UserMeta(
      iOneRecordSize: json['iOneRecordSize'],
      iNameRowOffset: json['iNameRowOffset'],
      iNameColIdx: json['iNameColIdx'],
      iVersionRow: json['iVersionRow'],
      iVersionCol: json['iVersionCol'],
      iSelectedUsersCount: json['iSelectedUsersCount'],
      iActiveUserIdx: json['iActiveUserIdx'],
      iShowInfo: json['iShowInfo'],
      iShowToast: json['iShowToast'],
      sToastMessage: json['sToastMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iOneRecordSize'] = this.iOneRecordSize;
    data['iNameRowOffset'] = this.iNameRowOffset;
    data['iNameColIdx'] = this.iNameColIdx;
    data['iVersionRow'] = this.iVersionRow;
    data['iVersionCol'] = this.iVersionCol;
    data['iSelectedUsersCount'] = this.iSelectedUsersCount;
    data['iActiveUserIdx'] = this.iActiveUserIdx;
    data['iShowInfo'] = this.iShowInfo;
    data['iShowToast'] = this.iShowToast;
    data['sToastMessage'] = this.sToastMessage;
    return data;
  }

  // Init
  factory UserMeta.init() {
    print("Meta init: showToast: 0");
    return UserMeta(
      iOneRecordSize: 1,
      iNameRowOffset: 2,
      iNameColIdx: 3,
      iVersionRow: 4,
      iVersionCol: 5,
      iSelectedUsersCount: 6,
      iActiveUserIdx: 7,
      iShowInfo: 8,
      iShowToast: 0,
      sToastMessage: 'sToastMessage',
    );
  }

  //
  String get getToastMsg => sToastMessage;
  int get getShowToast => iShowToast;
}
