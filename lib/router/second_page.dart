import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter_template/router/routes_constant.dart';

class DirectRouting extends StatelessWidget {
  const DirectRouting({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    print("Direct Routing");
    return Scaffold(
        appBar: AppBar(
          title: Text(myArg),
        ),
        body: Column(children: [
          TextFormField(
            onChanged: (vsl) {
              print("Direct Routing Page $vsl");
            },
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(
                "${RouteConstant.firstPage}/${RouteConstant.thirdPage}",
                extra: "Hello Third ");
          },
          tooltip: 'Route',
          child: const Icon(Icons.add),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    print("Third PAge");
    return Scaffold(
        appBar: AppBar(
          title: Text(myArg),
        ),
        body: Column(children: [
          TextFormField(
            onChanged: (vsl) {
              print("Third Page $vsl");
            },
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(
              RouteConstant.pathParameterPage.replaceAll(":id", "Pathparam"),
            );
          },
          tooltip: 'Route',
          child: const Icon(Icons.add),
        ));
  }
}

class PathParamScreen extends StatelessWidget {
  const PathParamScreen({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    print("Path Param");
    return Scaffold(
        appBar: AppBar(
          title: Text(myArg),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.go(
            //   Uri(
            //     path: RouteConstant.queryParameterPage,
            //     queryParameters: {'search': 'queryParam'},
            //   ).toString(),
            // );
          },
          tooltip: 'Route',
          child: const Icon(Icons.add),
        ));
  }
}

class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key, required this.myArg});
  final String myArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(myArg),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Route',
          child: const Icon(Icons.add),
        ));
  }
}
