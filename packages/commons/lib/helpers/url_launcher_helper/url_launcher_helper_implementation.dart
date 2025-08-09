import 'dart:developer';
import 'package:commons/helpers/url_launcher_helper/url_launcher_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelperImplementation implements UrlLauncherHelper {
  @override
  Future<bool> launchURL(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        return true;
      } else {
        log('Could not launch $uri');
        return false;
      }
    } catch (e) {
      log('$e');
      return false;
    }
  }
}
