//
//  XYConfigSettingsViewController.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "XYConfigSettingsViewController.h"
#import "XYAwemeManager.h"
#import "MBProgressHUD+XYHUD.h"
#import "TikTokDylib-Swift.h"

#define kMENU_TITLE @"规则"

@class XYConfigSettingsItem;

@interface XYConfigSettingsSection : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray<XYConfigSettingsItem *> *items;
- (instancetype)initWithTitle:(NSString *)title items:(NSArray<XYConfigSettingsItem *> *)items;
@end

@interface XYConfigSettingsItem : NSObject

@end

@interface XYConfigSettingsSwitchItem : XYConfigSettingsItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isOn;
@property (nonatomic, copy) void (^ isOnChangeBlock)(XYConfigSettingsSwitchItem *item, UISwitch *sw);
@property (nonatomic, copy) void (^ saveBlock)(XYConfigSettingsSwitchItem *item);

- (instancetype)initWithTitle:(NSString *)title isOn:(BOOL)isOn isOnChangeBlock:(void (^)(XYConfigSettingsSwitchItem *item, UISwitch *sw))isOnChangeBlock saveBlock:(void (^)(XYConfigSettingsSwitchItem *item))saveBlock;

@end

@interface XYConfigSettingsAreaItem : XYConfigSettingsItem
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) BOOL isSelected;
- (instancetype)initWithTitle:(NSString *)title code:(NSString *)code isSelected:(BOOL)isSelected;
@end

@interface XYConfigSettingsInputItem : XYConfigSettingsItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) void (^ actionBlock)(XYConfigSettingsInputItem *item);

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text actionBlock:(void (^)(XYConfigSettingsInputItem *item))actionBlock;

@end

@interface XYConfigSettingsNextItem : XYConfigSettingsItem

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void (^ nextBlock)(XYConfigSettingsNextItem *item);

- (instancetype)initWithTitle:(NSString *)title nextBlock:(void (^)(XYConfigSettingsNextItem *item))nextBlock;

@end

@interface XYConfigSettingsSwitchCell : UITableViewCell

@property (nonatomic, strong) UISwitch *powerSwitch;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) XYConfigSettingsSwitchItem *item;

@end

@interface XYConfigSettingsNextCell : UITableViewCell

@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) XYConfigSettingsNextItem *item;

@end

@interface XYConfigSettingsInputCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *nextBtn;

@property (nonatomic, strong) XYConfigSettingsInputItem *item;

@end

@interface XYConfigSettingsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<XYConfigSettingsSection *> *items;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XYConfigSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"areaCell"];
    [self.tableView registerClass:[XYConfigSettingsSwitchCell class] forCellReuseIdentifier:@"XYConfigSettingsSwitchCell"];
    [self.tableView registerClass:[XYConfigSettingsInputCell class] forCellReuseIdentifier:@"XYConfigSettingsInputCell"];
    [self.tableView registerClass:[XYConfigSettingsInputCell class] forCellReuseIdentifier:@"XYConfigSettingsInputCell"];
    [self.tableView registerClass:[XYConfigSettingsNextCell class] forCellReuseIdentifier:@"XYConfigSettingsNextCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self setupData];
    
    [self setupUI];
    
}

