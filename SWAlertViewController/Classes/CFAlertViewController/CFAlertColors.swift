//
//  CFAlertColors.swift
//  SWAlertViewController_Example
//
//  Created by SSD on 2020/3/12.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
struct CFAlertColors {}
// MARK: - CFAlertViewController colors
extension CFAlertColors {
    static let CF_ALERT_DEFAULT_BACKGROUND_COLOR: UIColor = UIColor(white: 0.0, alpha: 0.7)
    static let CF_ALERT_DEFAULT_CONTAINER_VIEW_BACKGROUND_COLOR: UIColor = UIColor.white
    static let CF_ALERT_DEFAULT_TITLE_COLOR: UIColor = UIColor.black
    static let CF_ALERT_DEFAULT_MESSAGE_COLOR: UIColor = UIColor.darkGray
}
// MARK: - CFAlertAction colors
extension CFAlertColors {
    static let CF_DEFAULT_ACTION_COLOR: UIColor = UIColor(red: CGFloat(41.0 / 255.0), green: CGFloat(198.0 / 255.0), blue: CGFloat(77.0 / 255.0), alpha: CGFloat(1.0))
    static let CF_DEFAULT_ACTION_TEXT_COLOR: UIColor = UIColor.white
    static let CF_CANCEL_ACTION_COLOR: UIColor = UIColor.gray.withAlphaComponent(0.3)
    static let CF_CANCEL_ACTION_TEXT_COLOR: UIColor = UIColor.gray
    static let CF_DESTRUCTIVE_ACTION_COLOR: UIColor = UIColor(red: CGFloat(255.0 / 255.0), green: CGFloat(75.0 / 255.0), blue: CGFloat(75.0 / 255.0), alpha: CGFloat(1.0))
    static let CF_DESTRUCTIVE_ACTION_TEXT_COLOR: UIColor = UIColor.white
    
}
