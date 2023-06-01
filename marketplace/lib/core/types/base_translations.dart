abstract class BaseTranslations {
  final Map<String, String> keys;

  BaseTranslations({
    required String noInternet,
    required String unknownError,
    required String weakPassword,
    required String requiresRecentLogin,
    required String accountExistsWithDifferentCredential,
    required String invalidCredential,
    required String operationNotAllowed,
    required String userDisabled,
    required String userNotFound,
    required String wrongPassword,
    required String invalidVerificationCode,
    required String invalidVerificationId,
    required String invalidEmail,
    required String missingAndroidPkgName,
    required String missingContinueUri,
    required String missingIosBundleId,
    required String invalidContinueUri,
    required String unauthorizedContinueUri,
    required String emailAlreadyInUse,
    required String productNotFound,
    required String refreshPage,
    required String questionAccount,
    required String passwordTooltip,
    required String unselectTooltip,
    required String selectTooltip,
    required String deleteTooltip,
    required String or,
    required String all,
    required String changesSaved,
    required String close,
    required String change,
    required String error,
    required String more,
    required String enterValidData,
    required String utilsIsNicknameValid,
    required String utilsIsEmailValid,
    required String utilsIsPasswordValid,
    required String utilsIsImageValid,
    required String customTextFormFieldEmail,
    required String customTextFormFieldPassword,
    required String signup,
    required String login,
    required String loginWithEmail,
    required String resetPassword,
    required String discover,
    required String search,
    required String desired,
    required String menu,
    required String cart,
    required String notification,
    required String filter,
    required String profile,
    required String welcomeTitleOneLine,
    required String welcomeTitleTwoLine,
    required String loginTitle,
    required String loginContinue,
    required String loginWithEmailTitle,
    required String loginWithEmailQuestionPassword,
    required String signupTitle,
    required String signupNickname,
    required String signupRepeatPassword,
    required String signupRepeatPasswordValidate,
    required String signupQuestionAccount,
    required String resetPasswordTitle,
    required String resetPasswordDescription,
    required String resetPasswordSuccess,
    required String discoverEmptyProducts,
    required String cartTotal,
    required String cartCheckout,
    required String cartPiece,
    required String cartCheckoutReadyTitle,
    required String cartCheckoutReadyDescription,
    required String filterPrice,
    required String filterYearOfRelease,
    required String filterGenre,
    required String filterStylistics,
    required String filterPlatforms,
    required String filterMultiplayer,
    required String menuChangeNickname,
    required String menuChangeStatus,
    required String menuChangeAvatar,
    required String menuChangeBackground,
    required String menuChangePassword,
    required String menuSignOut,
    required String menuSettingsCategory,
    required String menuChangeLanguage,
    required String menuReceivedNotification,
    required String menuReceivedNewsletter,
    required String menuNicknameEnterNickname,
    required String menuStatusEnterStatus,
    required String menuPasswordEnterPassword,
    required String menuLanguageSelectLanguage,
    required String menuWaitingDialogWaiting,
    required String menuImagePickerBrowseGallery,
    required String menuImagePickerEnterUrl,
    required String menuStatusContentPickColor,
    required String profileContact,
    required String profileAchievements,
    required String profileFavoriteGames,
    required String profileOtherInformation,
    required String profileOtherInformationRegistrationDate,
    required String profileOtherInformationLastActivity,
    required String profilePurchases,
    required String productAddToCart,
    required String productAddToDesired,
    required String productTags,
    required String productPlatforms,
    required String productTabInformation,
    required String productTabDLCAndBundles,
    required String productTabSystemRequirements,
    required String productTabReviews,
    required String productInformationDescription,
    required String productInformationLocalization,
    required String productInformationOtherInformations,
    required String productInformationLinks,
    required String productInformationLanguage,
    required String productInformationLanguageSound,
    required String productInformationLanguageInterface,
    required String productInformationLanguageSubtitles,
    required String productInformationOtherDeveloper,
    required String productInformationOtherPublisher,
    required String productInformationOtherReleaseDate,
    required String productDLC,
    required String productBundle,
    required String productSystemRequirementsMinimum,
    required String productSystemRequirementsRecommended,
  }) : keys = {
          //Error messages
          'noInternet': noInternet,
          'unknownError': unknownError,
          'weakPassword': weakPassword,
          'requiresRecentLogin': requiresRecentLogin,
          'accountExistsWithDifferentCredential':
              accountExistsWithDifferentCredential,
          'invalidCredential': invalidCredential,
          'operationNotAllowed': operationNotAllowed,
          'userDisabled': userDisabled,
          'userNotFound': userNotFound,
          'wrongPassword': wrongPassword,
          'invalidVerificationCode': invalidVerificationCode,
          'invalidVerificationId': invalidVerificationId,
          'invalidEmail': invalidEmail,
          'missingAndroidPkgName': missingAndroidPkgName,
          'missingContinueUri': missingContinueUri,
          'missingIosBundleId': missingIosBundleId,
          'invalidContinueUri': invalidContinueUri,
          'unauthorizedContinueUri': unauthorizedContinueUri,
          'emailAlreadyInUse': emailAlreadyInUse,
          'productNotFound': productNotFound,
          //General text
          'refreshPage': refreshPage,
          'questionAccount': questionAccount,
          'passwordTooltip': passwordTooltip,
          'unselectTooltip': unselectTooltip,
          'selectTooltip': selectTooltip,
          'deleteTooltip': deleteTooltip,
          'or': or,
          'all': all,
          'changesSaved': changesSaved,
          'close': close,
          'change': change,
          'error': error,
          'more': more,
          'enterValidData': enterValidData,
          //Utils
          'utilsIsNicknameValid': utilsIsNicknameValid,
          'utilsIsEmailValid': utilsIsEmailValid,
          'utilsIsPasswordValid': utilsIsPasswordValid,
          'utilsIsImageValid': utilsIsImageValid,
          //Widgets
          'customTextFormFieldEmail': customTextFormFieldEmail,
          'customTextFormFieldPassword': customTextFormFieldPassword,
          //Pages name
          'signup': signup,
          'login': login,
          'loginWithEmail': loginWithEmail,
          'resetPassword': resetPassword,
          'discover': discover,
          'search': search,
          'desired': desired,
          'menu': menu,
          'cart': cart,
          'notification': notification,
          'filter': filter,
          'profile': profile,
          //Pages
          //Welcome
          'welcomeTitleOneLine': welcomeTitleOneLine,
          'welcomeTitleTwoLine': welcomeTitleTwoLine,
          //Login
          'loginTitle': loginTitle,
          'loginContinue': loginContinue,
          //Login with Email
          'loginWithEmailTitle': loginWithEmailTitle,
          'loginWithEmailQuestionPassword': loginWithEmailQuestionPassword,
          //Sign Up
          'signupTitle': signupTitle,
          'signupNickname': signupNickname,
          'signupRepeatPassword': signupRepeatPassword,
          'signupRepeatPasswordValidate': signupRepeatPasswordValidate,
          'signupQuestionAccount': signupQuestionAccount,
          //Reset Password
          'resetPasswordTitle': resetPasswordTitle,
          'resetPasswordDescription': resetPasswordDescription,
          'resetPasswordSuccess': resetPasswordSuccess,
          //Discover
          'discoverEmptyProducts': discoverEmptyProducts,
          //Cart
          'cartTotal': cartTotal,
          'cartCheckout': cartCheckout,
          'cartPiece': cartPiece,
          //Filter
          'filterPrice': filterPrice,
          'filterYearOfRelease': filterYearOfRelease,
          'filterGenre': filterGenre,
          'filterStylistics': filterStylistics,
          'filterPlatforms': filterPlatforms,
          'filterMultiplayer': filterMultiplayer,
          //Menu
          'menuChangeNickname': menuChangeNickname,
          'menuChangeStatus': menuChangeStatus,
          'menuChangeAvatar': menuChangeAvatar,
          'menuChangeBackground': menuChangeBackground,
          'menuChangePassword': menuChangePassword,
          'menuSignOut': menuSignOut,
          'menuSettingsCategory': menuSettingsCategory,
          'menuChangeLanguage': menuChangeLanguage,
          'menuReceivedNotification': menuReceivedNotification,
          'menuReceivedNewsletter': menuReceivedNewsletter,
          'menuNicknameEnterNickname': menuNicknameEnterNickname,
          'menuStatusEnterStatus': menuStatusEnterStatus,
          'menuPasswordEnterPassword': menuPasswordEnterPassword,
          'menuLanguageSelectLanguage': menuLanguageSelectLanguage,
          'menuWaitingDialogWaiting': menuWaitingDialogWaiting,
          'menuImagePickerBrowseGallery': menuImagePickerBrowseGallery,
          'menuImagePickerEnterUrl': menuImagePickerEnterUrl,
          'menuStatusContentPickColor': menuStatusContentPickColor,
          //Profile
          'profileContact': profileContact,
          'profileAchievements': profileAchievements,
          'profileFavoriteGames': profileFavoriteGames,
          'profileOtherInformation': profileOtherInformation,
          'profileOtherInformationRegistrationDate':
              profileOtherInformationRegistrationDate,
          'profileOtherInformationLastActivity':
              profileOtherInformationLastActivity,
          'profilePurchases': profilePurchases,
          //Product
          'productAddToCart': productAddToCart,
          'productAddToDesired': productAddToDesired,
          'productTags': productTags,
          'productPlatforms': productPlatforms,
          'productTabInformation': productTabInformation,
          'productTabDLCAndBundles': productTabDLCAndBundles,
          'productTabSystemRequirements': productTabSystemRequirements,
          'productTabReviews': productTabReviews,
          'productInformationDescription': productInformationDescription,
          'productInformationLocalization': productInformationLocalization,
          'productInformationOtherInformations':
              productInformationOtherInformations,
          'productInformationLinks': productInformationLinks,
          'productInformationLanguage': productInformationLanguage,
          'productInformationLanguageSound': productInformationLanguageSound,
          'productInformationLanguageInterface':
              productInformationLanguageInterface,
          'productInformationLanguageSubtitles':
              productInformationLanguageSubtitles,
          'productInformationOtherDeveloper': productInformationOtherDeveloper,
          'productInformationOtherPublisher': productInformationOtherPublisher,
          'productInformationOtherReleaseDate':
              productInformationOtherReleaseDate,
          'productDLC': productDLC,
          'productBundle': productBundle,
          'productSystemRequirementsMinimum': productSystemRequirementsMinimum,
          'productSystemRequirementsRecommended':
              productSystemRequirementsRecommended,
        };
}
