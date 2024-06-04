import 'package:dio/dio.dart';
import 'package:ems_project/model/employee.dart';
import 'package:ems_project/services/check_connection.dart';
import 'dio_exception.dart';

class ApiService {
  Dio dio = Dio();
  // ApiService() {
  //   dio.options.baseUrl = 'https://dummy.restapiexample.com/api/v1';
  //   dio.options.receiveTimeout = const Duration(seconds: 10);
  //   dio.options.sendTimeout = const Duration(seconds: 10);
  //   dio.options.validateStatus = (status) {
  //     return status != null && status < 500;
  //   };
  // }
  List<dynamic> employeeList = [];
  ConnectivityService connectivityService = ConnectivityService();

  String baseUrl = 'https://dummy.restapiexample.com/api/v1';
  Future<dynamic> getEmployeeList() async {
    if (!await connectivityService.checkConnection()) {
      return connectivityService.showToast('No internet connection');
    } 
    try {
      var response = await dio.get('$baseUrl/employees');
      if (response.statusCode == 200) {
        employeeList = response.data['data'];
      }
      return employeeList;
    } on DioException catch (exception) {
      throw DioExceptionHandler.handleException(exception);
    } catch (e) {
      throw 'Unexpected Error : $e';
    }
  }

  Future<dynamic> getDetailById(int id) async {
    try {
      var response = await dio.get('$baseUrl/employee/$id');
      if (response.statusCode == 200) {
        print(response.data['data']);
        return response.data['data'];
      } else if (response.statusCode == 429) {
        return 'Too many attemps.try again later';
      }
    } on DioException catch (ex) {
      throw DioExceptionHandler.handleException(ex);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> addEmployeeData(String empName, int salary, int age) async {
    try {
      var data =
          Datum(employeeName: empName, employeeSalary: salary, employeeAge: age)
              .toJson();
      await dio.post('$baseUrl/create',
          data: data,
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                "Accept": "application/json"
              },
              followRedirects: false,
              contentType: 'application/json',
              validateStatus: (status) {
                return status! < 500;
              }));
      print(data);
      return 'Added successfully';
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> updateDetails(Datum datum) async {
    try {
      String errorMessage = '';
      final response = await dio.put('$baseUrl/update/${datum.id}', data: {
        'name': datum.employeeName,
        'salary': datum.employeeSalary,
        'age': datum.employeeAge
      });
      if (response.statusCode == 200) {
        print(response.data);
        errorMessage = 'Updated successfully';
      } else if (response.statusCode == 429) {
        errorMessage = 'Too many attemps.try again later';
      }
      return errorMessage;
    } on DioException catch (exception) {
      return DioExceptionHandler.handleException(exception);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> deleteEmployeeById(int id) async {
    try {
      var response = await dio.delete('$baseUrl/delete/$id');
      if (response.statusCode == 200) {
        print('deleted');
      }
      return 'Deleted successfully';
    } on DioException catch (e) {
      return DioExceptionHandler.handleException(e);
    } catch (e) {
      throw e.toString();
    }
  }
}



