//
//  SettingsCell.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/26.
//

import UIKit

class SettingsSwitchCell: UITableViewCell {
    
    lazy var sw = UISwitch()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        label.font = UIFont(name: "ProximaNova-Semibold", size: 15)
        return label
    }()
    
    var item: SettingsSection.Item? {
        didSet {
            if case let .switch(title, isOn, _) = item {
                titleLabel.text = title
                sw.isOn = isOn
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        contentView.addSubview(sw)
        contentView.addSubview(titleLabel)
        sw.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        sw.translatesAutoresizingMaskIntoConstraints = false
        
        sw.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: sw, attribute: .leading, multiplier: 1, constant: -5).isActive = true
        
        NSLayoutConstraint(item: sw, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: sw, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: sw, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
    }
    
    @objc private func switchAction(sender: UISwitch) {
        if case let .switch(_, _, onChanged) = item {
            onChanged?(sender.isOn)
        }
    }
}

class SettingsNormalCell: UITableViewCell {
    lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "ProximaNova-Semibold", size: 13)
        btn.setTitleColor(.red, for: .normal)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        label.font = UIFont(name: "ProximaNova-Semibold", size: 15)
        return label
    }()
    
    var item: SettingsSection.Item? {
        didSet {
            if case let .normal(title, _) = item {
                nextButton.setTitle(title, for: .normal)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        nextButton.isUserInteractionEnabled = false
        nextButton.setImage(UIImage(named: "iconPersonalSettingArrow_18x18_@2x"), for: .normal)
        contentView.addSubview(nextButton)
        contentView.addSubview(titleLabel)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: nextButton, attribute: .leading, multiplier: 1, constant: -5).isActive = true
        
        NSLayoutConstraint(item: nextButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: nextButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: nextButton, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 15).isActive = true
        
    }
}
