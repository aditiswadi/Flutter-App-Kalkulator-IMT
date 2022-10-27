part of 'gender_bloc.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();

  @override
  List<Object> get props => [];
}

class SetGenderEvent extends GenderEvent {
  final int index;
  SetGenderEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'SetGenderEvent(index: $index)';
}
