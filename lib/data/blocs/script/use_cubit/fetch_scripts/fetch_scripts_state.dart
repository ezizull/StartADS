import 'package:equatable/equatable.dart';
import 'package:Scriptmatic/api/api.dart';

abstract class FetchScriptsState extends Equatable {
  const FetchScriptsState();

  @override
  List<Object> get props => [];
}

class FetchScriptsInitial extends FetchScriptsState {}

class FetchScriptsLoading extends FetchScriptsState {}

class FetchScriptsSuccess extends FetchScriptsState {
  const FetchScriptsSuccess(this.data);

  // dummy data
  final String data;

  @override
  List<Object> get props => [data];
}

class FetchScriptsFailure extends FetchScriptsState {
  final ErrorType type;
  final String message;

  const FetchScriptsFailure({this.type = ErrorType.general, this.message = ""});

  const FetchScriptsFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const FetchScriptsFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
