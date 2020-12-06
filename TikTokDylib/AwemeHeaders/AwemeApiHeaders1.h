//
//  AwemeApiHeaders1.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/2/2.
//  Copyright © 2020 enba. All rights reserved.
//

#ifndef AwemeApiHeaders1_h
#define AwemeApiHeaders1_h

#import <UIKit/UIKit.h>

@class AWEUserModel, AWEProfileSettingSliderViewController, AWESettingSectionModel, DYRouterModel, DYPhoneNumberModel;

// 不重要的部分

@protocol AWEUserHomeViewControllerProtocol <NSObject>
- (void)clearVCIfNeed;
- (_Bool)isShowSliderMenuView;
- (void)refreshData;
- (long long)currentTab;
@end

// window 的 根控制器
@interface AWETabBarController : UITabBarController

@end

@interface AWESlidingTabButton : UIButton

@end

@protocol AWEProfileSettingSliderViewControllerProtocol <NSObject>
@property(copy, nonatomic) id didClickSettingCellBlock;
@property(copy, nonatomic) id dismissBlock;
- (void)updateViewsWithOriginX:(double)arg1;
- (void)updateTabBarImageView:(UIImageView *)arg1;
- (void)highlightItemWithType:(long long)arg1;
@end



/// 我的控制器
@interface AWEUserHomeViewController : UIViewController
// AWEProfileSettingSliderViewController
@property(retain, nonatomic) AWEProfileSettingSliderViewController<AWEProfileSettingSliderViewControllerProtocol> *profileSettingSliderVC;

- (void)rewardButtonClicked:(id)arg1;
- (void)addBtnClicked:(id)arg1;
- (void)task:(id)arg1 didEndWithResult:(long long)arg2 error:(id)arg3;
- (void)task:(id)arg1 didAppendWithInfo:(id)arg2;
- (void)task:(id)arg1 needResetWithInfo:(id)arg2;
- (void)teenModeDidChange:(_Bool)arg1 isLogout:(_Bool)arg2;
- (void)updateHeaderHeight;
- (void)changeSlidingTabWithLocation:(struct CGPoint)arg1;
- (id)awesst_enterFrom;
- (_Bool)p_shouldShowSwitchAccountVC;
- (id)p_tabVCForType:(long long)arg1;
- (void)p_fixOtherVCOffset:(double)arg1;
- (void)p_trackShow;
- (long long)currentTab;
@property(readonly, nonatomic) long long recommendCount;
@property(readonly, nonatomic) AWEUserModel *user;
- (void)handlePanGestureIfSliderShow:(_Bool)arg1 gestureRecognizer:(id)arg2;
- (_Bool)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2;
- (void)showSliderTrackerWithEnterMethod:(id)arg1;
- (void)sliderMenuAnimationWithOriginX:(double)arg1 duration:(double)arg2 showSlider:(_Bool)arg3 removeSliderVC:(_Bool)arg4 needTracker:(_Bool)arg5 highlightItemType:(long long)arg6;
- (void)_updateTabBarSnapshot;
- (void)addProfileSettingSliderVC;
- (void)showProfileSettingSliderVC;
- (void)showSliderMenu:(_Bool)arg1 animation:(_Bool)arg2 highlightItemType:(long long)arg3;
- (void)handleHideSliderPanGesture:(id)arg1;
- (void)hiddenUserRemoteYellowDot;
- (void)hiddenGenericYellowDot;
- (void)handleShowSliderPanGesture:(id)arg1;
- (void)removeSettingSliderMenu;
- (void)trackFansPushButtonShow:(id)arg1;
- (void)trackFansPushButtonClicked:(id)arg1;
- (void)shakeButtonClicked;
// 点击我的页面顶部展示 Slid 侧边抽屉控制器（这里面有我要找的设置按钮）
- (void)sliderMenuButtonClicked:(UIButton *)btn;
- (void)_openQRProfile;
- (void)qrcodeButtonClicked;
- (void)updateProfileAwemeCovers;
- (void)doSettings;
- (void)p_updateUserRemoteYellowDot;
- (void)updateGenericeOrderMoreHasNew;
- (void)slidingViewController:(id)arg1 didSelectIndex:(long long)arg2 transitionType:(long long)arg3;
- (id)slidingViewController:(id)arg1 viewControllerAtIndex:(long long)arg2;
- (long long)numberOfControllers:(id)arg1;
- (void)updateNeedEnterFullScreenNotification;
- (void)receivedNewFavoriteCountNotification:(id)arg1;
- (void)updateMultiUserUnreadCountNotification;
- (void)didFinishBindPhone;
- (void)didFinishUnFollowUser:(id)arg1 status:(long long)arg2 error:(id)arg3;
- (void)didFinishFollowUser:(id)arg1 status:(long long)arg2 error:(id)arg3;
- (void)didFinishLogout;
- (void)showEmotionFeedbackViewIfNeeded;
- (void)didFinishUpdateAwemeUser;
- (void)didFinishLogin;
- (void)p_updateCompletionPercent;
- (void)tipButtonTapped:(id)arg1;
- (void)enterProfileEditPage;
- (void)_showLocationAlertIfNeeded;
- (_Bool)_willShowLocationAlert;
- (void)didCompleteProfileInfo;
- (void)handleBridgeBroadcast:(id)arg1;
- (void)removeFans:(id)arg1;
- (void)willTerminateAPP:(id)arg1;
- (void)imSettingUpdated:(id)arg1;
- (void)applicationWillResignActive:(id)arg1;
- (void)didEnterProfileEditVC:(id)arg1;
- (void)shouldChangeLanguage:(id)arg1;
- (void)refreshPostWorkAfterNextAppear:(id)arg1;
- (void)p_refreshPostWork;
- (void)didClearAwemeDraft:(id)arg1;
- (void)didDeleteAwemeDraft:(id)arg1;
- (void)didCreateAwemeDraft:(id)arg1;
- (void)didPostRepost:(id)arg1;
- (void)didPostAweme:(id)arg1;
- (void)didChangeVideoPrivacy:(id)arg1;
- (void)didDeleteAweme:(id)arg1;
- (void)didDiggAweme:(id)arg1;

