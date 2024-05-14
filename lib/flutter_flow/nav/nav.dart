import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const MainPageWidget() : const LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const MainPageWidget() : const LoginPageWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'MainPage',
          path: '/mainPage',
          builder: (context, params) => const MainPageWidget(),
        ),
        FFRoute(
          name: 'RegisterPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'ResetPassword',
          path: '/resetPassword',
          builder: (context, params) => const ResetPasswordWidget(),
        ),
        FFRoute(
          name: 'AIPage',
          path: '/aIPage',
          builder: (context, params) => const AIPageWidget(),
        ),
        FFRoute(
          name: 'PregnancyCalendarPage',
          path: '/pregnancyCalendarPage',
          builder: (context, params) => const PregnancyCalendarPageWidget(),
        ),
        FFRoute(
          name: 'CommunityPage',
          path: '/communityPage',
          builder: (context, params) => const CommunityPageWidget(),
        ),
        FFRoute(
          name: 'PrivateChatsPage',
          path: '/privateChatsPage',
          builder: (context, params) => const PrivateChatsPageWidget(),
        ),
        FFRoute(
          name: 'BlogPage',
          path: '/blogPage',
          builder: (context, params) => const BlogPageWidget(),
        ),
        FFRoute(
          name: 'FreeEbookPage',
          path: '/freeEbookPage',
          builder: (context, params) => const FreeEbookPageWidget(),
        ),
        FFRoute(
          name: 'OnlineCoachingPage',
          path: '/onlineCoachingPage',
          builder: (context, params) => const OnlineCoachingPageWidget(),
        ),
        FFRoute(
          name: 'PregnancyCoursePage',
          path: '/pregnancyCoursePage',
          builder: (context, params) => const PregnancyCoursePageWidget(),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          builder: (context, params) => const SupportPageWidget(),
        ),
        FFRoute(
          name: 'FAQPage',
          path: '/fAQPage',
          builder: (context, params) => const FAQPageWidget(),
        ),
        FFRoute(
          name: 'CollaborationPage',
          path: '/collaborationPage',
          builder: (context, params) => const CollaborationPageWidget(),
        ),
        FFRoute(
          name: 'BlogsTopicsList',
          path: '/blogsTopicsList',
          builder: (context, params) => BlogsTopicsListWidget(
            sectionReference: params.getParam(
              'sectionReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['blogs'],
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TopicDescription',
          path: '/topicDescription',
          builder: (context, params) => TopicDescriptionWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            topicOne: params.getParam(
              'topicOne',
              ParamType.String,
            ),
            oneDescription: params.getParam(
              'oneDescription',
              ParamType.String,
            ),
            topicTwo: params.getParam(
              'topicTwo',
              ParamType.String,
            ),
            twoDescription: params.getParam(
              'twoDescription',
              ParamType.String,
            ),
            topicThree: params.getParam(
              'topicThree',
              ParamType.String,
            ),
            threeDescription: params.getParam(
              'threeDescription',
              ParamType.String,
            ),
            topicFour: params.getParam(
              'topicFour',
              ParamType.String,
            ),
            fourDescription: params.getParam(
              'fourDescription',
              ParamType.String,
            ),
            topicFive: params.getParam(
              'topicFive',
              ParamType.String,
            ),
            fiveDescription: params.getParam(
              'fiveDescription',
              ParamType.String,
            ),
            topicSix: params.getParam(
              'topicSix',
              ParamType.String,
            ),
            sixDescription: params.getParam(
              'sixDescription',
              ParamType.String,
            ),
            chapterTitle: params.getParam(
              'chapterTitle',
              ParamType.String,
            ),
            chapterOne: params.getParam(
              'chapterOne',
              ParamType.String,
            ),
            chapterTwo: params.getParam(
              'chapterTwo',
              ParamType.String,
            ),
            chapterThree: params.getParam(
              'chapterThree',
              ParamType.String,
            ),
            referenceSection: params.getParam(
              'referenceSection',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['blogs', 'topics'],
            ),
            partOne: params.getParam(
              'partOne',
              ParamType.String,
            ),
            partOneDescription: params.getParam(
              'partOneDescription',
              ParamType.String,
            ),
            partTwo: params.getParam(
              'partTwo',
              ParamType.String,
            ),
            partTwoDescription: params.getParam(
              'partTwoDescription',
              ParamType.String,
            ),
            partThree: params.getParam(
              'partThree',
              ParamType.String,
            ),
            partThreeDescription: params.getParam(
              'partThreeDescription',
              ParamType.String,
            ),
            partFour: params.getParam(
              'partFour',
              ParamType.String,
            ),
            partFourDescription: params.getParam(
              'partFourDescription',
              ParamType.String,
            ),
            partFive: params.getParam(
              'partFive',
              ParamType.String,
            ),
            partFiveDescription: params.getParam(
              'partFiveDescription',
              ParamType.String,
            ),
            partSix: params.getParam(
              'partSix',
              ParamType.String,
            ),
            partSixDescription: params.getParam(
              'partSixDescription',
              ParamType.String,
            ),
            partSeven: params.getParam(
              'partSeven',
              ParamType.String,
            ),
            partSevenDescription: params.getParam(
              'partSevenDescription',
              ParamType.String,
            ),
            partEight: params.getParam(
              'partEight',
              ParamType.String,
            ),
            partEightDescription: params.getParam(
              'partEightDescription',
              ParamType.String,
            ),
            partNine: params.getParam(
              'partNine',
              ParamType.String,
            ),
            partNineDescription: params.getParam(
              'partNineDescription',
              ParamType.String,
            ),
            partTen: params.getParam(
              'partTen',
              ParamType.String,
            ),
            partTenDescription: params.getParam(
              'partTenDescription',
              ParamType.String,
            ),
            chapterFour: params.getParam(
              'chapterFour',
              ParamType.String,
            ),
            chapterFive: params.getParam(
              'chapterFive',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'userProfile',
          path: '/userProfile',
          builder: (context, params) => const UserProfileWidget(),
        ),
        FFRoute(
          name: 'PublicUserProfile',
          path: '/publicUserProfile',
          builder: (context, params) => PublicUserProfileWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'chatMessages',
          path: '/chatMessages',
          builder: (context, params) => ChatMessagesWidget(
            chatUser: params.getParam(
              'chatUser',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            userimage: params.getParam(
              'userimage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'testPage',
          path: '/testPage',
          builder: (context, params) => const TestPageWidget(),
        ),
        FFRoute(
          name: 'payment',
          path: '/payment',
          builder: (context, params) => const PaymentWidget(),
        ),
        FFRoute(
          name: 'CoursePage',
          path: '/coursePage',
          builder: (context, params) => CoursePageWidget(
            courseRef: params.getParam(
              'courseRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'CourseEditorPage',
          path: '/courseEditorPage',
          builder: (context, params) => CourseEditorPageWidget(
            newCourseRef: params.getParam(
              'newCourseRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'SubscriptionChoosePage',
          path: '/subscriptionChoosePage',
          builder: (context, params) => const SubscriptionChoosePageWidget(),
        ),
        FFRoute(
          name: 'nameListPage',
          path: '/nameListPage',
          builder: (context, params) => const NameListPageWidget(),
        ),
        FFRoute(
          name: 'ContractionsPage',
          path: '/contractionsPage',
          builder: (context, params) => const ContractionsPageWidget(),
        ),
        FFRoute(
          name: 'BabyNames',
          path: '/babyNames',
          builder: (context, params) => const BabyNamesWidget(),
        ),
        FFRoute(
          name: 'Favorites',
          path: '/favorites',
          builder: (context, params) => const FavoritesWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
