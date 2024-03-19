// To parse this JSON data, do
//
//     final addChecklistResponseModel = addChecklistResponseModelFromJson(jsonString);

import 'dart:convert';

AddChecklistResponseModel addChecklistResponseModelFromJson(String str) => AddChecklistResponseModel.fromJson(json.decode(str));

String addChecklistResponseModelToJson(AddChecklistResponseModel data) => json.encode(data.toJson());

class AddChecklistResponseModel {
    int? statusCode;
    String? message;
    dynamic errorMessage;
    Data? data;

    AddChecklistResponseModel({
        this.statusCode,
        this.message,
        this.errorMessage,
        this.data,
    });

    factory AddChecklistResponseModel.fromJson(Map<String, dynamic> json) => AddChecklistResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    dynamic items;
    bool? checklistCompletionStatus;

    Data({
        this.id,
        this.name,
        this.items,
        this.checklistCompletionStatus,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        items: json["items"],
        checklistCompletionStatus: json["checklistCompletionStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": items,
        "checklistCompletionStatus": checklistCompletionStatus,
    };
}
