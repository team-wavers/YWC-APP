import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ywc_app/utils/get_current_position.dart';

class WebviewScreen extends StatelessWidget {
  WebviewScreen({super.key});

  static WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setUserAgent('webview')
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..addJavaScriptChannel(
        'LocationChannel',
        onMessageReceived: (JavaScriptMessage message){
         getCurrentPosition(message.message);
        }
    )
    ..loadRequest(Uri.parse('https://ywc.wavers.kr'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}