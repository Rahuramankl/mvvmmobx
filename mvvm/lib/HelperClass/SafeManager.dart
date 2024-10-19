class SafeManager {
  // Safely parse an integer from JSON
  static int? parseInt(Map<String, dynamic> json, String key) {
    return json[key] is int ? json[key] as int : int.tryParse(json[key]?.toString() ?? '');
  }

  // Safely parse a string from JSON
  static String? parseString(Map<String, dynamic> json, String key) {
    return json[key]?.toString();
  }

  // Safely parse a boolean from JSON
  static bool? parseBool(Map<String, dynamic> json, String key) {
    var value = json[key];
    if (value is bool) {
      return value;
    }
    if (value is String) {
      return value.toLowerCase() == 'true';
    }
    if (value is int) {
      return value == 1;
    }
    return null;
  }
}