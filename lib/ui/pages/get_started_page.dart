import 'package:flutter/material.dart';
import 'package:kalkulator_imt/shared/theme.dart';
import 'package:kalkulator_imt/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/image_get_started.png',
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Mari Kita Raih\nBerat Badan Yang Ideal',
              style: greyTextSyle.copyWith(
                fontSize: 24,
                fontWeight: extraBold,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 80,
              ),
              title: 'Mulai',
              width: 220,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
