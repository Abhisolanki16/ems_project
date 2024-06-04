import 'package:auto_route/auto_route.dart';
import 'package:ems_project/services/api_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
// ignore: must_be_immutable
class EmployeeDetails extends StatefulWidget {
  EmployeeDetails({super.key, required this.id});

  int id;

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: apiService.getDetailById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No Data Found"));
            }
            return Center(
              child: Text(
                  'Employee ID : ${snapshot.data['id']}\nEmployee Name : ${snapshot.data['employee_name']}\nEmployee Salary : ${snapshot.data['employee_salary']}\nEmployee Age : ${snapshot.data['employee_age']}'),
            );
          }),
    ));
  }
}
