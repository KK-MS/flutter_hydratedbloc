/*
 * File contains the common utils used by the store.
 */

int getKeyIndex(String strKey, List<String> keysHeaderRow) {
  return keysHeaderRow.indexWhere((element) =>
      element.trim().startsWith(strKey));
}

String getKeyValue(String strKey, int iIndex, List<List>parsedCSV) {
  // TODO: Header can be converted to string only once. Avoid multiple times.
  // convert a List<dynamic> parsedCSV[0] to List<String>
  /// NOTE: Header hsa to be string else we get exception as:
  // MxApp:Exception: In cars data read: type 'int' is not a subtype of type 'String'

  List<String> keysHeaderRow = List<String>.from(parsedCSV[0]);
  var iColIdx = getKeyIndex(strKey, keysHeaderRow);

  if (iColIdx < 0) {
    print("ERROR: No key: $strKey, in $keysHeaderRow");
    return "";
  }

  String strValue = parsedCSV[iIndex][iColIdx].toString().trim();
  return strValue;
}

