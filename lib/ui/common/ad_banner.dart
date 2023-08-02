import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tabichizu/data/constants/environments.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({
    super.key,
    required this.size,
  });

  final AdSize size;

  @override
  Widget build(BuildContext context) {
    final androidAdvertisementId = dotenv.env[adMobAndroidAdvertisementId];
    final iosAdvertisementId = dotenv.env[adMobIosAdvertisementId];

    final banner = androidAdvertisementId == null || iosAdvertisementId == null
        ? null
        : BannerAd(
            size: size,
            adUnitId: Platform.isAndroid
                ? androidAdvertisementId
                : iosAdvertisementId,
            listener: BannerAdListener(
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
              },
              onAdClosed: (ad) {
                ad.dispose();
              },
            ),
            request: const AdRequest(),
          )
      ?..load();

    return banner == null
        ? const SizedBox()
        : SizedBox(
            width: banner.size.width.toDouble(),
            height: banner.size.height.toDouble(),
            child: AdWidget(ad: banner),
          );
  }
}
