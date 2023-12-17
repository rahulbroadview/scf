class UrlUtils {
  static const String baseUrl =
      "https://www.scfinvestmentgroup.com/public/api/";
  static const String loginApiUrl = "${baseUrl}login";
  static const String forgotApiUrl = "${baseUrl}sendEmail";
  static const String otpVerifyUrl = "${baseUrl}otpVerify";
  static const String verifyPassword = "${baseUrl}forgetPassword";
  static const String staffListUrl = "${baseUrl}staffList";
  static const String addStaffListUrl = "${baseUrl}storeUser";
  static const String customerListUrl = "${baseUrl}customerPagination";
  static const String storeUser = "${baseUrl}storeUser";
  static const String updateUser = "${baseUrl}updateUser";
  static const String fileListUrl = "${baseUrl}filePagination";
  static const String loanListUrl = "${baseUrl}categoryList";
  static const String createFileUrl = "${baseUrl}createFile";
  static const String updateFileUrl = "${baseUrl}updateFile";
  static const String customerFilter = "${baseUrl}customerFilter";
  static const String customerDelete = "${baseUrl}deleteUser";
  static const String allFilesList = "${baseUrl}filePagination";
  static const String customerFileListUrl = "${baseUrl}fileCustomerPagination";
  static const String assignFileToStaff = "${baseUrl}assignStaffToFile";
  static const String deleteFileToStaff = "${baseUrl}deleteFile";
  static const String fileFilterList = "${baseUrl}fileFilter";

//-----------------staff url ----------------------

  static const String staffFileList = "${baseUrl}staffFileList";
  static const String staffFileListFilter = "${baseUrl}staffFileFilter";
  static const String myProfileUrl = "${baseUrl}userProfile";
  static const String staffWiseCustomerList = "${baseUrl}staffWiseCustomerList";
  static const String showFileDocuments = "${baseUrl}showFiledocuments";
  static const String showFileFollowUp = "${baseUrl}showFollowup";
  static const String addFileFollowUp = "${baseUrl}takeFollowup";
  static const String timeLineApi = "${baseUrl}fileTilmeline";
  static const String updateFileStatus = "${baseUrl}updateFileStatus";
  static const String getAllDocumnets = "${baseUrl}DocumentList";
  static const String updateDocumentStatus = "${baseUrl}updateDocumentStatus";
  static const String adminUpdateDocumentStatus =
      "${baseUrl}updateAdminDocumentStatus";

//-----------------other url ----------------------

  static const String addCategory = "${baseUrl}addCategory";
  static const String addCategoryDocument = "${baseUrl}addCategoryDocument";
  static const String listCategoryDocument =
      "${baseUrl}listLoanCategoryDocument";
  static const String updateCategoryDcument =
      "${baseUrl}updateCategoryDocument";
  static const String checkVersion = "${baseUrl}checkVersion";
  static const String exportUser = "${baseUrl}exportUsers";
}

// https://www.scfinvestmentgroup.com/public/api/storeUser