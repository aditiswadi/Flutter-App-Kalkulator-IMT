part of 'gender_bloc.dart';

class GenderState extends Equatable {
  final int tabTextIndexSelected;
  GenderState({
    required this.tabTextIndexSelected,
  });

  factory GenderState.initial() {
    return GenderState(tabTextIndexSelected: 0);
  }

  @override
  List<Object?> get props => [tabTextIndexSelected];

  @override
  String toString() =>
      'GenderState(tabTextIndexSelected: $tabTextIndexSelected)';

  GenderState copyWith({
    int? tabTextIndexSelected,
  }) {
    return GenderState(
        tabTextIndexSelected:
            tabTextIndexSelected ?? this.tabTextIndexSelected);
  }
}
