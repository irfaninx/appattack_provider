class BASEURL {
  static String local =
      "https://prod.inheritxdev.in/college-coupons/dev/admin/api/v4/"; // Dev environment

  static String live =
      "https://prod.inheritxdev.in/app-attack/prod/admin/api/v1/"; //Live environment shared to client
  static String qa =
      "https://prod.inheritxdev.in/app-attack/qa/admin/api/v1/"; // QA environment

  static String dev =
      "https://prod.inheritxdev.in/app-attack/api/v1/"; //"https://prod.inheritxdev.in/app-attack/dev/admin/api/v1/"

  static String final_live = "https://app-attack.com/admin/api/v1/";

  static String current = BASEURL.dev;
}

class WebServices {
  static String collegeList = "college-list";
  static String collegeDeals = "college/deals";
  static String dealsSearch = "college/deals/search";
  static String notifications = "notifications";
  static String nearby = "business/nearby";
  static String couponNotification = "update-push-notification";
  static String registerDevice = "register-device";
  static String businessDetail = "business/details";
  static String couponDetail = "coupon/details";
  static String useCoupon = "use-coupon";
  static String savings = "saving";
  static String resetsavings = "reset-saving-amount";
  static String updateLocation = "update-location";
  static String contactandhelp = "student-help-info-list";
  static String getAppVersion = "get-student-app-version";
  static String studentlogin = "student/login";
  static String studentforgotpassword = "student/forgot-password";
  static String studentchangepassword = "student/change-password";
  static String studentregister = "student/register";
  static String studentlogout = "student/logout";
  static String studentgetprofile = "student/get-profile";
  static String studentupdateprofile = "student/update-profile";
  static String paymentClientToken = "student/getPaymentToken";
  static String makeBTPayment = "student/makePayment";
  static String planHistory = "student/getPaymentHistory";

  //Stripe payment apis
  static String getEphemeralKey = "student/getEphemeralKey";
  static String getClientSecret = "student/getClientSecret";
  static String makeStripePayment = "student/makePayment";
}
