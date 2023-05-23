class Utils {
  static bool isAuthRoutes(String path) {
    if (path.contains('/auth/sessions/create') ||
        path.contains('/auth/sessions/refresh') ||
        path.contains('/users/register')) {
      return true;
    }
    return false;
  }
}
