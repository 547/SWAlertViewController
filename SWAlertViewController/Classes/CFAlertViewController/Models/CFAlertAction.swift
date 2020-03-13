//
//  CFAlertAction.swift
//  CFAlertViewControllerDemo
//
//  Created by Shardul Patel on 18/01/17.
//  Copyright © 2017 Codigami Inc. All rights reserved.
//

import UIKit


open class CFAlertAction: NSObject, NSCopying {
    
    // MARK: - Declarations
    public typealias CFAlertActionHandlerBlock = (_ action: CFAlertAction) -> ()
    
    @objc public enum CFAlertActionStyle: Int {
        case Default = 0
        case Cancel
        case Destructive
    }
    
    @objc public enum CFAlertActionAlignment: Int {
        case justified = 0
        case right
        case left
        case center
    }
    
    // MARK: - Variables
    @objc public var title: String?
    @objc public var leftImage: UIImage?
    @objc public var style: CFAlertActionStyle = .Default
    @objc public var alignment: CFAlertActionAlignment = .justified
    @objc public var backgroundColor: UIColor?
    @objc public var textColor: UIColor?
    @objc public var handler: CFAlertActionHandlerBlock?
    
    @objc public var textFont: UIFont?
    public var cornerRadius:CGFloat? = nil
    @objc public var borderColor:UIColor?
    public var borderWidth:CGFloat? = nil
    public var contentEdgeInsets:UIEdgeInsets? = nil
    public var separationLineColor:UIColor? = nil
    public var separationLineLeading:CGFloat? = nil
    public var separationLineTrailing:CGFloat? = nil
    
    
    // MARK: - Initialisation Method
    public class func action(title: String?,
                                   leftImage: UIImage?,
                                   style: CFAlertActionStyle,
                                   alignment: CFAlertActionAlignment,
                                   backgroundColor: UIColor? = nil,
                                   textColor: UIColor? = nil,
                                   textFont: UIFont? = nil,
                                   cornerRadius:CGFloat? = nil,
                                   borderColor:UIColor? = nil,
                                   borderWidth:CGFloat? = nil,
                                   contentEdgeInsets:UIEdgeInsets? = nil,
                                   separationLineColor:UIColor? = nil,
                                   separationLineLeading:CGFloat? = nil,
                                   separationLineTrailing:CGFloat? = nil,
                                   handler: CFAlertActionHandlerBlock? = nil) -> CFAlertAction  {
        return CFAlertAction.init(title: title,
                                  leftImage: leftImage,
                                  style: style,
                                  alignment: alignment,
                                  backgroundColor: backgroundColor,
                                  textColor: textColor,
                                  textFont: textFont,
                                  cornerRadius: cornerRadius,
                                  borderColor: borderColor,
                                  borderWidth: borderWidth,
                                  separationLineColor: separationLineColor,
                                  separationLineLeading: separationLineLeading,
                                  separationLineTrailing: separationLineTrailing,
                                  contentEdgeInsets: contentEdgeInsets,
                                  handler: handler)
    }
    
    public convenience init(title: String?,
                                  leftImage: UIImage?,
                                  style: CFAlertActionStyle,
                                  alignment: CFAlertActionAlignment,
                                  backgroundColor: UIColor? = nil,
                                  textColor: UIColor? = nil,
                                  textFont: UIFont? = nil,
                                  cornerRadius:CGFloat? = nil,
                                  borderColor:UIColor? = nil,
                                  borderWidth:CGFloat? = nil,
                                  separationLineColor:UIColor? = nil,
                                  separationLineLeading:CGFloat? = nil,
                                  separationLineTrailing:CGFloat? = nil,
                                  contentEdgeInsets:UIEdgeInsets? = nil,
                                  handler: CFAlertActionHandlerBlock? = nil) {
        
        // Create New Instance Of Alert Controller
        self.init()
        
        // Set Alert Properties
        self.title = title
        self.leftImage = leftImage
        self.style = style
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.textFont = textFont
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.separationLineColor = separationLineColor
        self.separationLineLeading = separationLineLeading
        self.separationLineTrailing = separationLineTrailing
        self.contentEdgeInsets = contentEdgeInsets
        self.handler = handler
    }
    
    
    // MARK: - NSCopying
    public func copy(with zone: NSZone? = nil) -> Any {
        return CFAlertAction.init(title: title,
                                  leftImage: leftImage,
                                  style: style,
                                  alignment: alignment,
                                  backgroundColor: backgroundColor,
                                  textColor: textColor,
                                  textFont: textFont,
                                  cornerRadius: cornerRadius,
                                  borderColor: borderColor,
                                  borderWidth: borderWidth,
                                  separationLineColor:separationLineColor,
                                  separationLineLeading:separationLineLeading,
                                  separationLineTrailing:separationLineTrailing,
                                  handler: handler)
    }
    
    // MARK: - Dealloc
    deinit {
        
        // Remove Action Handler
        handler = nil
    }
}
