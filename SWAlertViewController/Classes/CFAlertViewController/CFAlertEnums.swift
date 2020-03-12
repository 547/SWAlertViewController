//
//  CFAlertEnums.swift
//  SWAlertViewController_Example
//
//  Created by SSD on 2020/3/12.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
@objc public enum CFAlertControllerDismissReason : Int {
    case none = 0
    case onActionTap
    case onBackgroundTap
    case onInteractiveTransition
}

@objc public enum CFAlertControllerStyle : Int {
    case alert = 0
    case actionSheet
    case customActionSheet
    case notification
}
@objc public enum CFAlertControllerActionsArrangement : Int {
    ///每行显示1个按钮，可以显示N多个按钮
    case vertical = 0
    ///每行显示2个按钮，只可以显示2个按钮
    case horizontal
}
@objc public enum CFAlertControllerBackgroundStyle : Int {
    case plain = 0
    case blur
}
