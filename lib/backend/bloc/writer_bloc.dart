import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/backend/model/writer_model.dart';
import 'package:travelv2/backend/repo/writer_repo.dart';

enum WriterAction { Fetch, Delete }

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

class WriterBloc {
  var writerIdController = 0;
  final _stateStreamController = StreamController<Writer>();
  StreamSink<Writer> get _writerSink => _stateStreamController.sink;
  Stream<Writer> get writerStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<WriterAction>();
  StreamSink<WriterAction> get eventSink => _eventStreamController.sink;
  Stream<WriterAction> get _eventStream => _eventStreamController.stream;

  WriterBloc() {
    final WriterRepository _repository = new WriterRepository();

    _eventStream.listen((event) async {
      if (event == WriterAction.Fetch) {
        try {
          // ignore: unused_local_variable
          var wrtiterBlc = await _repository.getWriterID(writerIdController);
          //    log("this her name" + wrtiterBlc.writerName);
          _writerSink.add(wrtiterBlc);
        } on Exception catch (e) {
          _writerSink.addError("Something went wrong");
        }
      }
    });
  }
}
