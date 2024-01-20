extension StringExtensions on String {
  String hardcoded() {
    return this;
  }

  String capitalized() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
