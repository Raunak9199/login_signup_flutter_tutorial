class LoginSingleTon {
  static String userName = "";
  static String userMobile = "";
  static String userGender = "";
  static String userProfile = "";
  static String userEmail = "";

  static bool isUserNameSet = false;
  static bool isUserMobileSet = false;
  static bool isUserEmailSet = false;
  static bool isUserGenderSet = false;
  static bool isUserProfileSet = false;

  LoginSingleTon._internal();

  static final LoginSingleTon _singleTon = LoginSingleTon._internal();

  factory LoginSingleTon() {
    return _singleTon;
  }

  //setter method
  static void setUserName(String _name) {
    userName = _name;
    isUserNameSet = true;
  }

  static void setUserEmail(String _email) {
    userEmail = _email;
    isUserEmailSet = true;
  }

  static void setUserMobile(String _mobile) {
    userMobile = _mobile;
    isUserMobileSet = true;
  }

  static void setuserGender(String _gender) {
    userGender = _gender;
    isUserGenderSet = true;
  }

  static void setUserProfilePic(String _profilePic) {
    userProfile = _profilePic;
    isUserProfileSet = true;
  }

  //getter
  static String getUserName() => userName;
  static String getUserEmail() => userEmail;
  static String getUserMobile() => userMobile;
  static String getUserGender() => userGender;
  static String getUserProfilePic() => userProfile;
}
