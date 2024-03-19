// To parse this JSON data, do
//
//     final checklistResponseModel = checklistResponseModelFromJson(jsonString);

import 'dart:convert';

ChecklistResponseModel checklistResponseModelFromJson(String str) => ChecklistResponseModel.fromJson(json.decode(str));

String checklistResponseModelToJson(ChecklistResponseModel data) => json.encode(data.toJson());

class ChecklistResponseModel {
    int? statusCode;
    String? message;
    dynamic errorMessage;
    List<Checklist>? data;

    ChecklistResponseModel({
        this.statusCode,
        this.message,
        this.errorMessage,
        this.data,
    });

    factory ChecklistResponseModel.fromJson(Map<String, dynamic> json) => ChecklistResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? [] : List<Checklist>.from(json["data"]!.map((x) => Checklist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "errorMessage": errorMessage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Checklist {
    int? id;
    String? name;
    dynamic items;
    bool? checklistCompletionStatus;

    Checklist({
        this.id,
        this.name,
        this.items,
        this.checklistCompletionStatus,
    });

    factory Checklist.fromJson(Map<String, dynamic> json) => Checklist(
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
