import 'package:equatable/equatable.dart';
import 'package:travelv2/backend/model/writer_model.dart';

class WriterStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends WriterStates {}

class LoadingState extends WriterStates {}

class FetchSuccess extends WriterStates {
  Writer? writer;
  FetchSuccess({ this.writer});
}

class ErrorState extends WriterStates {
  String message;
  ErrorState({required this.message});
}
