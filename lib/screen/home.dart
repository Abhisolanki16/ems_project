import 'package:auto_route/auto_route.dart';
import 'package:ems_project/router/app_router.gr.dart';
import 'package:ems_project/services/api_service.dart';
import 'package:ems_project/services/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController age = TextEditingController();
  String msg = '';
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    // Check connectivity when the app starts
    _connectivityService.checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: apiService.getEmployeeList(),
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
            return ListView.builder(
              itemCount: apiService.employeeList.length,
              itemBuilder: (context, index) {
                var data = apiService.employeeList[index];

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    onTap: () {
                      context.router.push(EmployeeDetailsRoute(id: data['id']));
                    },
                    titleAlignment: ListTileTitleAlignment.center,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.blue,
                    minLeadingWidth: 10,
                    leading: Text(
                      data['id'].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    title: Text(
                      "${data['employee_name']} - ${data['employee_age']}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      data['employee_salary'].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.router
                                  .push(UpdateEmployeeRoute(data: data));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () async {
                              await apiService
                                  .deleteEmployeeById(data['id'])
                                  .then((String txt) {
                                msg = txt;
                              });
                              Fluttertoast.showToast(msg: msg);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddEmployeeRoute());
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
