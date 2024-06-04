// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:ems_project/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class AddEmployee extends StatelessWidget {
  AddEmployee({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController age = TextEditingController();
  ApiService apiService = ApiService();
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Employee'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // customTextField(id, 'Id', TextInputType.number),
                customTextField(name, 'Name', TextInputType.name),
                customTextField(age, 'Age', TextInputType.number),
                customTextField(salary, 'Salary', TextInputType.number),
                const SizedBox(
                  height: 30,
                ),
                customButton('Add', () {
                  apiService
                      .addEmployeeData(name.text, int.parse(salary.text),
                          int.parse(age.text))
                      .then((String text) {
                    msg = text;
                    // print(msg);
                    Fluttertoast.showToast(msg: msg);
                  });
                  // id.clear();
                  name.clear();
                  age.clear();
                  salary.clear();
                  // Fluttertoast.showToast(msg: '$result');
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString())));
                  // Navigator.pop(context);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customTextField(TextEditingController controller, String label,
    TextInputType? textInputType) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

Widget customButton(String text, void Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
  );
}
