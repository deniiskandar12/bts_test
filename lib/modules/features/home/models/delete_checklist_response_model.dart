// To parse this JSON data, do
//
//     final deleteChecklistResponseModel = deleteChecklistResponseModelFromJson(jsonString);

import 'dart:convert';

DeleteChecklistResponseModel deleteChecklistResponseModelFromJson(String str) => DeleteChecklistResponseModel.fromJson(json.decode(str));

String deleteChecklistResponseModelToJson(DeleteChecklistResponseModel data) => json.encode(data.toJson());

class DeleteChecklistResponseModel {
    int? statusCode;
    String? message;
    String? errorMessage;
    dynamic data;

    DeleteChecklistResponseModel({
        this.statusCode,
        this.message,
        this.errorMessage,
        this.data,
    });

    factory DeleteChecklistResponseModel.fromJson(Map<String, dynamic> json) => DeleteChecklistResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data,
    };
}
