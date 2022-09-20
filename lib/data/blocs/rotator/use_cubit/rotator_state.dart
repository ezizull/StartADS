import 'package:Scriptmatic/api/api.dart';
import 'package:equatable/equatable.dart';

abstract class RotatorState extends Equatable {
  const RotatorState();

  @override
  List<Object> get props => [];
}

class RotatorInitial extends RotatorState {}

class RotatorLoading extends RotatorState {}

class RotatorLoaded extends RotatorState {
  const RotatorLoaded({
    this.isiPesan = '',
    this.pilihScript = const {},
    required this.listCS,
    required this.listProduct,
  });

  // isi pesan
  final String isiPesan;

  // script popular
  final List<Map> listCS;

  // script terbaru
  final List<dynamic> listProduct;

  final Map pilihScript;

  @override
  List<Object> get props => [isiPesan, listCS, listProduct, pilihScript];
}

class RotatorFailure extends RotatorState {
  final ErrorType type;
  final String message;

  const RotatorFailure({this.type = ErrorType.general, this.message = ""});

  const RotatorFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const RotatorFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}
