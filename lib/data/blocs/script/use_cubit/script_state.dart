// ignore_for_file: non_constant_identifier_names

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:Scriptmatic/api/api.dart';

abstract class ScriptState extends Equatable {
  const ScriptState();

  @override
  List<Object> get props => [];
}

class ScriptInitial extends ScriptState {}

class ScriptLoading extends ScriptState {}

class ScriptLoaded extends ScriptState {
  const ScriptLoaded(
      {required this.scriptPopular, required this.scriptTerbaru});

  // script popular
  final List<Map> scriptPopular;

  // script terbaru
  final List<Map> scriptTerbaru;

  @override
  List<Object> get props => [scriptPopular, scriptTerbaru];
}

class ScriptFailure extends ScriptState {
  final ErrorType type;
  final String message;

  const ScriptFailure({this.type = ErrorType.general, this.message = ""});

  const ScriptFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const ScriptFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
