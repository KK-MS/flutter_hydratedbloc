import 'dart:async' show Future;

// Imports
import 'utils.dart';

// App packages
import 'FileServices.dart';

// Json serialize and de-serialize
import 'package:json_annotation/json_annotation.dart';

part 'users_store.g.dart';

/*
 * UserProfile for individual user info
 */
//@JsonSerializable(nullable: false, explicitToJson: true)
//@JsonSerializable(nullable: false)
@JsonSerializable()
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

  UserProfile({
    this.sUniqueID,
    this.sInitials,
    this.sName,
    this.sAge,
    this.sGender,
    this.sCategory,
    this.sGroup,
    this.sInfo7,
    this.sInfo8,
    this.sInfo9,
  });

  // JSON: From & To
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  factory UserProfile.init() {
    return UserProfile(
      sUniqueID: "12",
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

  factory UserProfile.parseUsersRecord(int iIndex, List<List> parsedCSV) {
    return UserProfile(
      sUniqueID: getKeyValue("ID", iIndex, parsedCSV),
      sGroup: "none",
      sInitials: getKeyValue("Initials", iIndex, parsedCSV),
      sName: getKeyValue("Name", iIndex, parsedCSV),
      sAge: getKeyValue("Age", iIndex, parsedCSV),
      sGender: getKeyValue("Gender", iIndex, parsedCSV),
      sCategory: getKeyValue("Category", iIndex, parsedCSV),
    );
  }
}

/*
 * UserMeta to hold in-house status
 */
//@JsonSerializable(nullable: false)
@JsonSerializable()
//@JsonSerializable(nullable: false, explicitToJson: true)
class UserMeta {
  // App init variables
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

  UserMeta({
    this.iNameRowOffset,
    this.iOneRecordSize,
    this.iNameColIdx,
    this.iVersionCol,
    this.iVersionRow,
    this.iSelectedUsersCount,
    this.iActiveUserIdx,
    this.iShowInfo,
    this.iShowToast,
    this.sToastMessage,
  });

  // JSON: From
  factory UserMeta.fromJson(Map<String, dynamic> json) =>
      _$UserMetaFromJson(json);
  // JSON: T0
  Map<String, dynamic> toJson() => _$UserMetaToJson(this);

  // Init / reset values
  factory UserMeta.init() {
    return UserMeta(
      iOneRecordSize: 10,
      iNameColIdx: 1,
      iVersionRow: 0,
      iVersionCol: 2,
      iSelectedUsersCount: 0,
      iActiveUserIdx: 0,
      iShowInfo: 0,
      iShowToast: 0,
      sToastMessage: "",
    );
  }

  // getters
  int get getShowToast => iShowToast;
}

//@JsonSerializable(nullable: false)
@JsonSerializable()

///@JsonSerializable(nullable: false, explicitToJson: true)
class UserModelCSV {
  List<UserProfile> listUsers;
  UserModelCSV({
    this.listUsers,
  });

  factory UserModelCSV.init() {
    return UserModelCSV(listUsers: [UserProfile.init()]);
  }

  // JSON: From
  //factory UserModelCSV.fromJson(Map<String, dynamic>json) => _$UserModelCSVFromJson(json);
  factory UserModelCSV.fromJson(Map<String, dynamic> json) {
    print("###>>> UserModelCSV.fromJson call-3");
    print("###<<< UserModelCSV. $json");
    return _$UserModelCSVFromJson(json);
  }

  // JSON: T0
  //Map<String, dynamic> toJson() => _$UserModelCSVToJson(this);
  Map<String, dynamic> toJson() {
    print("###>>> UserModelCSVToJson");
    return _$UserModelCSVToJson(this);
  }
}

/*
 * UsersStore main
 */
//@JsonSerializable(nullable: false)
@JsonSerializable()
//@JsonSerializable(nullable: false, explicitToJson: true)
class UsersStore {
  final UserModelCSV objUserData; // Survey Data
  final UserMeta objUserMeta;

  UsersStore({
    this.objUserData,
    this.objUserMeta,
  });

  // JSON: From
  //factory UsersStore.fromJson(Map<String, dynamic>json) => _$UsersStoreFromJson(json);
  factory UsersStore.fromJson(Map<String, dynamic> json) {
    print("###>>> UserStore.fromJson call-1");
    return _$UsersStoreFromJson(json);
  } //=> _$UsersStoreFromJson(json);

  // JSON: T0
  //Map<String, dynamic> toJson(UsersStore state) => _$UsersStoreToJson(state);
  //Map<String, dynamic> toJson() => _$UsersStoreToJson(this);
  Map<String, dynamic> toJson() {
    print("###>>> UserStore.toJson");
    return _$UsersStoreToJson(this);
  } //=> _$UsersStoreToJson(this);

  factory UsersStore.init() {
    print(" %%%%%%%%%%%%%%%%%%%% UserStore.init");
    return UsersStore(
      objUserData: UserModelCSV.init(),
      objUserMeta: UserMeta.init(),
    );
  }

  Future<UsersStore> loadFromFile() async {
    return fsLoadUsersData();
  }
}
