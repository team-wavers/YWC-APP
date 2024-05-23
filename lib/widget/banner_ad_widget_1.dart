import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget1 extends StatefulWidget {
  /// The requested size of the banner. Defaults to [AdSize.banner].
  final AdSize adSize;

  /// The AdMob ad unit to show.
  ///
  final String adUnitId = Platform.isAndroid
  // Use this ad unit on Android...
      ? 'ca-app-pub-3883023077396286/4970093714'
      // 테스트 광고 코드
      //? 'ca-app-pub-3940256099942544/6300978111'
  // ... or this one on iOS.
      : 'ca-app-pub-3883023077396286/8389798662';

  BannerAdWidget1({
    super.key,
    this.adSize = AdSize.banner,
  });

  @override
  State<BannerAdWidget1> createState() => _BannerAdWidget1State();
}

class _BannerAdWidget1State extends State<BannerAdWidget1> {
  /// The banner ad to show. This is `null` until the ad is actually loaded.
  BannerAd? _bannerAd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.adSize.width.toDouble(),
      height: _bannerAd == null ? 0 : widget.adSize.height.toDouble(),
      child: _bannerAd == null
      // Nothing to render yet.
          ? const SizedBox()
      // The actual ad.
          : AdWidget(ad: _bannerAd!),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }



  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
              ad.dispose();
            return;
          }
          else {
            setState(() {
            _bannerAd = ad as BannerAd;
           });
          }
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          setState(() {
            ad.dispose();
          });
          return;
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }
}