@end

@interface AWEChannelTabViewController : UIViewController

@end

@interface AWESettingBaseViewModel : NSObject
- (void)refreshAllCells;
- (id)itemModelWithType:(long long)arg1;
@property(retain, nonatomic) NSArray<AWESettingSectionModel *> *sectionDataArray; // @dynamic sectionDataArray;

@end


@interface AWEProfileSettingSliderViewModel : AWESettingBaseViewModel

- (void)setSectionDataArray:(id)arg1;
- (void)tapGenericOrderCell;
- (void)tapEPlatformCell;
- (void)trackEventFromPanel:(id)arg1;
- (void)dismissAnimation;
- (void)tapAdsEntranceCell;
- (void)tapPrivatePostsCell;
- (void)tapCollectionCell;
- (void)tapDouYinLabCell;
- (void)tapSettingCell;
- (void)tapTeenagerProtectionCell;
- (void)tapMerchantCell:(_Bool)arg1;
- (void)tapCardCouponCell:(_Bool)arg1;
- (void)tapIronManCell;
- (void)tapWalletCell;
- (void)tapFreeNetCardCell;
- (void)tapDouPlusOrderCell;
- (void)tapInsights;
- (void)tapProfileRingTone;
- (void)tapProfileOrderCell;
- (void)tapShopAssistantCell;
- (void)tapServiceAndOrderCell;
- (void)tapProfileCardCell;
- (void)tapShareProfileCell;
- (void)tapProfileEditCell;
- (void)_checkWhetherNeedShowShopAssistantYellowDot;
- (id)sectionDataArray;
- (void)viewWillAppear;

@end



@interface AWEProfileSettingSliderViewController : UIViewController

