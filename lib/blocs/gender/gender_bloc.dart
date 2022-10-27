import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderState.initial()) {
    on<SetGenderEvent>(_setGender);
  }

  void _setGender(SetGenderEvent event, Emitter<GenderState> emitter) {
    emit(state.copyWith(tabTextIndexSelected: event.index));
  }
}
