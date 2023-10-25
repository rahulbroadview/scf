class ConstApiUrl {
  static const baseApiUrl = 'https://qa.paydatasync.com';
  static const loginApiUrl = "$baseApiUrl/adminservice/api/authenticate";

  static const customerRoleApiUrl = "$baseApiUrl/adminservice/api/G5ManagerAccount/GetRolesForCustomers";
  static const getAllMangerApiUrl = "$baseApiUrl/adminservice/api/G5ManagerAccount/GetManagerAccountsNonPaged?all=false";
  static const menuApiUrl = "$baseApiUrl/adminservice/api/PayDayAdminPortal/menu";
  static const getAllLocationsApiUrl = "$baseApiUrl/adminservice/api/PayDayAdminPortal/getAllActiveCustomers";
  static const registerMangerApiUrl = "$baseApiUrl/adminservice/api/G5ManagerAccount/RegisterManagerAccount";
  static const updateManagerApiUrl = "$baseApiUrl/adminservice/api/G5AccountDetails/UpdateAccountDetails";
  static const deactivateManager = "$baseApiUrl/AdminService/api/G5ManagerAccount/EnableAccount";
  static const getQrCode = "$baseApiUrl/adminservice/api/G5ManagerAccount/GetUserQRCode";
  static const getTimeAPI = "$baseApiUrl/resourceservice/api/G5CustomerTime/GetTime"; //customerCode=10000157&businessDate=2022-06-30
  static const getPayOutDataAPI = "$baseApiUrl/resourceservice/api/G5CustomerPayout";
  static const forgotPasswordAPI = "$baseApiUrl/AdminService/api/PDAPAccount/ForgotPassword";
  static const createUserTicketAPI = "$baseApiUrl/adminservice/api/UserTicket/CreateUserTicket";
  static const enableDisableEmployeeAPI = "$baseApiUrl/resourceservice/api/G5EmployeeProfile/EnableEmployee";
  static const updateProfileAPI = "$baseApiUrl/adminservice/api/G5AccountDetails/UpdateAccountDetails";

  static var tipScamAPI = "$baseApiUrl/resourceservice/api/TipScam";
}