@property(nonatomic) _Bool isAccountOn; // @synthesize isAccountOn=_isAccountOn;
@property(retain, nonatomic) AWEProfileSettingSliderViewModel *viewModel; // @synthesize viewModel=_viewModel;
@property(retain, nonatomic) NSMutableArray *accountSection; // @synthesize accountSection=_accountSection;
@property(retain, nonatomic) UITableView *tableView;
@property(copy, nonatomic) id didClickSettingCellBlock;
@property(copy, nonatomic) id dismissBlock;
// 青少年模式即将改变
- (void)teenModeDidChange:(_Bool)arg1 isLogout:(_Bool)arg2;
- (void)didFinishUpdateAwemeUser;
- (void)didLoginFailed;
- (void)didFinishLogout;
- (void)didFinishLogin;
- (void)updateScrollEnableStatus;
- (void)dismissWithAnimation:(_Bool)arg1;
// 点击设置cell 响应的事件
- (void)settingsCellTapped;
- (void)serviceAndOrderCellTapped;
- (void)dismissAnimation:(id)arg1;
- (void)tapAccountCell;
- (void)_closeAccountList;
- (void)_openAccountList;
- (void)_toggleAccountListNeedAnimation:(_Bool)arg1;
- (void)_toggleAccountList;
- (void)_autoShowAccountListIfNeeded;
- (id)tableView:(id)arg1 viewForFooterInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForFooterInSection:(long long)arg2;
- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (void)tableView:(id)arg1 willDisplayCell:(id)arg2 forRowAtIndexPath:(id)arg3;
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (long long)numberOfSectionsInTableView:(id)arg1;
- (void)p_reloadAccountSection;

@end


@interface AWETabBarButton : UIButton
@property(retain, nonatomic) UITapGestureRecognizer *doubleTapGes;
@property(retain, nonatomic) UITapGestureRecognizer *singleTapGes;
@property(nonatomic) long long index;
- (void)doubleTapButton:(UITapGestureRecognizer *)arg1;
- (void)onTouchUpInside:(UITapGestureRecognizer *)arg1;

@end

@interface AWETabbarGeneralButton: AWETabBarButton

@end


@interface AWETabBarPlusButton : AWETabBarButton
@end


@interface AWESettingBaseViewController : UIViewController
@property(retain, nonatomic) UITableView *tableView;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (long long)tableView:(id)arg1 numberOfRowsInSection:(long long)arg2;
- (long long)numberOfSectionsInTableView:(id)arg1;
@property(readonly, nonatomic) AWESettingBaseViewModel *viewModel;
- (void)backBtnClick:(id)arg1;

@end

@interface AWESettingsTableViewController : AWESettingBaseViewController
+ (void)__awe__codeRunnerRun_64;
- (void)didLabelTapped:(id)arg1;
- (void)uidLabelTapped:(id)arg1;
- (void)didFinishLogout;
- (void)didFinishLogin;
- (void)didCancelLogin;
- (void)didLoginFailed;
- (void)didFinishFirstStepLogin;
@end

@interface DYQuickLoginView : UIView
// 其他手机号码登陆事件
- (void)SMSLoginAction;
- (void)quickLoginAction;
- (void)otherLoginAction;
- (void)SSOLogin:(unsigned long long)arg1;
- (id)initWithPhoneNumber:(id)arg1 carrierType:(long long)arg2;

@end



/// 快速登陆控制器
@interface DYQuickLoginViewController : UIViewController
@property(retain, nonatomic) DYRouterModel *routerModel; // @synthesize routerModel=_routerModel;
@property(retain, nonatomic) UIButton *helpButton; // @synthesize helpButton=_helpButton;
@property(retain, nonatomic) UIButton *closeButton; // @synthesize closeButton=_closeButton;
@property(retain, nonatomic) DYQuickLoginView *quickLoginView; // @synthesize quickLoginView=_quickLoginView;
@property(nonatomic) long long carrierType; // @synthesize carrierType=_carrierType;
@property(retain, nonatomic) DYPhoneNumberModel *phoneNumber; // @synthesize phoneNumber=_phoneNumber;
- (void)helpAction;
- (void)closeAction;
- (void)loginWithPlatform:(unsigned long long)arg1;
- (void)showToastWithModel:(id)arg1 platform:(unsigned long long)arg2;
- (void)SSOLoginWithPlatform:(unsigned long long)arg1;
- (void)showSMSLoginViewController;
- (void)quickLogin;
- (void)showLoginViewControllerWithBackStragety:(unsigned long long)arg1 ticket:(id)arg2;
- (void)handleLoginError:(id)arg1 ticket:(id)arg2;
- (void)showError:(id)arg1;
- (long long)preferredStatusBarStyle;
- (void)viewDidLoad;
- (id)initWithPhoneNumber:(id)arg1 carrier:(long long)arg2 routerModel:(id)arg3;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

