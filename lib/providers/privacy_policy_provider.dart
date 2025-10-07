import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shahd_app/config/app_config.dart';


final privacyPolicyProvider =
    ChangeNotifierProvider<PrivacyPolicyNotifier>((ref) {
  return PrivacyPolicyNotifier();
});

class PrivacyPolicyNotifier extends ChangeNotifier {
  late final WebViewController webViewController;
  int loadingProgress = 0;

  PrivacyPolicyNotifier() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            loadingProgress = progress;
            notifyListeners();
          },
        ),
      )
      ..loadRequest(Uri.parse('${AppConfig.baseUrl}/privacy-policy'));
  }
}
