part of 'calculate_bloc.dart';

enum CalculateStatus {
  initial,
  loading,
  succes,
  error,
}

enum BmiStatus {
  kekurangan,
  ideal,
  berlebih,
  obesitas,
}

class CalculateState extends Equatable {
  final CalculateStatus? calculateStatus;
  final BmiStatus? bmiStatus;
  final int gender;
  final int age;
  final double height;
  final double weight;
  final double? results;
  final String? status;
  CalculateState({
    this.calculateStatus,
    this.bmiStatus,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    this.results,
    this.status,
  });

  @override
  List<Object?> get props {
    return [
      calculateStatus,
      bmiStatus,
      gender,
      age,
      height,
      weight,
      results,
      status,
    ];
  }

  factory CalculateState.initial() {
    return CalculateState(
        calculateStatus: CalculateStatus.initial,
        results: 0.0,
        status: '',
        gender: 0,
        age: 0,
        height: 0.0,
        weight: 0.0);
  }

  @override
  String toString() {
    return 'CalculateState(calculateStatus: $calculateStatus, bmiStatus: $bmiStatus, gender: $gender, age: $age, height: $height, weight: $weight, results: $results, status: $status)';
  }

  CalculateState copyWith({
    CalculateStatus? calculateStatus,
    BmiStatus? bmiStatus,
    int? gender,
    int? age,
    double? height,
    double? weight,
    double? results,
    String? status,
  }) {
    return CalculateState(
      calculateStatus: calculateStatus ?? this.calculateStatus,
      bmiStatus: bmiStatus ?? this.bmiStatus,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      results: results ?? this.results,
      status: status ?? this.status,
    );
  }
}
