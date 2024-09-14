const fieldValidationMsg = "is required";

class FormValidator {
  static dynamic validateText({
    required String? value,
    String field = "Field",
  }) {
    if (value!.isEmpty) {
      return "$field $fieldValidationMsg";
    }
    return null;
  }
}
