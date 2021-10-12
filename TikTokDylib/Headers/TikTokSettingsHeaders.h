//
//  TikTokSettingsHeaders.h
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/10.
//

#import <UIKit/UIKit.h>

/*
 AWESettingsTableViewController 和 TTKSettingsViewController 都是设置控制器，不确定会跳转哪一个
 */

@interface TTKSettingsViewController: UIViewController
- (void)xy_goSettings;
- (void)xy_addSettingsBtn;
@end

@interface AWENavigationBar: UIView
@property(retain, nonatomic) UIView *contentView;
@end

@interface AWESettingsViewModel

- (void)tapContentPreferenceCell;
- (void)tapDataSaverCell;
- (void)tapRocketFansGroupCell;
- (void)tapFansCell;
- (void)tapToutiaoCell;
- (void)tapLinkAuthorizeCell;
- (void)tapSafetyCenterCell;
- (void)tapInsights;
- (void)tapCommunityGuidelinesCell;
- (void)tapGoodsGuideCell;
- (void)tapGoodsManagementCell;
- (void)tapWalletCell;
- (void)tapAddAccountCell;
- (void)logOut;
- (void)tapLogOutCell;
- (void)tapBetaTestCell;
- (void)tapNetDiagnoseCell;
- (void)tapCleanCacheCell;
- (void)tapAboutAmeCell;
- (void)tapUserServiceCell;
- (void)tapTeenModeCell;
- (void)tapTimeLockCell;
- (void)tapOneDaySettingCell;
- (void)tapGeneralSettingCell;
- (void)tapStarAtlasCell;
- (void)tapTeenagerProtectionCell;
- (void)tapHelpCenterCell;
- (void)tapImpressumCell;
- (void)tapCopyrightPolicyCell;
- (void)tapPrivacyPolicyCell;
- (void)tapConnectToAppleMusicCell;
- (void)tapAccessibilityCell;
- (void)tapIronManCell;
- (void)tapPushSettingCell;
- (void)tapFeedBackCell;
- (void)tapInviteFriendsCell;
- (void)tapAccountSiginInCell;
- (void)tapAccountManageCell;
- (void)tapSetOrChangePasswordCell;
- (void)logoutAction:(id)arg1;
- (void)tapGuidanceForParentsCell;
- (void)tapMyQRCodeCell;
- (void)tapShareProfileCell;
- (void)tapPrivacySettingCell;
- (void)updateSectionDataArray;
- (void)refreshAllCells;
// 数据源
@property(retain, nonatomic) NSArray *sectionDataArray;
- (id)sectionDataArray;

@end

@class AWESettingItemModel;

@interface AWESettingSectionModel

@property(copy, nonatomic) NSString *sectionFooterTitle;
@property(retain, nonatomic) NSArray<AWESettingItemModel *> *itemArray;
@property(nonatomic) double sectionHeaderHeight;
@property(copy, nonatomic) NSString *sectionHeaderTitle;
@property(nonatomic) long long type;

@end

@interface AWESettingItemModel: NSObject

@property(copy, nonatomic) id cellRefreshBlock;
@property(copy, nonatomic) id switchChangedBlock;
@property(copy, nonatomic) void(^cellTappedBlock)(void);
@property(nonatomic) double cellHeight;
@property(nonatomic) long long dotType;
@property(nonatomic) _Bool showDotView;
@property(nonatomic) _Bool isEnable;
@property(nonatomic) _Bool isSwitchOn;
@property(nonatomic) long long cellType;
@property(copy, nonatomic) UIImage *iconImage;
@property(copy, nonatomic) NSString *detail;
@property(copy, nonatomic) NSString *fancySubtitle;
@property(copy, nonatomic) NSString *subTitle;
@property(copy, nonatomic) NSString *title;
@property(nonatomic) long long type;
@property(retain, nonatomic) NSString *identifier;
@property(nonatomic) _Bool isSelect;

@end
