// import 'package:ems_project/model/employee.dart';
// import 'package:ems_project/repository/employee_repo.dart';
// import 'package:mobx/mobx.dart';
// part 'employee_store.g.dart';

// class EmployeeStore = _EmployeeStore with _$EmployeeStore;

// abstract class _EmployeeStore with Store {
//   final EmployeeRepository repository;

//   _EmployeeStore(this.repository);

//   @observable
//   ObservableList<Datum> employees = ObservableList<Datum>();

//   @observable
//   bool isLoading = false;

//   @action
//   Future<void> fetchEmployees() async {
//     isLoading = true;
//     try {
//       final employeeList = await repository.getEmployees();
//       employees = ObservableList.of(employeeList as Iterable<Datum>);
//       print(employees);
//     } catch (e) {
//       print(e.toString());
//     } finally {
//       isLoading = false;
//     }
//   }
// }