- (void)setupData {
    __weak typeof(self) weakSelf = self;
    NSArray *items1 = @[
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"移除下载限制" isOn:[XYAwemeManager manager].isRemovePreventDownload isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isRemovePreventDownload = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"移除水印" isOn:[XYAwemeManager manager].isRemovedWatermark isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isRemovedWatermark = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"移除结尾水印" isOn:[XYAwemeManager manager].isRemovedEndWatermark isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isRemovedEndWatermark = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"自动播放下一个" isOn:[XYAwemeManager manager].isAutoPlayNext isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isAutoPlayNext = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"开启首页纯视频模式" isOn:[XYAwemeManager manager].isPureMode isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isPureMode = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"直播间纯模式" isOn:[XYAwemeManager manager].isLivePureMode isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isLivePureMode = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"隐藏直播间弹幕及各种动画" isOn:[XYAwemeManager manager].isHideLiveBarrages isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isHideLiveBarrages = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"用户作品播放最大限制" isOn:[XYAwemeManager manager].isMaxPlayLimitOfUserprofile isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isMaxPlayLimitOfUserprofile = item.isOn;
        }],
        [[XYConfigSettingsInputItem alloc] initWithTitle:@"单独执行" text:@"" actionBlock:^(XYConfigSettingsInputItem *item) {
            if (item.text.length < 6) {
                [weakSelf.view xy_hideHUD];
                [weakSelf.view xy_showMessage:@"user id 必须大于等于6位"];
                return;
            }
            [weakSelf dismissViewControllerAnimated:false completion:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (weakSelf.goUserProfileBlock != nil) {
                    weakSelf.goUserProfileBlock(item.text);
                }
            });
        }],
        [[XYConfigSettingsNextItem alloc] initWithTitle:@"查看评论" nextBlock:^(XYConfigSettingsNextItem *item) {
            XYCommentsViewController *vc = [[XYCommentsViewController alloc] initWithArray:[XYCommentManger shared].commentList.mutableCopy];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"关闭自动评论" isOn:[XYAwemeManager manager].isCloseAutoComment isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isCloseAutoComment = item.isOn;
        }],
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"关闭评论唯一性" isOn:[XYAwemeManager manager].isCloseUniqueComment isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isCloseUniqueComment = item.isOn;
        }],
        
        [[XYConfigSettingsSwitchItem alloc] initWithTitle:@"关闭关注" isOn:[XYAwemeManager manager].isCloseFollow isOnChangeBlock:^(XYConfigSettingsSwitchItem *item, UISwitch *sw) {
            item.isOn = sw.isOn;
        } saveBlock:^(XYConfigSettingsSwitchItem *item) {
            [XYAwemeManager manager].isCloseFollow = item.isOn;
        }],
    ];
    
    XYConfigSettingsSection *sec1 = [[XYConfigSettingsSection alloc] initWithTitle:@"基础配置" items:items1];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFile = [bundle pathForResource:@"countryCode" ofType:@"plist"];
    NSArray<NSDictionary *> *areaLists = [NSArray arrayWithContentsOfFile:plistFile];
    NSMutableArray<XYConfigSettingsAreaItem *> *areaItems = [NSMutableArray arrayWithCapacity:areaLists.count];
    NSString *currentCountryCode = [[[XYAwemeManager manager] countryCode] lowercaseString];
    [areaLists enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *code = [dict[@"code"] lowercaseString];
        NSString *title = dict[@"area"];
        [areaItems addObject:[[XYConfigSettingsAreaItem alloc] initWithTitle:title code:code isSelected:[currentCountryCode isEqualToString:code]]];
    }];
    
    XYConfigSettingsSection *sec2 = [[XYConfigSettingsSection alloc] initWithTitle:@"切换 运营商国家/地区" items:areaItems];
    
    self.items = @[sec2];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
    self.title = kMENU_TITLE;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    footerView.backgroundColor = [UIColor clearColor];
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, self.view.bounds.size.width - 30, 140)];
    infoLabel.numberOfLines = 0;
    infoLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
    infoLabel.textColor = [UIColor lightGrayColor];
    infoLabel.text = @"By Xiaoyuan.";
    infoLabel.textAlignment = NSTextAlignmentRight;
    [footerView addSubview:infoLabel];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = footerView;
    
    
    [self.tableView reloadData];
    
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [saveButton setTitle:@"完成" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTitleColor:[UIColor colorWithRed:254 / 255.0 green:44 / 255.0 blue:85 / 255.0 alpha:1] forState:UIControlStateNormal];
    saveButton.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:17.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveButton];
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitleColor:[UIColor colorWithRed:254 / 255.0 green:44 / 255.0 blue:85 / 255.0 alpha:1] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:17.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
}


- (void)saveAction {
    
    [self.items enumerateObjectsUsingBlock:^(XYConfigSettingsSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.items enumerateObjectsUsingBlock:^(XYConfigSettingsItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([item isKindOfClass:[XYConfigSettingsSwitchItem class]]) {
                XYConfigSettingsSwitchItem *model = (id)item;
                if (model.saveBlock != nil) {
                    model.saveBlock(model);
                }
            }
        }];
    }];
    
    XYConfigSettingsAreaItem *selectedItem = [self getSelectedAreaItem];
    if (selectedItem != nil && ![[XYAwemeManager manager].countryCode.lowercaseString isEqualToString:[selectedItem.code lowercaseString]]) {
        NSString *t = [NSString stringWithFormat:@"区域已修改为%@，请谨慎", selectedItem.title];
        [XYAwemeManager manager].countryCode = selectedItem.code;
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:t message:@"修改运营商区域需要重新app完成配置" preferredStyle:UIAlertControllerStyleAlert];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }]];
        [self presentViewController:alertCon animated:YES completion:nil];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (nullable XYConfigSettingsAreaItem *)getSelectedAreaItem {
    XYConfigSettingsSection *secObj = self.items.lastObject;
    NSUInteger index = [secObj.items indexOfObjectPassingTest:^BOOL(XYConfigSettingsItem *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[XYConfigSettingsAreaItem class]]) {
            XYConfigSettingsAreaItem *item = (id)obj;
            if (item.isSelected) {
                *stop = YES;
                return true;
            }
        }
        return false;
    }];
    if (secObj.items != nil && index != NSNotFound) {
        return (id)secObj.items[index];
    }
    return nil;
}

- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYConfigSettingsSection *secObj = self.items[indexPath.section];
    XYConfigSettingsItem *item = secObj.items[indexPath.row];
    if ([item isKindOfClass:[XYConfigSettingsAreaItem class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"areaCell" forIndexPath:indexPath];
        XYConfigSettingsAreaItem *model = (id)item;
        cell.textLabel.text = model.title;
        cell.backgroundColor = self.view.backgroundColor;
        cell.textLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
        cell.tintColor = [UIColor colorWithRed:254 / 255.0 green:44 / 255.0 blue:85 / 255.0 alpha:1];
        if (model.isSelected) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
    else if ([item isKindOfClass:[XYConfigSettingsInputItem class]]) {
        XYConfigSettingsInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYConfigSettingsInputCell" forIndexPath:indexPath];
        XYConfigSettingsInputItem *model = (id)item;
        cell.item = model;
        return cell;
    }
    else if ([item isKindOfClass:[XYConfigSettingsNextItem class]]) {
        XYConfigSettingsNextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYConfigSettingsNextCell" forIndexPath:indexPath];
        cell.item = (id)item;
        return cell;
    }
    else  {
        XYConfigSettingsSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYConfigSettingsSwitchCell" forIndexPath:indexPath];
        XYConfigSettingsSwitchItem *model = (id)item;
        cell.item = model;
        cell.backgroundColor = self.view.backgroundColor;
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 40)];
    titleLabel.numberOfLines = 0;
    [headerView addSubview:titleLabel];
    titleLabel.font = [UIFont fontWithName:@"ProximaNova-Bold" size:13.0];
    titleLabel.textColor = [UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:0.34];
    XYConfigSettingsSection *secObj = self.items[section];
    titleLabel.text = secObj.title;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XYConfigSettingsSection *secObj = self.items[section];
    return secObj.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XYConfigSettingsSection *secObj = self.items[indexPath.section];
    XYConfigSettingsItem *item = secObj.items[indexPath.row];
    
    if ([item isKindOfClass:[XYConfigSettingsAreaItem class]]) {
        XYConfigSettingsAreaItem *model = (XYConfigSettingsAreaItem *)item;
        
        [secObj.items enumerateObjectsUsingBlock:^(XYConfigSettingsItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[XYConfigSettingsAreaItem class]]) {
                XYConfigSettingsAreaItem *model = (XYConfigSettingsAreaItem *)obj;
                model.isSelected = NO;
            }
        }];
        model.isSelected = YES;
        [tableView reloadData];
    }
    
    if ([item isKindOfClass:[XYConfigSettingsNextItem class]]) {
        XYConfigSettingsNextItem *model = (id)item;
        if (model.nextBlock != nil) {
            model.nextBlock(model);
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    XYConfigSettingsSection *secObj = self.items[indexPath.section];
    XYConfigSettingsItem *item = secObj.items[indexPath.row];
    return [item isKindOfClass:[XYConfigSettingsAreaItem class]] || [item isKindOfClass:[XYConfigSettingsNextItem class]];
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView = tableView;
    }
    return _tableView;
}

@end


@implementation XYConfigSettingsSwitchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        [self.contentView addSubview:self.titleLabel];
        
        [self.powerSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.powerSwitch];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints  = false;
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.powerSwitch attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-5.0].active = true;
        
        self.powerSwitch.translatesAutoresizingMaskIntoConstraints = false;
        [NSLayoutConstraint constraintWithItem:self.powerSwitch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.powerSwitch attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15.0].active = true;
        
    }
    return self;
}

