import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';
import 'package:moteis_go/core/data/network/models/request_states.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMotelsUsecases _usecases;

  HomeCubit({
    required GetMotelsUsecases usecases,
  })  : _usecases = usecases,
        super(
          const HomeState(),
        );

  Future<void> getMotels() async {
    if (state.motelsRequestState is MotelsLoadingState) return;

    emit(
      state.copyWith(motelsRequestState: const MotelsLoadingState()),
    );

    final result = await _usecases.invoke();
    result.fold(
      (exception) {
        Logger().d(exception.message);
      },
      (motelDataEntity) {
        emit(
          state.copyWith(
            motelDataEntity: motelDataEntity,
            motelsRequestState: const MotelsSuccessState(),
          ),
        );
      },
    );
  }
}
