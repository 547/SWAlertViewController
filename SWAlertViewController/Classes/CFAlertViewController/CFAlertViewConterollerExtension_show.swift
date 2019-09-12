//
//  CFAlertViewConterollerExtension_show.swift
//  SWAlertViewController_Example
//
//  Created by SSD on 2019/9/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
public extension CFAlertViewController {
    @discardableResult
    static func showAlert(title: String? = nil,
                                 titleColor: UIColor? = nil,
                                 message: String? = nil,
                                 messageColor: UIColor? = nil,
                                 titleFont: UIFont? = nil,
                                 messageFont:UIFont? = nil,
                                 titleAndMessageSpace:CGFloat? = nil,
                                 textAlignment: NSTextAlignment = .center,
                                 separationLineColor:UIColor? = nil,
                                 separationLineLeading:CGFloat? = nil,
                                 separationLineTrailing:CGFloat? = nil,
                                 textContentTopMargin:CGFloat? = nil,
                                 textContentBottomMargin:CGFloat? = nil,
                                 separationLineHeight:CGFloat? = nil,
                                 margin:CGFloat? = nil,
                                 cornerRadius:CGFloat? = nil,
                                 borderColor:UIColor? = nil,
                                 borderWidth:CGFloat? = nil,
                                 actionsLeading:CGFloat? = nil,
                                 actionsTrailing:CGFloat? = nil,
                                 actionsTop:CGFloat? = nil,
                                 actionsBottom:CGFloat? = nil,
                                 actionsSpace:CGFloat? = nil,
                                 actionsHeight:CGFloat? = nil,
                                 preferredStyle: CFAlertControllerStyle,
                                 actionsArrangement:CFAlertControllerActionsArrangement = .vertical,
                                 headerView: UIView? = nil,
                                 footerView: UIView? = nil,
                                 backgroundColor:UIColor? = nil,
                                 backgroundStyle:CFAlertControllerBackgroundStyle = .plain,
                                 shouldDismissOnBackgroundTap: Bool = true,
                                 presentAnimated: Bool = true,
                                 actions: [CFAlertAction],
                                 presentFrom viewController: UIViewController,
                                 presentCompletion completion: (() -> Void)? = nil,
                                 didDismissAlertHandler dismiss: CFAlertViewControllerDismissBlock?) -> CFAlertViewController{
        
        let alert = CFAlertViewController.init(title: title, titleColor: titleColor, message: message, messageColor: messageColor, titleFont: titleFont, messageFont: messageFont, titleAndMessageSpace: titleAndMessageSpace, textAlignment: textAlignment, separationLineColor: separationLineColor, separationLineLeading: separationLineLeading, separationLineTrailing: separationLineTrailing, textContentTopMargin: textContentTopMargin, textContentBottomMargin: textContentBottomMargin, separationLineHeight: separationLineHeight, margin: margin, cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, actionsLeading: actionsLeading, actionsTrailing: actionsTrailing, actionsTop: actionsTop, actionsBottom: actionsBottom, actionsSpace: actionsSpace, actionsHeight: actionsHeight, preferredStyle: preferredStyle, actionsArrangement: actionsArrangement, headerView: headerView, footerView: footerView, didDismissAlertHandler: dismiss)
        if let color = backgroundColor {
            alert.backgroundColor = color
        }
        alert.backgroundStyle = backgroundStyle
        alert.shouldDismissOnBackgroundTap = shouldDismissOnBackgroundTap
        actions.forEach { (action) in
            alert.addAction(action)
        }
        viewController.present(alert, animated: presentAnimated, completion: completion)
        return alert
    }
}
