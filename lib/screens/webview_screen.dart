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
        onProgress: (int progress) {
          // Update loading bar. //추가 예정
        },
        onPageStarted: (String url) {}, //시작페이지
        onWebResourceError: (WebResourceError error) {
          //에러났을 때
        },

        //페이지 이동 허용
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
         getCurrentPositon(message.message);
        }
    )
    ..loadRequest(Uri.parse('https://ywc.dev.wavers.kr'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}