import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter_template/router/routes_constant.dart';
import 'package:url_strategy/url_strategy.dart';

import 'router/second_page.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final rootKey = GlobalKey<NavigatorState>(debugLabel: "root");
final rootKey1 = GlobalKey<NavigatorState>(debugLabel: "root2");

final GoRouter _router = GoRouter(
  initialLocation: '/',
  navigatorKey: rootKey,
  routerNeglect: true,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
        path: RouteConstant.firstPage,
        pageBuilder: (context, state) {
          print(state.fullPath);
          return MaterialPage(
            child: DirectRouting(
              myArg: state.extra.toString(),
            ),
          );
        },
        routes: [
          GoRoute(
            path: RouteConstant.thirdPage,
            // NOTE: Don't need to specify "/" character for router’s parents
            builder: (context, state) {
              return ThirdPage(
                myArg: state.extra.toString(),
              );
            },
          ),
        ]),
    GoRoute(
      path: RouteConstant.pathParameterPage,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return PathParamScreen(
          myArg: id ?? "0",
        );
      },
    ),
    GoRoute(
      path: RouteConstant.queryParameterPage,
      builder: (context, state) {
        final name = state.uri.queryParameters['search'];
        return QueryParamScreen(
          myArg: name ?? "0",
        );
      },
    ),
  ],
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.push(RouteConstant.firstPage, extra: "Hello world");
              },
              child: const Text("Direct Routing"),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(
                    "${RouteConstant.directRouting}/${RouteConstant.thirdPage}",
                    extra: "Hello Third");
              },
              child: const Text("Child Routing"),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(
                  RouteConstant.pathParameterPage
                      .replaceAll(":id", "pathparam"),
                );
              },
              child: const Text("Path Param Routing"),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(
                  Uri(
                    path: RouteConstant.queryParameterPage,
                    queryParameters: {'search': 'queryParam'},
                  ).toString(),
                );
              },
              child: const Text("Query Param Routing"),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  "hello",
                );
              },
              child: const Text("Query Param Routing"),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  "hello",
                );
              },
              child: const Text("First to second page"),
            ),
            // hfjfhf
          ],
        ),
      ),
    );
  }
}
