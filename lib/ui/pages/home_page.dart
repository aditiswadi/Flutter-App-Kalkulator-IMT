import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:kalkulator_imt/blocs/calculate/calculate_bloc.dart';
import 'package:kalkulator_imt/blocs/gender/gender_bloc.dart';
import 'package:kalkulator_imt/shared/theme.dart';
import 'package:kalkulator_imt/ui/widgets/custom_button.dart';
import 'package:kalkulator_imt/ui/widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    int _tabTextIndexSelected =
        context.read<GenderBloc>().state.tabTextIndexSelected;

    int _gender = context.read<GenderBloc>().state.tabTextIndexSelected;
    int _age = 0;
    double _height = 0.0;
    double _weight = 0.0;

    void _submit() {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });

      final form = _formKey.currentState;

      if (form == null || !form.validate()) return;

      form.save();

      context.read<CalculateBloc>().add(CalculateBmiEvent(
            gender: _gender,
            age: _age,
            height: _height,
            weight: _weight,
          ));
    }

    Widget gender() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: FlutterToggleTab(
          width: 85,
          borderRadius: 18,
          height: 100,
          selectedIndex: _tabTextIndexSelected,
          selectedBackgroundColors: [kPrimaryColor],
          selectedTextStyle: whiteTextSyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
          unSelectedTextStyle: blackTextSyle.copyWith(
            fontSize: 14,
            fontWeight: medium,
          ),
          labels: ['Laki-laki', 'Perempuan'],
          selectedLabelIndex: (index) {
            setState(() {
              context.read<GenderBloc>().add(SetGenderEvent(index: index));
            });
          },
          isScroll: false,
        ),
      );
    }

    Widget inputSection() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  title: 'Usia',
                  hintText: 'Masukan Usia',
                  onchanged: (age) {
                    _age = int.parse(age);
                  },
                ),
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    'Tahun',
                    style: blackTextSyle.copyWith(fontWeight: reguler),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  title: 'Tinggi Badan',
                  hintText: 'Masukan Tinggi Badan',
                  onchanged: (height) {
                    _height = double.parse(height);
                  },
                ),
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    'CM',
                    style: blackTextSyle.copyWith(fontWeight: reguler),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  title: 'Berat Badan',
                  hintText: 'Masukan Berat Badan',
                  onchanged: (weight) {
                    _weight = double.parse(weight);
                  },
                ),
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    'KG',
                    style: blackTextSyle.copyWith(fontWeight: reguler),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Center(
        child: BlocConsumer<CalculateBloc, CalculateState>(
          listener: (context, state) {},
          builder: (context, state) {
            return CustomButton(
              title: 'Hitung',
              width: 287,
              onPressed: () {
                if (_age <= 0 || _height <= 0 || _weight <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kBackgroundColor,
                      content: Text(
                        'FORM INPUT TIDAK BOLEH\nKOSONG ATAU BERNILAI 0 !',
                        style: redTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  _submit();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/result', (route) => false);
                }
              },
              margin: EdgeInsets.only(
                top: 50,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: ListView(
              children: [
                gender(),
                inputSection(),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