@interface DYQuickLoginLoadingViewController: UIViewController

@end

@interface AWEAccountDeleteButton : UIButton

+ (id)buttonWithType:(long long)arg1 textField:(id)arg2;
@property(nonatomic, weak) __weak UITextField *textField;
- (void)deleteAction;
- (void)updateAction:(id)arg1;
- (void)_update;
- (void)setNeedsUpdate;
- (void)setup;
- (id)initWithTextFiled:(id)arg1;

@end

@interface SHSPhoneTextField : UITextField

@property(copy, nonatomic) id textDidChangeBlock; // @synthesize textDidChangeBlock=_textDidChangeBlock;
//@property(readonly) SHSPhoneNumberFormatter *formatter; // @synthesize formatter=_formatter;
- (id)phoneNumberWithoutPrefix;
- (id)phoneNumber;
- (void)setFormattedText:(id)arg1;
- (id)delegate;
- (void)setDelegate:(id)arg1;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)initWithCoder:(id)arg1;
- (void)logicInitialization;

@end


@interface DYPhoneNumberInputView : UIView
@property(retain, nonatomic) AWEAccountDeleteButton *deleteButton; // @synthesize deleteButton=_deleteButton;
//@property(retain, nonatomic) DYCountryCodeView *countryCodeView; // @synthesize countryCodeView=_countryCodeView;
@property(retain, nonatomic) SHSPhoneTextField *textField; // @synthesize textField=_textField;
@property(copy, nonatomic) NSString *text; // @synthesize text=_text;
@property(copy, nonatomic) id didChangeBlock; // @synthesize didChangeBlock=_didChangeBlock;
- (void)deleteButtonDidClick;
- (_Bool)textField:(id)arg1 shouldChangeCharactersInRange:(struct _NSRange)arg2 replacementString:(id)arg3;
- (void)textFieldDidEndEditing:(id)arg1;
- (_Bool)isFirstResponder;
- (_Bool)resignFirstResponder;
- (_Bool)canBecomeFirstResponder;
- (_Bool)becomeFirstResponder;
- (id)getAttributedPlaceholder:(id)arg1;
@property(retain, nonatomic) NSAttributedString *attributedPlaceholder;
@property(retain, nonatomic) DYPhoneNumberModel *phoneNumber; // @synthesize phoneNumber=_phoneNumber;
// 必须调一下此方法才能
- (void)didChangeValue;
- (id)initWithFrame:(struct CGRect)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end



@interface DYSMSLoginV2Step1ViewController : UIViewController

@property(retain, nonatomic) UIButton *otherLoginButton;
@property(retain, nonatomic) UIButton *passwordLoginButton;
@property(retain, nonatomic) UIButton *loginButton; // @synthesize loginButton=_loginButton;
// 输入手机号的inputView
@property(retain, nonatomic) DYPhoneNumberInputView *phoneNumberInputView; // @synthesize phoneNumberInputView=_phoneNumberInputView;
@property(retain, nonatomic) UILabel *hintLabel; // @synthesize hintLabel=_hintLabel;
@property(retain, nonatomic) UILabel *titleLabel; // @synthesize titleLabel=_titleLabel;
@property(retain, nonatomic) UIView *containerView; // @synthesize containerView=_containerView;
@property(retain, nonatomic) DYRouterModel *routerModel; // @synthesize routerModel=_routerModel;
- (void)otherLoginAction:(id)arg1;
- (void)passwordLoginAction:(id)arg1;
- (void)loginAction:(id)arg1;
- (void)helpAction;
- (void)closeAction;
- (void)ssoLoginForPlatform:(unsigned long long)arg1;
- (void)showToastWithModel:(id)arg1 platform:(unsigned long long)arg2;
- (void)loginWithPlatform:(unsigned long long)arg1;
- (long long)preferredStatusBarStyle;
- (void)viewDidLoad;
- (id)initWithContext:(id)arg1;

