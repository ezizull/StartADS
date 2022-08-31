import 'package:equatable/equatable.dart';
import 'package:startercode_project/api/api.dart';

abstract class PaketState extends Equatable {
  const PaketState();

  @override
  List<Object> get props => [];
}

class PaketInitial extends PaketState {}

class PaketLoading extends PaketState {}

class ExpiredPaket extends PaketState {}

class HavePaket extends PaketState {
  const HavePaket(this.data);

  // dummy data
  final String data;

  @override
  List<Object> get props => [data];
}

class HasPurchasedPaket extends PaketState {}

class PurchasePaket extends PaketState {}

class AvailablePaket extends PaketState {}

class PaketFailure extends PaketState {
  final ErrorType type;
  final String message;

  const PaketFailure({this.type = ErrorType.general, this.message = ""});

  const PaketFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  const PaketFailure.general(String message)
      : this(type: ErrorType.general, message: message);

  @override
  List<Object> get props => [type, message];
}