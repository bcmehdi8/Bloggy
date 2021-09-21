import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/backend/events/writer_events.dart';
import 'package:travelv2/backend/model/writer_model.dart';
import 'package:travelv2/backend/repo/writer_repo.dart';
import 'package:travelv2/backend/states/writer_states.dart';

class WriterBlocc extends Bloc<WriterEvents, WriterStates> {
  int writerIdController = 1;
  WriterRepository _repository;
  WriterBlocc(WriterStates initialState, this._repository)
      : super(initialState);

  @override
  Stream<WriterStates> mapEventToState(WriterEvents event) async* {
    if (event is getWriterCard) {
      yield LoadingState();
      try {
        var writer = await _repository.getWriterID(writerIdController);
        yield FetchSuccess(writer: writer);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}