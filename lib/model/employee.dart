import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable()
class Employee {
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'data')
  List<Datum> data;
  @JsonKey(name: 'message')
  String message;

  Employee({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

@JsonSerializable()
class Datum {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'employee_name')
  String employeeName;
  @JsonKey(name: 'employee_salary')
  int employeeSalary;
  @JsonKey(name: 'employee_age')
  int employeeAge;
 

  Datum({
    this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
      };
}
