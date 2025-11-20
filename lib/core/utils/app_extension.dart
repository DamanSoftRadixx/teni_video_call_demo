import 'package:flutter/material.dart';

extension StringExtension on String {
  String get toCapital {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension IntegetExtension on int? {
  bool get success {
    if (this == 200 || this == 201 || this == 204) {
      return true;
    }
    return false;
  }
}

extension GeneralExtension<T> on T {
  bool get isEnum {
    final split = toString().split('.');
    return split.length > 1 && split[0] == runtimeType.toString();
  }

  String get getEnumString => toString().split('.').last.toCapital;
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) {
    return Iterable.generate(length).map((i) => f(i, elementAt(i)));
  }
}

extension MapExtension on Map {
  String get format {
    if (isEmpty) {
      return "";
    } else {
      var firstKey = entries.first.key;
      var mapValues = entries.first.value;
      return "?$firstKey=$mapValues";
    }
  }
}

//Helper functions
void pop(BuildContext context, int returnedLevel) {
  for (var i = 0; i < returnedLevel; ++i) {
    Navigator.pop(context, true);
  }
}

extension SafeStringConversion on String? {
  /// Safely convert to nullable trimmed string
  String? toStringConversion() {
    final value = this?.trim();
    if (value == null || value.toLowerCase() == 'null' || value.isEmpty) {
      return null;
    }
    return value;
  }

  /// Safely convert to int (handles "100", "100.0", "₹1,000", etc.)
  int toIntConversion() {
    final value = this?.trim() ?? '';
    if (value.isEmpty || value.toLowerCase() == 'null') return 0;

    // Remove non-numeric characters except dot and minus
    final cleaned = value.replaceAll(RegExp(r'[^\d\.\-]'), '');
    final parsed = double.tryParse(cleaned);
    return parsed?.toInt() ?? 0;
  }
  // int toIntConversion() {
  //   var string = this ?? "";
  //   var afterRemovingMinusSign = string.replaceAll("-", "");
  //   // Check if the string is numeric or contains a decimal point
  //   if (string.isNotEmpty && string != "null" && (RegExp(r'^-?[0-9]*$').hasMatch(afterRemovingMinusSign) || afterRemovingMinusSign.contains('.'))) {
  //     double parsedValue = double.tryParse(string) ?? 0;
  //     return parsedValue.toInt();
  //   }
  //   return 0;
  // }

  /// Safely convert to double
  double toDoubleConversion() {
    final value = this?.trim() ?? '';
    if (value.isEmpty || value.toLowerCase() == 'null') return 0.0;

    final cleaned = value.replaceAll(RegExp(r'[^\d\.\-]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  // double toDoubleConversion() {
  //   var string = this ?? "";
  //   if (string.isNotEmpty && string != "null" && RegExp(r'^-?d+(.d+)?$|^-?d+.$').hasMatch(string)) {
  //    return double.parse(string.endsWith('.') ? string + '0' : string);
  //   }
  //   return 0.0;
  // }
  /// Safely convert to DateTime
  DateTime? toSafeDateTime() {
    final value = this?.trim();
    if (value == null || value.isEmpty || value.toLowerCase() == 'null') {
      return null;
    }

    try {
      return DateTime.tryParse(value);
    } catch (_) {
      return null;
    }
  }
}
