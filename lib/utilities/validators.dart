class FormValidators {
  static final FormValidators _instance = FormValidators._internal();
  factory FormValidators() => _instance;
  FormValidators._internal();

  String? validatePhone(String value) {
    RegExp pattern = RegExp(r'^[6-9]\d{9}$');

    if (value.isEmpty) {
      return ' Phone number is required';
    } else if (!pattern.hasMatch(value)) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }
}
