import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_quiz/consts/app_text_styles/onboarding_text_style.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueColor,
              AppColors.blackColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.2,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindRes(
                            res:
                                'https://docs.google.com/document/d/1bp_SWJImS5hP9RR9Ndoyaf8-6QCx9OoZo5_SvwTfsU0/edit?usp=sharing')));
              },
              child: ListTile(
                title: TextButton.icon(
                    onPressed: () {},
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    icon: SvgPicture.asset(
                      'assets/icons/tick_square.svg',
                      width: 26,
                      height: 26,
                      color: AppColors.lightBlueColor,
                    ),
                    label: Text(
                      'Privacy Policy',
                      style: OnboardingTextStyle.introduction,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindRes(
                            res:
                                'https://docs.google.com/document/d/1gkag2splOz27uwoi-4ldZ-i6nbGHZ1i9_aVzCX_88Io/edit?usp=sharing')));
              },
              child: ListTile(
                title: TextButton.icon(
                    onPressed: () {},
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    icon: SvgPicture.asset(
                      'assets/icons/chat.svg',
                      width: 26,
                      height: 26,
                      color: AppColors.lightBlueColor,
                    ),
                    label: const Text(
                      'Terms of use',
                      style: OnboardingTextStyle.introduction,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                InAppReview.instance.openStoreListing(
                  appStoreId: '6474238194',
                );
              },
              child: ListTile(
                title: TextButton.icon(
                    onPressed: () {},
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    icon: SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 26,
                      height: 26,
                      color: AppColors.lightBlueColor,
                    ),
                    label: Text(
                      'Rate app',
                      style: OnboardingTextStyle.introduction,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FindRes extends StatelessWidget {
  final String res;

  const FindRes({super.key, required this.res});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 0, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(res)),
      ),
    );
  }
}
