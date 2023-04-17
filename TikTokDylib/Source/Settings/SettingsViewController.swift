//
//  SettingsViewController.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/26.
//

import UIKit

@objc(XYSettingsViewController)
final class SettingsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 22 / 255.0, green: 24 / 255.0, blue: 35 / 255.0, alpha: 1)
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    var sections: [SettingsSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func makeUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(
            ["H:|[tableView]|", "V:|[tableView]|"].flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: nil, views: ["tableView": tableView])
            }
        )
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "areaCell")
        tableView.register(SettingsSwitchCell.self, forCellReuseIdentifier: "SettingsSwitchCell")
        tableView.register(SettingsNormalCell.self, forCellReuseIdentifier: "SettingsNormalCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        
        title = "设置规则"
        view.backgroundColor = UIColor(red: 22/255.0, green: 24/255.0, blue: 35/255.0, alpha: 1.0)
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        footerView.backgroundColor = .clear
        
        let infoLabel = UILabel(frame: CGRect(x: 15, y: 30, width: view.frame.width - 30, height: 140))
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont(name: "ProximaNova-Semibold", size: 15)
        infoLabel.textColor = .gray
        infoLabel.text = "By Xiaoyuan."
        infoLabel.textAlignment = .right
        footerView.addSubview(infoLabel)
        tableView.tableFooterView = footerView
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupData() {
        
        let carriers = PreferenceManager.shared.carriers
        let currentCountryCode = PreferenceManager.shared.countryCode.lowercased()
        let areaItems = carriers.map { carrier -> SettingsSection.Item in
            let code = carrier.code.lowercased()
            return SettingsSection.Item.area(carrier: carrier, isSelected: currentCountryCode == code)
        }
        
        func resetSestions() {
            sections = [
                .basic(title: "基础配置", items: [
                    .switch(title: "无限制下载", isOn: PreferenceManager.shared.isUnlimitedDownload, onChanged: { isOn in
                        PreferenceManager.shared.isUnlimitedDownload = isOn
                    }),
                    .switch(title: "自动播放下一个（首页推荐列表）", isOn: PreferenceManager.shared.isAutoPlayNextVideoWhenPlayEnded, onChanged: { isOn in
                        PreferenceManager.shared.isAutoPlayNextVideoWhenPlayEnded = isOn
                        PreferenceManager.shared.isAutoPlayNextVideoWhenPlayLiveRoom = isOn
                        resetSestions()
                    }),
                    .switch(title: "开启首页纯视频模式", isOn: PreferenceManager.shared.isPureMode, onChanged: { isOn in
                        PreferenceManager.shared.isPureMode = isOn
                    }),
                    .switch(title: "是否播放广告", isOn: PreferenceManager.shared.shouldPlayAds, onChanged: { isOn in
                        PreferenceManager.shared.shouldPlayAds = isOn
                    }),
                    .switch(title: "一直显示进度条", isOn: PreferenceManager.shared.showProgressBar, onChanged: { isOn in
                        PreferenceManager.shared.showProgressBar = isOn
                    }),
                    .switch(title: "跳过5秒钟未查看直播（首页推荐列表）", isOn: PreferenceManager.shared.isAutoPlayNextVideoWhenPlayLiveRoom, isEnabled: PreferenceManager.shared.isAutoPlayNextVideoWhenPlayEnded, onChanged: { isOn in
                        PreferenceManager.shared.isAutoPlayNextVideoWhenPlayLiveRoom = isOn
                    }),
                    .switch(title: "开启摇一摇打开调试工具", isOn: PreferenceManager.shared.isDebugFLEXEnabled, onChanged: { isOn in
                        PreferenceManager.shared.isDebugFLEXEnabled = isOn
                    }),
                ]),
                .area(title: "切换 运营商国家/地区", items: areaItems)
            ]
            
            tableView.reloadData()
        }
        
        resetSestions()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sestion = sections[indexPath.section]
        let item = sestion.items[indexPath.row]
        switch item {
        case let .area(carrier, isSelected):
            let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath)
            cell.textLabel?.text = carrier.area
            cell.textLabel?.textColor = .white.withAlphaComponent(0.9)
            cell.textLabel?.font = UIFont(name: "ProximaNova-Semibold", size: 15)
            cell.backgroundColor = view.backgroundColor
            cell.selectionStyle = .none
            cell.tintColor = UIColor(red: 254/255.0, green: 44/255.0, blue: 85/255.0, alpha: 1.0)
            if isSelected {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        case .switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSwitchCell", for: indexPath) as! SettingsSwitchCell
            cell.item = item
            return cell
        case .normal:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsNormalCell", for: indexPath) as! SettingsNormalCell
            cell.item = item
            return cell
        }
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")!
        headerView.backgroundView = UIView()
        headerView.backgroundView?.backgroundColor = view.backgroundColor?.withAlphaComponent(0.8)
        headerView.backgroundColor = UIColor(red: 22/255.0, green: 35/255.0, blue: 35/255.0, alpha: 1.0)
        var titleLabel = headerView.viewWithTag(1000) as? UILabel
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 200, height: 40))
            titleLabel!.numberOfLines = 0
            headerView.addSubview(titleLabel!)
            titleLabel!.font = UIFont(name: "ProximaNova-Bold", size: 18)
            titleLabel!.textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.85)
            titleLabel!.tag = 1000
        }
        let item = sections[section]
        titleLabel?.text = item.title
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let sestion = sections[indexPath.section]
        let item = sestion.items[indexPath.row]
        switch item {
        case .switch:
            return false
        case .area, .normal:
            return true
        }
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sestion = sections[indexPath.section]
        let item = sestion.items[indexPath.row]
        switch item {
        case let .area(carrier, isSelected):
            if isSelected {
                return
            }
            PreferenceManager.shared.countryCode = carrier.code
            let alert = UIAlertController(title: "地区修改提醒", message: "区域已修改为\(carrier.area)，立即重启app以完成配置", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好的", style: .destructive, handler: { _ in
                exit(0)
            }))
            self.present(alert, animated: true, completion: nil)
        case .normal(_, let onNext):
            onNext?()
        default:
            break
        }
    }
}
