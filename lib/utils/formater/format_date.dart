import 'dart:core';

import 'models/model_date.dart';

class FormatDate {
  final List<ModelDate> _month = [
    ModelDate(number: "1", text: "Januari"),
    ModelDate(number: "2", text: "Februari"),
    ModelDate(number: "3", text: "Maret"),
    ModelDate(number: "4", text: "April"),
    ModelDate(number: "5", text: "Mei"),
    ModelDate(number: "6", text: "Juni"),
    ModelDate(number: "7", text: "Juli"),
    ModelDate(number: "8", text: "Agustus"),
    ModelDate(number: "9", text: "September"),
    ModelDate(number: "10", text: "Oktober"),
    ModelDate(number: "11", text: "November"),
    ModelDate(number: "12", text: "Desember"),
  ];

  String dateToString(String value) {
    var dateSplit = value.split(" ");
    var date = dateSplit[0].split("-");
    var time = dateSplit[1].split(".");

    var month = _month.firstWhere((element) => element.number == date[1]);

    return "${date[2]} ${month.text} ${date[0]}, ${time[0]}";
  }
}
