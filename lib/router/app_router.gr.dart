// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:ems_project/screen/add_employee.dart' as _i1;
import 'package:ems_project/screen/employee_details.dart' as _i2;
import 'package:ems_project/screen/home.dart' as _i3;
import 'package:ems_project/screen/update_employee.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddEmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<AddEmployeeRouteArgs>(
          orElse: () => const AddEmployeeRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddEmployee(key: args.key),
      );
    },
    EmployeeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeDetailsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EmployeeDetails(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    UpdateEmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateEmployeeRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.UpdateEmployee(
          key: args.key,
          data: args.data,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEmployee]
class AddEmployeeRoute extends _i5.PageRouteInfo<AddEmployeeRouteArgs> {
  AddEmployeeRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddEmployeeRoute.name,
          args: AddEmployeeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddEmployeeRoute';

  static const _i5.PageInfo<AddEmployeeRouteArgs> page =
      _i5.PageInfo<AddEmployeeRouteArgs>(name);
}

class AddEmployeeRouteArgs {
  const AddEmployeeRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'AddEmployeeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.EmployeeDetails]
class EmployeeDetailsRoute extends _i5.PageRouteInfo<EmployeeDetailsRouteArgs> {
  EmployeeDetailsRoute({
    _i6.Key? key,
    required int id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          EmployeeDetailsRoute.name,
          args: EmployeeDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'EmployeeDetailsRoute';

  static const _i5.PageInfo<EmployeeDetailsRouteArgs> page =
      _i5.PageInfo<EmployeeDetailsRouteArgs>(name);
}

class EmployeeDetailsRouteArgs {
  const EmployeeDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'EmployeeDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.UpdateEmployee]
class UpdateEmployeeRoute extends _i5.PageRouteInfo<UpdateEmployeeRouteArgs> {
  UpdateEmployeeRoute({
    _i6.Key? key,
    required dynamic data,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          UpdateEmployeeRoute.name,
          args: UpdateEmployeeRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateEmployeeRoute';

  static const _i5.PageInfo<UpdateEmployeeRouteArgs> page =
      _i5.PageInfo<UpdateEmployeeRouteArgs>(name);
}

class UpdateEmployeeRouteArgs {
  const UpdateEmployeeRouteArgs({
    this.key,
    required this.data,
  });

  final _i6.Key? key;

  final dynamic data;

  @override
  String toString() {
    return 'UpdateEmployeeRouteArgs{key: $key, data: $data}';
  }
}
