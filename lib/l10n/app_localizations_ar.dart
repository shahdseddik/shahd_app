// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterEmail => 'أدخل البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get posts => 'المقالات';

  @override
  String get createPost => 'إنشاء مقال';

  @override
  String get title => 'العنوان';

  @override
  String get body => 'المحتوى';

  @override
  String get submit => 'إرسال';

  @override
  String get failedToCreatePost => 'فشل في إنشاء المقال';

  @override
  String get postCreated => 'تم إنشاء المقال!';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get system => 'النظام';

  @override
  String get english => 'الانجليزية';

  @override
  String get arabic => 'العربية';
}
