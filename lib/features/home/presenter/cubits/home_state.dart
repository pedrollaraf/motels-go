part of 'home_cubit.dart';

class HomeState extends Equatable {
  final MotelDataEntity? motelDataEntity;
  final RequestStates motelsRequestState;

  const HomeState({
    this.motelDataEntity,
    this.motelsRequestState = const MotelsInitialState(),
  });

  @override
  List<Object?> get props {
    return [motelDataEntity, motelsRequestState];
  }

  HomeState copyWith({
    MotelDataEntity? motelDataEntity,
    RequestStates? motelsRequestState,
  }) {
    return HomeState(
      motelDataEntity: motelDataEntity ?? this.motelDataEntity,
      motelsRequestState: motelsRequestState ?? this.motelsRequestState,
    );
  }
}

class MotelsSuccessState extends RequestStates {
  const MotelsSuccessState();
}

class MotelsLoadingState extends RequestStates {
  const MotelsLoadingState();
}

class MotelsInitialState extends RequestStates {
  const MotelsInitialState();
}

class MotelsFailureState extends RequestStates {
  final String? message;

  const MotelsFailureState({this.message});
}