@end

@class NSString, SGMSafeGuardVerifySettingModel, SGMVerificationPopupView, UIActivityIndicatorView;
@protocol SGMVerificationProtocol <NSObject>
+ (id)sharedManager;
- (void)popupVerificationViewOfScene:(NSString *)arg1 type:(unsigned long long)arg2 languageCode:(NSString *)arg3 presentingView:(UIView *)arg4 callback:(void (^)(unsigned long long, NSString *, NSDictionary *))arg5;
- (void)onSDKInit:(void (^)(void))arg1;
@end

// 登陆时用到的图形验证码管理者
@interface SGMVerificationManager : NSObject <UIWebViewDelegate, SGMVerificationProtocol>


+ (id)currentHost;
+ (id)sharedManager;
@property(nonatomic) double startLoadTS; // @synthesize startLoadTS=_startLoadTS;
@property(retain, nonatomic) SGMSafeGuardVerifySettingModel *settingModel; // @synthesize settingModel=_settingModel;
@property(retain, nonatomic) UIActivityIndicatorView *indicatorView; // @synthesize indicatorView=_indicatorView;
@property(retain, nonatomic) SGMVerificationPopupView *view; // @synthesize view=_view;
@property(copy, nonatomic) id callback; // @synthesize callback=_callback;
- (void)callBackWithMethodID:(id)arg1 dic:(id)arg2 webview:(id)arg3;
- (_Bool)webView:(id)arg1 shouldStartLoadWithRequest:(id)arg2 navigationType:(long long)arg3;
- (void)webView:(id)arg1 didFailLoadWithError:(id)arg2;
- (void)webViewDidFinishLoad:(id)arg1;
- (void)webViewDidStartLoad:(id)arg1;
- (void)callBackWithStatus:(unsigned long long)arg1 scene:(id)arg2 infos:(id)arg3;
- (id)getSenselessToken;
- (void)onSenselessVerifyCreate;
- (void)popupVerificationViewOfScene:(id)arg1 type:(unsigned long long)arg2 languageCode:(id)arg3 presentingView:(id)arg4 callback:(id)arg5;
- (void)onSDKInit:(id)arg1;
- (void)fetchVerifyConfigWithCompletion:(id)arg1;
- (void)dismissPopupView;
- (void)startWithConfig:(id)arg1 delegate:(id)arg2;

@end

/// 图形验证码view 内部有一个webVidew 展示图形验证码的
@interface SGMVerificationPopupView : UIView <UIWebViewDelegate>


@property(retain, nonatomic) UIView *presentingView;
@property(retain, nonatomic) UITapGestureRecognizer *tapBGRec;
@property(retain, nonatomic) NSString *urlString;
@property(retain, nonatomic) UIWebView *webView;
@property(retain, nonatomic) UIWindow *backgroundWindow;
@property(copy, nonatomic) id didTapBGWindowBlk; // block
@property(nonatomic) unsigned long long type;
@property(retain, nonatomic) NSString *scene;
- (id)firstSupportLang;
- (id)HEXAColor:(id)arg1 alpha:(double)arg2;
- (id)getLogs;
- (void)reloadContent;
- (void)dismiss;
- (void)didTapBackgroundView;
- (void)adjustWebviewSize;
- (void)show;
- (void)delayShow;
- (void)dealloc;
- (void)deviceRotate:(id)arg1;
- (id)initWithType:(unsigned long long)arg1 scene:(id)arg2 languageCode:(id)arg3 model:(id)arg4 delegate:(id)arg5 presentingView:(id)arg6;
- (id)defaultRatioDic;
@end

@interface AWEUIResponder : NSObject
{
}

+ (id)topViewControllerForController:(id)arg1;
+ (id)topViewController;

@end

@protocol AWEProfilePreloadManagerProtocol <NSObject>
- (void)preloadPostWorksAndUserInfo:(NSString *)arg1;
@end


