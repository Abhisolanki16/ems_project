// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/employee.dart';
import '../services/api_service.dart';
import 'add_employee.dart';

@RoutePage()
class UpdateEmployee extends StatefulWidget {
  UpdateEmployee({super.key, required this.data});
  var data;

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  ApiService apiService = ApiService();
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController age = TextEditingController();
  int selectedIndex = 0;
  String msg = '';

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    name.text = widget.data['employee_name'];
    age.text = widget.data['employee_age'].toString();
    salary.text = widget.data['employee_salary'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Update Employee'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FutureBuilder(
            future: apiService.getDetailById(widget.data['id']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(snapshot.hasError){
                return Center(child: Text('${snapshot.error}'));

              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No Data Found"));
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customTextField(name, 'Name', TextInputType.name),
                  customTextField(age, 'Age', TextInputType.number),
                  customTextField(salary, 'Salary', TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  customButton('Update', () async{
                    if (name.text.isNotEmpty &&
                        age.text.isNotEmpty &&
                        salary.text.isNotEmpty) {
                      Datum datum = Datum(
                          employeeName: name.text,
                          employeeSalary: int.parse(salary.text),
                          employeeAge: int.parse(age.text));
                     await apiService.updateDetails(datum).then((String text) {
                        msg = text;
                      });
                      Fluttertoast.showToast(msg: msg);
                      Navigator.pop(context);
                    }
                  })
                ],
              );
            }),
      ),
    ));
  }
}