- (void)setItem:(XYConfigSettingsSwitchItem *)item {
    _item = item;
    self.titleLabel.text = item.title;
    self.powerSwitch.on = item.isOn;
}

- (void)switchAction:(UISwitch *)sender {
    if (self.item.isOnChangeBlock != nil) {
        self.item.isOnChangeBlock(self.item, sender);
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        _titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
    }
    return _titleLabel;
}

- (UISwitch *)powerSwitch {
    if (!_powerSwitch) {
        _powerSwitch = [[UISwitch alloc] init];
    }
    return _powerSwitch;
}
@end

@implementation XYConfigSettingsInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.nextBtn];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.textField.translatesAutoresizingMaskIntoConstraints = false;
        self.nextBtn.translatesAutoresizingMaskIntoConstraints = false;
        
        [self.nextBtn setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.nextBtn setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        
        [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:15.0].active = true;
        
        [self.nextBtn setTitle:@"开始" forState:UIControlStateNormal];
        [self.nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.textField.delegate = self;
        [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)setItem:(XYConfigSettingsInputItem *)item {
    _item = item;
    self.textField.text = item.text;
    self.titleLabel.text = item.title;
}

- (void)nextBtnClick:(UIButton *)sender {
    sender.userInteractionEnabled = false;
    self.item.text = self.textField.text;
    if (self.item.actionBlock) {
        self.item.actionBlock(self.item);
    }
    sender.userInteractionEnabled = true;
}

- (void)textFieldDidChange:(UITextField *)textField {
    self.item.text = textField.text;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        _titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.returnKeyType = UIReturnKeyGo;
        _textField.keyboardType = UIKeyboardTypeAlphabet;
        _textField.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.78];
        _textField.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:13.0];
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入抖音用户id" attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
    }
    return _textField;
    
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton new];
        _nextBtn.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:13.0];
        [_nextBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    }
    return _nextBtn;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self nextBtnClick:self.nextBtn];
    return YES;
}

@end

@implementation XYConfigSettingsSwitchItem

- (instancetype)initWithTitle:(NSString *)title isOn:(BOOL)isOn isOnChangeBlock:(void (^)(XYConfigSettingsSwitchItem *, UISwitch *))isOnChangeBlock saveBlock:(void (^)(XYConfigSettingsSwitchItem *))saveBlock {
    if (self = [super init]) {
        _isOn = isOn;
        _title = title;
        _isOnChangeBlock = isOnChangeBlock;
        _saveBlock = saveBlock;
    }
    return self;
}

@end


@implementation XYConfigSettingsItem

@end

@implementation XYConfigSettingsSection

- (instancetype)initWithTitle:(NSString *)title items:(NSArray *)items {
    if (self = [super init]) {
        _title = title;
        _items = [items mutableCopy];
    }
    return self;
}
@end

@implementation XYConfigSettingsAreaItem

- (instancetype)initWithTitle:(NSString *)title code:(NSString *)code isSelected:(BOOL)isSelected {
    if (self = [super init]) {
        _title = title;
        _code = code;
        _isSelected = isSelected;
    }
    return self;
}

@end

@implementation XYConfigSettingsInputItem

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text actionBlock:(void (^)(XYConfigSettingsInputItem *))actionBlock {
    if (self = [super init]) {
        _title = title;
        _text = text;
        _actionBlock = actionBlock;
    }
    return self;
}

@end

@implementation XYConfigSettingsNextItem

- (instancetype)initWithTitle:(NSString *)title nextBlock:(void (^)(XYConfigSettingsNextItem *item))nextBlock {
    if (self = [super init]) {
        _title = title;
        _nextBlock = nextBlock;
    }
    return self;
}

@end

@implementation XYConfigSettingsNextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.nextBtn];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        self.nextBtn.translatesAutoresizingMaskIntoConstraints = false;
        
        [self.nextBtn setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.nextBtn setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;

        
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15.0].active = true;
        [NSLayoutConstraint constraintWithItem:self.nextBtn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.titleLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:15.0].active = true;
        
        [self.nextBtn setImage:[UIImage imageNamed:@"iconPersonalSettingArrow_18x18_@2x"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setItem:(XYConfigSettingsNextItem *)item {
    _item = item;
    self.titleLabel.text = item.title;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        _titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
    }
    return _titleLabel;
}


- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton new];
        _nextBtn.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:13.0];
        [_nextBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        _nextBtn.userInteractionEnabled = false;
    }
    return _nextBtn;
}
@end