@interface AWEProfilePreloadManager : NSObject <AWEProfilePreloadManagerProtocol>
{
    _Bool _needDelayForUser;
    _Bool _needDelayForPostWorks;
    NSString *_userID;
    NSArray *_postWorksList;
    NSError *_postWorksError;
    AWEUserModel *_user;
    NSError *_userError;
    long long _userStatus;
    long long _postWorksStatus;
}

+ (id)sharedInstance;
- (void)p_preloadPostWorks;
- (void)p_preloadUserInfo;
- (void)loadPostWorksAfterEnterUserDetailWithSuccessCompletion:(id)block1 failCompletion:(id)block2;
- (void)loadUserAfterEnterUserDetailWithSuccessCompletion:(id)block1 failCompletion:(id)block2;
- (_Bool)hasPreload:(id)block2;
- (void)preloadPostWorksAndUserInfo:(NSString *)userInfo;
- (id)preloadedPostDataManager;
- (id)preloadedProfileResponse;
- (id)preloadedUser;

@end

@interface HTSEventForwardingView : UIView

- (id)viewForIdentifier:(id)arg1;
- (_Bool)containsSubview:(id)arg1;
- (void)addSubview:(id)arg1 identifier:(id)arg2;

@end

@interface HTSLivePopupContainer : HTSEventForwardingView <UIGestureRecognizerDelegate>
//{
//    long long _popupViewCount;
//    RACSubject *_stateDidChangedSubject;
//}

//@property(retain, nonatomic) RACSubject *stateDidChangedSubject;
@property(nonatomic) long long popupViewCount;
- (_Bool)gestureRecognizerShouldBegin:(id)arg1;
- (void)panned:(id)arg1;
- (void)addPanGesture;
//@property(readonly, nonatomic) RACSignal *stateDidChanged;
- (_Bool)hasPopup;
- (void)didAddSubview:(id)arg1;
- (void)clear;
- (void)willRemoveSubview:(id)arg1;

@end


@protocol IESLiveHierarchyContainerView;

@protocol HTSLiveViewHierarchyProvider <NSObject>
@property(nonatomic) struct UIEdgeInsets screenEdgeInsets;
- (struct UIEdgeInsets)containerEdgeInsets;
- (void)refreshLayout:(long long)arg1;
- (_Bool)touchAtEmptyPlace:(UITouch *)arg1;
- (UIButton *)closeButton;
- (UIViewController *)rootViewController;
// 直播间的视频播放器，这个不能隐藏
- (UIView *)mediaContainer;
// 直播间的评论列表及其他的容器视图，可隐藏
- (UIView<IESLiveHierarchyContainerView> *)contentContainer;
// 一些弹幕动画容器视图，比如送礼物的弹幕或加粉丝团的弹幕容器视图
- (UIView<IESLiveHierarchyContainerView> *)rtlNormalMediaDecorationContainer;
- (UIView<IESLiveHierarchyContainerView> *)mediaDecorationContainer;
- (UIView<IESLiveHierarchyContainerView> *)rtlNormalMediaContainer;
- (UIView<IESLiveHierarchyContainerView> *)rtlNormalContentContainer;
- (UIView<IESLiveHierarchyContainerView> *)rtlNormalAnimationContainer;
- (UIView<IESLiveHierarchyContainerView> *)animationContainer;
- (UIView<IESLiveHierarchyContainerView> *)keyboardContainer;
- (HTSLivePopupContainer *)popupContainer;
- (UIView *)containerView;
@end

// 直播间的容器视图
@interface HTSLive4LayerContainerView : UIView <HTSLiveViewHierarchyProvider>


- (struct UIEdgeInsets)containerEdgeInsets;
@property(readonly, nonatomic) __weak UIView *containerView;
- (_Bool)touchAtEmptyPlace:(id)arg1;
- (void)refreshLayout:(long long)arg1;
- (void)prepareForReuse;
- (id)initWithInsets:(struct UIEdgeInsets)arg1;
- (id)initWithFrame:(struct CGRect)arg1;

@end


#endif /* AwemeApiHeaders1_h */
