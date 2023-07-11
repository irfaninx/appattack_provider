abstract class AlertMessage {
  static const logout = "Are you sure you want to logout?";
  static const reset = "Are you sure you want to reset savings?";
  static const mail =
      "Unable to send mail. Please make sure you have email account setup in settings.";
  static const noCollegeFound = "No organizations found.";
  static const noCouponFound = "No coupons found.";
  static const noBusinessFound = "No nearby business found.";
  static const noNotificationFound = "No notifications found.";
  static const noFilterFound = "No filters found.";
  static const noSavingsFound = "No savings found.";
  static const noDealsFound = "No deals found.";
  static const couponExpire = "Coupon has been expired.";
  static const numberNotValid = "Not able to set call.";
  static const enterName = "Please enter first name.";
  static const enterLastName = "Please enter last name.";
  static const enterCity = "Please enter city.";
  static const enterMail = "Please enter email.";
  static const invalidMail = "Please valid enter email.";
  static const enterPassword = "Please enter password.";
  static const enterOldPassword = "Please enter current password.";
  static const enterNewPassword = "Please enter new password.";
  static const enterConfirmPassword = "Please enter confirm password.";
  static const invalidPassword = "Password must be 6 character or more.";
  static const mismatchPassword =
      "New password and Confirm password should be same";
  static const mismatchPassword2 =
      "Password and Confirm password should be same";
  static const noInternet = "No internet connection.";
  static const somethingWentWrong = "Something went wrong.";
}

abstract class AlertButton {
  static const OK = "OK";
  static const Update = "Update";
  static const Cancel = "Cancel";
}

abstract class AlertTitle {
  static const appname = "App Attack";
}

enum PaymentStatusWords { Successfull, Failed, Refund }
