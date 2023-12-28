// import 'package:go_router/go_router.dart';
// import 'package:go_router_flutter_template/router/second_page.dart';

// import '../main.dart';
// import 'routes_constant.dart';

// class RouteConfig {
//   static final goRouter = GoRouter(
//       redirect: (context, state) {
//         return "/";
//       },
//       initialLocation: '/',
//       routes: [
//         GoRoute(
//           path: "/",
//           builder: (context, state) => const MyHomePage(),
//         ),
//         StatefulShellRoute.indexedStack(
//             builder: (context, state, navigationShell) {
//               return const ThirdPage(
//                 myArg: "statefull",
//               );
//             },
//             branches: [
//               StatefulShellBranch(
//                 // navigatorKey: _shellNavigatorInfoKey,
//                 routes: [
//                   GoRoute(
//                       path: RouteConstant.firstPage,
//                       pageBuilder: (context, state) => NoTransitionPage(
//                             key: state.pageKey,
//                             child: MyHomePage(
//                               key: state.pageKey,
//                             ),
//                           ),
//                       routes: const []),
//                   GoRoute(
//                       name: RouteConstant.thirdPage,
//                       path: '/${RouteConstant.thirdPage}',
//                       routes: [
//                         GoRoute(
//                           name: RouteConstant.pathParameterPage,
//                           path: RouteConstant.pathParameterPage,
//                           builder: (context, state) => PathParamScreen(
//                               myArg: state.pathParameters["id"].toString()),
//                         ),
//                       ]),
//                 ],
//               ),
//               StatefulShellBranch(routes: [
//                 GoRoute(
//                     name: RouteConstant.queryParameterPage,
//                     path: RouteConstant.queryParameterPage,
//                     pageBuilder: (context, state) {
//                       final name = state.uri.queryParameters['search'];
//                       return NoTransitionPage(
//                         key: state.pageKey, //Also I tried with UniqueKey()
//                         child: QueryParamScreen(
//                           myArg: name ?? "0",
//                         ),
//                       );
//                     })
//               ])
//             ])
//       ]);
// }
