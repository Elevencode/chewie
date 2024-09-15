extension NullableStringExt on String? {
  Uri? get toUri => this != null ? Uri.parse(this!) : null;
}

extension StringExt on String {
  Uri get toUri => Uri.parse(this);
}
