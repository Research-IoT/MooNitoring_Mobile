class Api {
  static const baseURL = 'dev-moonitoring.riset-d3rpla.com';
  static const versionAPI = '/api/v1';

// ================================================== POST ==================================================

// Auth
  static const register = '/users/register';
  static const login = '/users/login';

// Devices
  static const registerDevices = '/devices/register';
  static const sensorUpdate = '/devices/update';

// Device - Sensor
  static const addData = '/devices_sensor/add';

// ==========================================================================================================
//
//
// ================================================== GET ===================================================

// Auth
  static const profile = '/profile';

// Devices
  static const allDevices = '/devices/auth/all';
  static const sensorInfo = '/devices/sensor';
  static const detailsDevices = '/devices/details';

// Device - Sensor
  static const getAllData = '/devices_sensor/data';
  static const getLastData = '/devices_sensor/current';

// ==========================================================================================================
//
//
// ================================================= DELETE =================================================

// Auth
  static const logout = '/logout';

// ==========================================================================================================
}
