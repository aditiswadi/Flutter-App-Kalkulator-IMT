import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(CalculateState.initial()) {
    on<CalculateBmiEvent>(_calculate);
  }

  Future<void> _calculate(
      CalculateBmiEvent event, Emitter<CalculateState> emit) async {
    try {
      emit(state.copyWith(calculateStatus: CalculateStatus.loading));
      emit(
        state.copyWith(
          gender: event.gender,
          age: event.age,
          height: event.height,
          weight: event.weight,
        ),
      );
      double height = state.height / 100;
      double bmi = state.weight / (height * height);
      if (bmi < 18.5) {
        emit(state.copyWith(
          results: bmi,
          status: 'Berat Badan Kurang',
          bmiStatus: BmiStatus.kekurangan,
        ));
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        emit(state.copyWith(
          results: bmi,
          status: 'Berat Badan Ideal',
          bmiStatus: BmiStatus.ideal,
        ));
      } else if (bmi >= 25.0 && bmi <= 29.0) {
        emit(state.copyWith(
          results: bmi,
          status: 'Berat Badan Berlebih',
          bmiStatus: BmiStatus.berlebih,
        ));
      } else if (bmi > 30) {
        emit(state.copyWith(
          results: bmi,
          status: 'Obesitas',
          bmiStatus: BmiStatus.obesitas,
        ));
      }
      emit(state.copyWith(calculateStatus: CalculateStatus.succes));
    } catch (e) {
      emit(state.copyWith(calculateStatus: CalculateStatus.error));
    }
  }
}
