class Api {
  static const baseURL = 'dev-moonitoring.riset-d3rpla.com';
  static const versionAPI = '/api/v1';

// ================================================== POST ==================================================

  static const register = '/users/register';
  static const login = '/users/login';

  static const changeControl = '/devices/controller/changes';

// ==========================================================================================================
//
//
// ================================================== GET ===================================================

  static const profile = '/users/profile';

  static const listDevices = '/devices/list';
  static const listNotif = '/notifications/list';

  static const dashboard = '/dashboard/info';

  static const infoControl = '/devices/controller/current-users';

  static const dataByDay = '/devices/sensor/data-by-day';
  static const dataByWeek = '/devices/sensor/data-by-week';
  static const dataByMonth = '/devices/sensor/data-by-month';

// ==========================================================================================================
//
//
// ================================================= DELETE =================================================

  static const logout = '/users/logout';

// ==========================================================================================================
}
