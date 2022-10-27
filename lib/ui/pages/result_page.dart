import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_imt/blocs/calculate/calculate_bloc.dart';
import 'package:kalkulator_imt/shared/theme.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    colorStatus() {
      if (context.read<CalculateBloc>().state.bmiStatus ==
          BmiStatus.kekurangan) {
        return kOrangeColor;
      } else if (context.read<CalculateBloc>().state.bmiStatus ==
          BmiStatus.ideal) {
        return kGreenColor;
      } else if (context.read<CalculateBloc>().state.bmiStatus ==
          BmiStatus.berlebih) {
        return kOrangeColor;
      } else if (context.read<CalculateBloc>().state.bmiStatus ==
          BmiStatus.obesitas) {
        return kRedColor;
      }
    }

    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.results!.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: bold,
                              color: kWhiteColor,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            state.status!.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: extraBold,
                              color: colorStatus(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
