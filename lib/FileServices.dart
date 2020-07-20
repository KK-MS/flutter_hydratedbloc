import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:csv/csv.dart';

// STORE
import 'users_store.dart';

// for _read() & _save()
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// To open a file with external app.
import 'package:open_file/open_file.dart';

// Load the file
//
// Generic function used by other load functions
//
// Note: File type is latin1
// i.e. In VIM conversion :set fileencoding=latin1
//      In Notepad++ it is UTF-8, but in VIM is not result special chars
Future<String> _loadAppCsvDataAsset(String filenameWithPath) async {
  print("Before csv loadstring....$filenameWithPath");
  return await rootBundle.loadString(filenameWithPath);
}

// Load users

// Read the users file and store in the UserStore
Future<UsersStore> fsLoadUsersData1() async {
  //String csvPage = await _loadAppCsvDataAsset('assets/csv/users/users_prj_01.csv');
  String csvPage = await _loadAppCsvDataAsset('assets/csv/users/users.csv');
  List<List<dynamic>> parsedListCSV =
      const CsvToListConverter().convert(csvPage);
  UsersStore objUserStore; // = new UsersStore.getDataCSV(parsedListCSV);
  return objUserStore;
}

Future<UsersStore> fsLoadUsersData() async {
  String jsonData1 = ''' { 
	"UserMeta": {
		"iOneRecordSize": 10,
		"iNameRowOffset": 0,
		"iNameColIdx": 1,
		"iVersionRow": 0,
		"iVersionCol": 2,
		"iSelectedUsersCount": 0,
		"iActiveUserIdx": 0,
		"iShowInfo": 0,
		"iShowToast": 0,
		"sToastMessage": "msg"
	}
} 
  
  ''';
  String jsonData = ''' { 
    "UserProfile": [{ 
    "sUniqueID": "x12",
    "sInitials": "a",
    "sName": "a",
    "sAge": "a",
    "sGender": "a",
    "sCategory": "a",
    "sGroup": "a",
    "sInfo7": "a",
    "sInfo8": "a",
    "sInfo9": "a"
	}],
	"UserMeta": {
		"iOneRecordSize": 10,
		"iNameRowOffset": 0,
		"iNameColIdx": 1,
		"iVersionRow": 0,
		"iVersionCol": 2,
		"iSelectedUsersCount": 0,
		"iActiveUserIdx": 0,
		"iShowInfo": 0,
		"iShowToast": 0,
		"sToastMessage": "msg"
	}
} 
  
  ''';

  UsersStore objUserStore = new UsersStore.fromJson(json.decode(jsonData));
  return objUserStore;
}
// https://pusher.com/tutorials/local-data-flutter

saveFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/my_file.csv');
  final text = 'Hello, World!\n second, 22,';
  await file.writeAsString(text);
  print('saved');
}

saveToReportFile(String dataString) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/Result_Evaluation_LKAS.csv');
  await file.writeAsString(dataString, mode: FileMode.write);
  print('saved');
}

appendToReportFile(String dataString) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/Result_Evaluation_LKAS.csv');
  await file.writeAsString(dataString, mode: FileMode.append);
  print('appedn');
}

saveDoubleArrayToFile(List<List<dynamic>> dataRowCol) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/Result_Evaluation_LKAS.csv');

  String dataString = "";
  print("##############");
  dataRowCol.forEach((dataRow) {
    // dynamic to string conversion not required, as 'join' return string
    dataString += dataRow.join(',');
    dataString += '\n';
  });
  print(dataString);
  print("##############");

  //final text = 'Hello, World!\n second, 22,';
  //await file.writeAsString(text);

  await file.writeAsString(dataString);
  print('saved');
}

// Open a file with external app, e.g. CSV with excel.
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  print(directory.path);
  return directory.path;
}

Future<void> openReportFile() async {
  String msg;
  try {
    //print("In OpenReportFile start --");
    final path = await _localPath;
    final fileOpen = await OpenFile.open(
      '$path/Result_Evaluation_LKAS.csv',
    );
    //print("In openReportFile end --");
    return fileOpen;
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}

Future<void> openFile() async {
  String msg;
  try {
    print("In OpenFile start --");
    //String csvPage = await _loadAppCsvDataAsset();
    //final message = await OpenFile.open(csvPage);

    final path = await _localPath;
    //final message = await OpenFile.open('$path/assets/csv/QA_EN.csv');
    final message = await OpenFile.open(
      '$path/Result_Evaluation_LKAS.csv',
    );

    //msg = message.toString();
    print(msg);
    print("In OpenFile end --");
  } catch (e) {
    // If encountering an error, return 0
  }
}
