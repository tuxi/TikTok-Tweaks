//
//  SettingsSection.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/26.
//

import Foundation

enum SettingsSection {
    case basic(title: String, items: [Item])
    case area(title: String, items: [Item])
    
    enum Item {
        case normal(title: String, onNext: (() -> Void)?)
        case `switch`(title: String, isOn: Bool, isEnabled: Bool = true, onChanged: ((Bool) -> Void)?)
        case area(carrier: Carrier, isSelected: Bool)
    }
}

extension SettingsSection {
    var items: [Item] {
        switch self {
        case .basic(_, let items):
            return items
        case .area(_, let items):
            return items
        }
    }
    
    var title: String {
        switch self {
        case .basic(let title, _):
            return title
        case .area(let title, _):
            return title
        }
    }
}
