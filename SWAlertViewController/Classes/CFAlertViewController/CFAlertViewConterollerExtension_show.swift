//
//  CFAlertViewConterollerExtension_show.swift
//  SWAlertViewController_Example
//
//  Created by SSD on 2019/9/12.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
public extension CFAlertViewController {
    static func showAlter(title: String?,
                                 titleColor: UIColor?,
                                 message: String?,
                                 messageColor: UIColor?,
                                 titleFont: UIFont?,
                                 messageFont:UIFont?,
                                 titleAndMessageSpace:CGFloat?,
                                 textAlignment: NSTextAlignment,
                                 separationLineColor:UIColor? = nil,
                                 separationLineLeading:CGFloat? = nil,
                                 separationLineTrailing:CGFloat? = nil,
                                 textContentTopMargin:CGFloat? = nil,
                                 textContentBottomMargin:CGFloat? = nil,
                                 separationLineHeight:CGFloat? = nil,
                                 margin:CGFloat?,
                                 cornerRadius:CGFloat?,
                                 borderColor:UIColor?,
                                 borderWidth:CGFloat?,
                                 actionsLeading:CGFloat? = nil,
                                 actionsTrailing:CGFloat? = nil,
                                 actionsTop:CGFloat? = nil,
                                 actionsBottom:CGFloat? = nil,
                                 actionsSpace:CGFloat? = nil,
                                 actionsHeight:CGFloat? = nil,
                                 preferredStyle: CFAlertControllerStyle,
                                 actionsArrangement:CFAlertControllerActionsArrangement,
                                 headerView: UIView?,
                                 footerView: UIView?,
                                 backgroundStyle:CFAlertControllerBackgroundStyle = .plain,
                                 presentAnimated: Bool = true,
                                 actions: CFAlertAction...,
                                 presentFrom viewController: UIViewController,
                                 presentCompletion completion: (() -> Void)? = nil,
                                 didDismissAlertHandler dismiss: CFAlertViewControllerDismissBlock?) -> (){
        
        let alert = CFAlertViewController.init(title: title, titleColor: titleColor, message: message, messageColor: messageColor, titleFont: titleFont, messageFont: messageFont, titleAndMessageSpace: titleAndMessageSpace, textAlignment: textAlignment, separationLineColor: separationLineColor, separationLineLeading: separationLineLeading, separationLineTrailing: separationLineTrailing, textContentTopMargin: textContentTopMargin, textContentBottomMargin: textContentBottomMargin, separationLineHeight: separationLineHeight, margin: margin, cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, actionsLeading: actionsLeading, actionsTrailing: actionsTrailing, actionsTop: actionsTop, actionsBottom: actionsBottom, actionsSpace: actionsSpace, actionsHeight: actionsHeight, preferredStyle: preferredStyle, actionsArrangement: actionsArrangement, headerView: headerView, footerView: footerView, didDismissAlertHandler: dismiss)
        alert.backgroundStyle = backgroundStyle
        actions.forEach { (action) in
            alert.addAction(action)
        }
        viewController.present(alert, animated: presentAnimated, completion: completion)
    }
}
