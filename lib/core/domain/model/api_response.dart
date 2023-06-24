import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

enum StatusCode {
  success(1),
  failed(-1);

  const StatusCode(this.value);
  final int value;
  
  static StatusCode getByValue(num i){
    return StatusCode.values.firstWhere((x) => x.value == i);
  }
}


@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  T data;
  String message;
  int resultCode;
  ApiResponse({
    required this.message,
    required this.resultCode,
    required this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ApiResponseFromJson(json, fromJsonT);
  }

  // static T _fromJson<T extends JsonSerializable>(
  //     Object? json, T Function(Object? json) fromJsonT) {
  //   return fromJsonT(json);
  // }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);

  // factory ListResponse.fromList(List<T> list,
  //     {String message = '',  int resultCode = 1}) {
  //   return ListResponse(
  //       message: message, resultCode: resultCode, data: List<T>.from(list));
  // }

  // factory ListResponse.empty({String message = '', int resultCode = 1}) {
  //   return ListResponse(message: message, resultCode: resultCode, data: []);
  // }
}


@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  List<T> data;
  String message;
  int resultCode;
  ListResponse({
    required this.message,
    required this.resultCode,
    required this.data,
  });

  factory ListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ListResponseFromJson(json, fromJsonT);
  }

  // static T _fromJson<T extends JsonSerializable>(
  //     Object? json, T Function(Object? json) fromJsonT) {
  //   return fromJsonT(json);
  // }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListResponseToJson(this, toJsonT);

  // factory ListResponse.fromList(List<T> list,
  //     {String message = '',  int resultCode = 1}) {
  //   return ListResponse(
  //       message: message, resultCode: resultCode, data: List<T>.from(list));
  // }

  // factory ListResponse.empty({String message = '', int resultCode = 1}) {
  //   return ListResponse(message: message, resultCode: resultCode, data: []);
  // }
}