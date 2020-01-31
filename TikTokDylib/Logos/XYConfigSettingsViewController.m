//
//  XYConfigSettingsViewController.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "XYConfigSettingsViewController.h"
#import "XYAwemeManager.h"

@interface XYConfigSettingsNomalCell : UITableViewCell

@property (nonatomic, strong) UISwitch *powerSwitch;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) void (^ powerChangeBlock)(UISwitch *powerSwitch);

@end

@interface XYConfigSettingsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray<NSDictionary *>* areaLists;
@property (nonatomic, copy) NSArray *normalSettingTitle;
@property (nonatomic, assign) NSInteger selectedRow;
@property (nonatomic, assign) BOOL noWatermark;
@property (nonatomic, assign) BOOL noEndWatermark;
@property (nonatomic, assign) BOOL isNoPreventDownload;
@property (nonatomic, assign) BOOL isAutoPlayNext;
@property (nonatomic, assign) BOOL isPureMode;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XYConfigSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFile = [bundle pathForResource:@"countryCode" ofType:@"plist"];
    self.areaLists = [NSArray arrayWithContentsOfFile:plistFile];
    self.normalSettingTitle = @[@"移除下载限制", @"移除水印", @"移除结尾水印", @"自动播放下一个", @"开启首页纯视频模式"];
    
    self.isNoPreventDownload =  [XYAwemeManager manager].isRemovePreventDownload;
    self.noWatermark = [XYAwemeManager manager].isRemovedWatermark;
    self.noEndWatermark = [XYAwemeManager manager].isRemovedEndWatermark;
    self.isAutoPlayNext = [XYAwemeManager manager].isAutoPlayNext;
    self.isPureMode = [XYAwemeManager manager].isPureMode;
    
    [self setupUI];
    
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
    self.title = @"我的配置";
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    footerView.backgroundColor = [UIColor clearColor];
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, self.view.bounds.size.width - 30, 140)];
    infoLabel.numberOfLines = 0;
    infoLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
    infoLabel.textColor = [UIColor lightGrayColor];
    infoLabel.text = @"enba.com by xiaoyuan.";
    infoLabel.textAlignment = NSTextAlignmentRight;
    [footerView addSubview:infoLabel];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = footerView;
    
    self.selectedRow = NSNotFound;
    NSString *countryCode = [[XYAwemeManager manager] countryCode];
    for (NSInteger index = 0; index < self.areaLists.count; index ++) {
        NSDictionary *dataDic = self.areaLists[index];
        if ([countryCode.lowercaseString isEqualToString:[dataDic[@"code"] lowercaseString]]) {
            self.selectedRow = index;
            break;
        }
    }
    
    [self.tableView reloadData];
    if (self.selectedRow != NSNotFound) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedRow inSection:1] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        });
    }
    
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
    [XYAwemeManager manager].isRemovePreventDownload = self.isNoPreventDownload;
    [XYAwemeManager manager].isRemovedWatermark = self.noWatermark;
    [XYAwemeManager manager].isRemovedEndWatermark = self.noEndWatermark;
    [XYAwemeManager manager].isAutoPlayNext = self.isAutoPlayNext;
    [XYAwemeManager manager].isPureMode = self.isPureMode;
    
    if (self.selectedRow != NSNotFound && ![[XYAwemeManager manager].countryCode.lowercaseString isEqualToString:[self.areaLists[self.selectedRow][@"code"] lowercaseString]]) {
        [XYAwemeManager manager].countryCode = self.areaLists[self.selectedRow][@"code"];
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"你修改了抖音在运行中的运营商地区，请谨慎" message:@"修改运营商区域需要重新app完成配置" preferredStyle:UIAlertControllerStyleAlert];
        [alertCon addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }]];
        [self presentViewController:alertCon animated:YES completion:nil];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)cancelAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)switchAction:(UISwitch *)sender {
    if (sender.tag == 1000) {
        self.isNoPreventDownload = sender.isOn;
    } else if (sender.tag == 1001) {
        self.noWatermark = sender.isOn;
    }
    else if (sender.tag == 1002) {
        self.noEndWatermark = sender.isOn;
    }
    else if (sender.tag == 1003) {
        self.isAutoPlayNext = sender.isOn;
    }
    else if (sender.tag == 1004) {
        self.isPureMode = sender.isOn;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        XYConfigSettingsNomalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYConfigSettingsNomalCell" forIndexPath:indexPath];
        cell.powerSwitch.tag = 1000 + indexPath.row;
        cell.titleLabel.text = self.normalSettingTitle[indexPath.row];
        cell.backgroundColor = self.view.backgroundColor;
        __weak typeof(self) weakSelf = self;
        cell.powerChangeBlock = ^(UISwitch *powerSwitch) {
            [weakSelf switchAction:powerSwitch];
        };
        if (indexPath.row == 0) {
            cell.powerSwitch.on = self.isNoPreventDownload;
        } else if (indexPath.row == 1) {
            cell.powerSwitch.on = self.noWatermark;
        }
        else if (indexPath.row == 2) {
            cell.powerSwitch.on = self.noEndWatermark;
        }
        else if (indexPath.row == 3) {
            cell.powerSwitch.on = self.isAutoPlayNext;
        }
        else if (indexPath.row == 4) {
            cell.powerSwitch.on = self.isPureMode;
        }
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"areaCell" forIndexPath:indexPath];
        NSDictionary *dataDic = self.areaLists[indexPath.row];
        cell.textLabel.text = dataDic[@"area"];
        cell.backgroundColor = self.view.backgroundColor;
        cell.textLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
        cell.tintColor = [UIColor colorWithRed:254 / 255.0 green:44 / 255.0 blue:85 / 255.0 alpha:1];
        if (self.selectedRow == indexPath.row) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 40)];
    titleLabel.numberOfLines = 0;
    [headerView addSubview:titleLabel];
    titleLabel.font = [UIFont fontWithName:@"ProximaNova-Bold" size:13.0];
    titleLabel.textColor = [UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:0.34];
    if (section == 0) {
        titleLabel.text = @"配置";
    } else if (section == 1) {
        titleLabel.text = @"切换 运营商国家/地区";
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.normalSettingTitle.count;
    } else {
        return self.areaLists.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        self.selectedRow = indexPath.row;
        [tableView reloadData];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *areaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        [self.view addSubview:areaTableView];
        [areaTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"areaCell"];
        [areaTableView registerClass:[XYConfigSettingsNomalCell class] forCellReuseIdentifier:@"XYConfigSettingsNomalCell"];
        areaTableView.delegate = self;
        areaTableView.dataSource = self;
        areaTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        areaTableView.backgroundColor = [UIColor colorWithRed:22 / 255.0 green:24 / 255.0 blue:35 / 255.0 alpha:1];
        _tableView = areaTableView;
    }
    return _tableView;
}

@end


@implementation XYConfigSettingsNomalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.powerSwitch = [[UISwitch alloc] init];
        [self.powerSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.powerSwitch];
        
        
        self.titleLabel = [UILabel new];
        self.titleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
        self.titleLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:15.0];
        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints  = false;
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15.0].active = YES;
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:0.0].active = YES;
        [self.titleLabel.trailingAnchor constraintLessThanOrEqualToAnchor:self.powerSwitch.leadingAnchor constant:-5.0].active = YES;
        
        self.powerSwitch.translatesAutoresizingMaskIntoConstraints = false;
        [self.powerSwitch.centerYAnchor constraintEqualToAnchor:self.titleLabel.centerYAnchor].active = YES;
        [self.powerSwitch.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15.0].active = YES;
        
    }
    return self;
}

- (void)switchAction:(UISwitch *)sender {
    if (self.powerChangeBlock) {
        self.powerChangeBlock(sender);
    }
}

@end
