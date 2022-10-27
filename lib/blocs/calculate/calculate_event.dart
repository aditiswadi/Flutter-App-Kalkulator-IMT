part of 'calculate_bloc.dart';

abstract class CalculateEvent extends Equatable {
  const CalculateEvent();

  @override
  List<Object> get props => [];
}

class CalculateBmiEvent extends CalculateEvent {
  final int gender;
  final int age;
  final double height;
  final double weight;
  CalculateBmiEvent({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  List<Object> get props => [gender, age, height, weight];
}
