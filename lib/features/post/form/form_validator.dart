class FormValidator {
  FormValidator._();

  /// title: 20文字以内
  static String? validateTitle(String? value) {
    final emptyText = _validateNotEmptyText(value);
    if (emptyText != null) {
      return emptyText;
    }
    if (value!.length > 20) {
      return '20文字以内で入力しましょう';
    }
    return null;
  }

  /// description: 200文字以内
  static String? validateDescription(String? value) {
    final emptyText = _validateNotEmptyText(value);
    if (emptyText != null) {
      return emptyText;
    }
    if (value!.length > 200) {
      return '200文字以内で入力しましょう';
    }
    return null;
  }

  static String? _validateNotEmptyText(String? value) {
    if (value!.isEmpty) {
      return 'テキストを入力しましょう';
    }
    return null;
  }
}
