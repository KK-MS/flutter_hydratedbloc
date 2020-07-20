// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
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

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'sUniqueID': instance.sUniqueID,
      'sInitials': instance.sInitials,
      'sName': instance.sName,
      'sAge': instance.sAge,
      'sGender': instance.sGender,
      'sCategory': instance.sCategory,
      'sGroup': instance.sGroup,
      'sInfo7': instance.sInfo7,
      'sInfo8': instance.sInfo8,
      'sInfo9': instance.sInfo9,
    };

UserMeta _$UserMetaFromJson(Map<String, dynamic> json) {
  return UserMeta(
    iNameRowOffset: json['iNameRowOffset'] as int,
    iOneRecordSize: json['iOneRecordSize'] as int,
    iNameColIdx: json['iNameColIdx'] as int,
    iVersionCol: json['iVersionCol'] as int,
    iVersionRow: json['iVersionRow'] as int,
    iSelectedUsersCount: json['iSelectedUsersCount'] as int,
    iActiveUserIdx: json['iActiveUserIdx'] as int,
    iShowInfo: json['iShowInfo'] as int,
    iShowToast: json['iShowToast'] as int,
    sToastMessage: json['sToastMessage'] as String,
  );
}

Map<String, dynamic> _$UserMetaToJson(UserMeta instance) => <String, dynamic>{
      'iOneRecordSize': instance.iOneRecordSize,
      'iNameRowOffset': instance.iNameRowOffset,
      'iNameColIdx': instance.iNameColIdx,
      'iVersionRow': instance.iVersionRow,
      'iVersionCol': instance.iVersionCol,
      'iSelectedUsersCount': instance.iSelectedUsersCount,
      'iActiveUserIdx': instance.iActiveUserIdx,
      'iShowInfo': instance.iShowInfo,
      'iShowToast': instance.iShowToast,
      'sToastMessage': instance.sToastMessage,
    };

UserModelCSV _$UserModelCSVFromJson(Map<String, dynamic> json) {
  return UserModelCSV(
    listUsers: (json['listUsers'] as List)
        ?.map((e) =>
            e == null ? null : UserProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserModelCSVToJson(UserModelCSV instance) =>
    <String, dynamic>{
      'listUsers': instance.listUsers,
    };

UsersStore _$UsersStoreFromJson(Map<String, dynamic> json) {
  return UsersStore(
    objUserData: json['objUserData'] == null
        ? null
        : UserModelCSV.fromJson(json['objUserData'] as Map<String, dynamic>),
    objUserMeta: json['objUserMeta'] == null
        ? null
        : UserMeta.fromJson(json['objUserMeta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersStoreToJson(UsersStore instance) =>
    <String, dynamic>{
      'objUserData': instance.objUserData,
      'objUserMeta': instance.objUserMeta,
    };
