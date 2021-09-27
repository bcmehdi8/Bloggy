// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelv2/backend/events/category_events.dart';
import 'package:travelv2/backend/repo/category_repo.dart';
import 'package:travelv2/backend/states/category_states.dart';
import 'package:travelv2/config/constants.dart';

class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  CategoryRepository _repository;
  String categoryName = "";
  CategoryBloc(CategoryState initialState, this._repository)
      : super(initialState);

  @override
  Stream<CategoryState> mapEventToState(CategoryEvents event) async* {
    if (event is FetchCategoryList) {
      yield CategoryLoadingState();
      try {
        var category = await _repository.getCategoryListRepo();
        yield CategoryFetchSuccessList(category: category);
      } catch (e) {
        yield CategoryErrorState(message: e.toString());
      }
    } else if (event is FetchCategoryPosts) {
      yield CategoryLoadingState();
      try {
        var articles = await _repository.getCategoryPosts(categoryName);
        print("done!"+categoryName);
        yield CategoryPostsFetchSuccess(article: articles);
      } catch (e) {
        yield CategoryErrorState(message: e.toString());
      }
    }
  }
}
