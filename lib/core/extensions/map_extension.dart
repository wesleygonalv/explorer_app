import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';

extension MapExtension on Map {
  String? getString(String prop, {String? defaultValue}) {
    dynamic value = defaultValue;
    if (containsKey(prop)) {
      if (this[prop] != null) {
        if (this[prop] is String) {
          String? transformedValue = this[prop];
          if (transformedValue == 'undefined' || transformedValue == 'null') {
            _logParseError(this[prop], prop, 'String');
          } else {
            value = transformedValue;
          }
        } else {
          _logParseError(this[prop], prop, 'String');
        }
      }
    }
    return value;
  }

  bool getBool(String prop, {bool? defaultValue = false}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] is bool) {
        value = this[prop];
      } else {
        bool? transformedValue =
            bool.tryParse(this[prop], caseSensitive: false);
        if (transformedValue == null && defaultValue != null) {
          _logParseError(this[prop], prop, 'bool');
        } else if (transformedValue != null) {
          value = transformedValue;
        }
      }
    }
    return value;
  }

  num? getNum(String prop, {num? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] is num) {
        value = this[prop];
      } else {
        num? transformedValue = num.tryParse(this[prop].toString());
        if ((transformedValue == null || transformedValue.isNaN) &&
            defaultValue == null) {
          _logParseError(this[prop], prop, 'num');
        } else if (transformedValue != null) {
          value = transformedValue;
        }
      }
    }
    return value;
  }

  double? getDouble(String prop, {double? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] is double) {
        value = this[prop];
      } else {
        double? transformedValue = double.tryParse(this[prop].toString());
        if ((transformedValue == null || transformedValue.isNaN) &&
            defaultValue == null) {
          _logParseError(this[prop], prop, 'double');
        } else if (transformedValue != null) {
          value = transformedValue;
        }
      }
    }
    return value;
  }

  int? getInt(String prop, {int? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] is int) {
        value = this[prop];
      } else {
        int? transformedValue = int.tryParse(this[prop].toString());
        if ((transformedValue == null || transformedValue.isNaN) &&
            defaultValue == null) {
          _logParseError(this[prop], prop, 'int');
        } else if (transformedValue != null) {
          value = transformedValue;
        }
      }
    }
    return value;
  }

  DateTime? getDateTime(
    String prop, {
    DateTime? defaultValue,
    DateFormat? formatter,
  }) {
    dynamic value = defaultValue;
    if (containsKey(prop)) {
      if (this[prop] != null) {
        if (this[prop] is DateTime) {
          value = this[prop];
        } else if (this[prop] is String) {
          String rawValue = this[prop];
          formatter ??= DateFormat('yyyy-MM-ddThh:mm:ss.ssssZ');
          value = formatter.parse(rawValue);
        } else if (defaultValue == null) {
          _logParseError(this[prop], prop, 'DateTime');
        }
      }
    }
    return value;
  }

  Jiffy? getJiffy(String prop, {Jiffy? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] != null) {
        if (this[prop] is DateTime) {
          value = Jiffy.parseFromDateTime(this[prop]);
        } else if (this[prop] is Jiffy) {
          value = this[prop];
        } else if (defaultValue == null) {
          _logParseError(this[prop], prop, 'Jiffy');
        }
      }
    }
    return value;
  }

  Map<T, R>? getMap<T, R>(String prop, {Map? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      value = this[prop];
      try {
        value = Map.from(value);
      } catch (error, stackTrace) {
        _logParseError(value, prop, 'Map', stackTrace);
        value = defaultValue;
      }
    }
    return value;
  }

  List<T>? getList<T>(String prop, {List<T>? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      if (this[prop] is List<T>?) {
        return this[prop];
      } else {
        try {
          value = List<T>.from(this[prop]);
        } catch (error, stackTrace) {
          _logParseError(value, prop, 'List', stackTrace);
          value = defaultValue;
        }
      }
    }
    return value;
  }

  T? getObject<T>(String prop, {T? defaultValue}) {
    dynamic value = defaultValue;

    if (containsKey(prop)) {
      return this[prop];
    }
    return value;
  }

  void _logParseError(dynamic value, String prop, String type,
      [StackTrace? stackTrace]) {
    Logger().e(
      'An error occurred while get a $type from $prop',
      time: DateTime.now(),
      error: FormatException(value ?? 'Null'),
      stackTrace: stackTrace,
    );
  }

  /// Checks if the map contains the given [key] and the associated value is not `null`.
  /// If the value is a [Map], it also ensures the map is not empty.
  ///
  /// Returns `true` if the map contains the [key] and its value is not `null`.
  /// If the value is a [Map], it returns `true` only if the map is empty.
  /// Otherwise, returns `false`.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {
  ///   'a': 1,
  ///   'b': null,
  ///   'c': {},
  ///   'd': {'key': 'value'}
  /// };
  ///
  /// print(map.containsKeyAndValue('a')); // true
  /// print(map.containsKeyAndValue('b')); // false
  /// print(map.containsKeyAndValue('c')); // true
  /// print(map.containsKeyAndValue('d')); // true
  /// print(map.containsKeyAndValue('e')); // false
  /// ```
  ///
  /// - Parameter key: The key to check in the map.
  /// - Returns: `true` if the map contains the [key] and the associated value is not `null`
  ///   or, if the value is a [Map], if the map is empty. Otherwise, `false`.
  bool containsKeyAndValue(Object? key) {
    bool hasValue = containsKey(key) && this[key] != null;
    if (hasValue && this[key] is Map) {
      return hasValue && (this[key] as Map).entries.isNotEmpty;
    }
    return hasValue;
  }
}
