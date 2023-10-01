import 'package:url_launcher/url_launcher.dart';

void launchInstagram() async {

  String instagramUrl = "https://instagram.com/flexingbags?igshid=MzRlODBiNWFlZA==";
  var instagramUri = Uri.parse(instagramUrl);
  if (await canLaunchUrl(instagramUri)) {
    await launchUrl(instagramUri);
  } else {
    throw 'Could not launch $instagramUrl';
  }
}
