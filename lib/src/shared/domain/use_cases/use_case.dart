import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  call(Params params);
}

abstract class Params extends Equatable {}

abstract class NoParams extends Params {
  @override
  List<Object> get props => [];
}
