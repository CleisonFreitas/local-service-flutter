abstract class BaseState {}

class BaseInitial extends BaseState {}

class BaseLoading extends BaseState {}

class BaseSuccess extends BaseState {
  final String message;
  BaseSuccess(this.message);
}

class BaseLoaded extends BaseState {
  final dynamic object;
  BaseLoaded(this.object);
}

class BaseFailure extends BaseState {
  final String message;
  BaseFailure(this.message);
}
