// ignore: camel_case_types
enum APP_PAGES {
  loginView,
  registerView,
  homeView,
}

extension AppPageExtensions on APP_PAGES {
  String get routePath {
    switch (this) {
      case APP_PAGES.loginView:
        return '/auth/login';
      case APP_PAGES.registerView:
        return '/auth/register';
      case APP_PAGES.homeView:
        return '/home';
    }
  }

  String get routeName {
    switch (this) {
      case APP_PAGES.loginView:
        return 'LoginView';
      case APP_PAGES.registerView:
        return 'RegisterView';
      case APP_PAGES.homeView:
        return 'HomeView';
    }
  }
}
