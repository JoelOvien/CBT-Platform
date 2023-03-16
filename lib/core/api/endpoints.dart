class BwEndpoints {
  // Auth
  static const String login = '/user/login';
  static const String signup = '/user/signup';
  static const String forgotPassword = '/user/forgot_password';

  // user
  static const String verifyUser = '/user/verify';
  static const String user = "/user";
  static const String userImage = '/user/image';

  // category
  static const String category = '/category';

  // works
  static const String displayJobs = "/dpjobs";
  static const String displayJobsImage = "/dpjobs/image";

  // job
  static const String job = "/job";

  // messaging
  static const String chatRooms = "/chat/chatroom";

  // payments
  static const String banks = "/payment/banks";
  static const String paymentMethods = "/payment/methods";
  static const String jobPayment = "/payment/job";
  static const String addMoneytoWallet = "/payment/wallet/add";
  static const String walletDetails = "/payment/wallet/details";
  static const String withdrawal = "/payment/wallet/withdraw";

  // notifications
  static const String notification = "/notification";
}
