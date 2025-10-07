import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../providers/privacy_policy_provider.dart';
import '../widgets/app_drawer.dart';


class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(privacyPolicyProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          WebViewWidget(controller: provider.webViewController),
          if (provider.loadingProgress < 100)
            LinearProgressIndicator(value: provider.loadingProgress / 100),
        ],
      ),
    );
  }
}
