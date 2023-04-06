import 'package:dio/dio.dart';

import '../enums/regex_type.dart';

extension StringExtensions on String {
  String get capitalize {
    final array = split(" ");
    String returnString = array[0];
    if (array.length > 1) {
      returnString = array
          .map((e) => "${e[0].toUpperCase()}${e.substring(1).toLowerCase()}")
          .join(" ");
      return returnString;
    }
    returnString =
        "${array[0][0].toUpperCase()}${array[0].substring(1).toLowerCase()}";
    return returnString;
  }

  String get fileExtension => split(".").last;
  String get filePath => split("/").last;
  Future<MultipartFile> get toMultiPartFile async =>
      await MultipartFile.fromFile(this,
          filename: "${DateTime.now().toString()}.$fileExtension");

  String get pageName {
    final list = split("\"");
    final string = list[1];
    final finalString = string.trim();
    return finalString;
  }

  bool get isNetworkPath {
    if (contains("http") || contains("https")) {
      return true;
    }
    return false;
  }
}

extension ValidationExtensions on String {
  String? hasMinLengthOf(int minLength) => length >= minLength
      ? null
      : "This field must contain at least $minLength characters.";

  String? isValidMail({String? errorMessage}) =>
      RegexType.eMail.regex.hasMatch(this)
          ? null
          : (errorMessage ?? "Please enter a valid e-mail address");

  String? hasData({String? fieldName, String? errorText}) =>
      isNotEmpty ? null : (errorText ?? "$fieldName is required");
}
