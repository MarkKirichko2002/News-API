//
//  UIDevice + Extensions.swift
//  News
//
//  Created by Марк Киричко on 08.06.2023.
//

import UIKit

extension UIDevice {
    static var hasDynamicIsland: Bool {
        ["iPhone 14 Pro", "iPhone 14 Pro Max"].contains(current.name)
    }
}
