//
//  CFAlertDoubleActionTableViewCell.swift
//  FBSnapshotTestCase
//
//  Created by SSD on 2019/9/11.
//

import UIKit

public class CFAlertDoubleActionTableViewCell: UITableViewCell {

    // MARK: - Declarations
    public static func CF_DEFAULT_ACTION_COLOR() -> UIColor {
        return UIColor(red: CGFloat(41.0 / 255.0), green: CGFloat(198.0 / 255.0), blue: CGFloat(77.0 / 255.0), alpha: CGFloat(1.0))
    }
    public static func CF_DEFAULT_ACTION_TEXT_COLOR() -> UIColor {
        return UIColor.white
    }
    public static func CF_CANCEL_ACTION_COLOR() -> UIColor   {
        return UIColor.gray.withAlphaComponent(0.3)
    }
    public static func CF_CANCEL_ACTION_TEXT_COLOR() -> UIColor {
        return UIColor.gray
    }
    public static func CF_DESTRUCTIVE_ACTION_COLOR() -> UIColor  {
        return UIColor(red: CGFloat(255.0 / 255.0), green: CGFloat(75.0 / 255.0), blue: CGFloat(75.0 / 255.0), alpha: CGFloat(1.0))
    }
    public static func CF_DESTRUCTIVE_ACTION_TEXT_COLOR() -> UIColor {
        return UIColor.white
    }
    
    
    // MARK: - Variables
    // MARK: Public
    public static func identifier() -> String    {
        return String(describing: CFAlertActionTableViewCell.self)
    }
    public weak var delegate: CFAlertActionTableViewCellDelegate?
    public var actionButtonsTopMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonsTopConstraint?.constant = actionButtonsTopMargin
            layoutIfNeeded()
        }
    }
    public var actionButtonsBottomMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonsBottomConstraint?.constant = actionButtonsBottomMargin
            layoutIfNeeded()
        }
    }
    public var leftAction: CFAlertAction? {
        didSet {
            
            if let action = self.leftAction {
                
                // Set Action Style
                var actionBackgroundColor: UIColor? = action.backgroundColor
                var actionTextColor: UIColor? = action.textColor
                let textFont = action.textFont
                let cornerRadius = action.cornerRadius as? CGFloat
                let borderWidth = action.borderWidth as? CGFloat
                let borderColor = action.borderColor
                
                switch action.style {
                    
                case .Cancel:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_CANCEL_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_CANCEL_ACTION_TEXT_COLOR()
                    }
                    leftActionButton?.backgroundColor = UIColor.clear
                    leftActionButton?.setTitleColor(actionTextColor, for: .normal)
                    leftActionButton?.layer.borderColor = actionBackgroundColor?.cgColor
                    leftActionButton?.layer.borderWidth = 1.0
                    
                    
                case .Destructive:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_DESTRUCTIVE_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_DESTRUCTIVE_ACTION_TEXT_COLOR()
                    }
                    leftActionButton?.backgroundColor = actionBackgroundColor
                    leftActionButton?.setTitleColor(actionTextColor, for: .normal)
                    leftActionButton?.layer.borderColor = nil
                    leftActionButton?.layer.borderWidth = 0.0
                    
                default:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_DEFAULT_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_DEFAULT_ACTION_TEXT_COLOR()
                    }
                    leftActionButton?.backgroundColor = actionBackgroundColor
                    leftActionButton?.setTitleColor(actionTextColor, for: .normal)
                    leftActionButton?.layer.borderColor = nil
                    leftActionButton?.layer.borderWidth = 0.0
                }
                
                if let font = textFont {
                    leftActionButton?.titleLabel?.font = font
                }
                if let cornerRadius = cornerRadius {
                    leftActionButton?.layer.cornerRadius = cornerRadius
                    leftActionButton?.clipsToBounds = true
                }
                if let borderWidth = borderWidth {
                    leftActionButton?.layer.borderWidth = borderWidth
                }
                if let borderColor = borderColor {
                    leftActionButton?.layer.borderColor = borderColor.cgColor
                }
                
                // Set Alignment
                switch action.alignment {
                    
                case .right:
                    // Right Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    leftActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .left:
                    // Left Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    // Set Content Edge Inset
                    leftActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .center:
                    // Center Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    actionButtonsCenterXConstraint?.isActive = true
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    // Set Content Edge Inset
                    leftActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                default:
                    // Justified Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    leftActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 15.0, left: 20.0, bottom: 15.0, right: 20.0)
                }
                
                // Set Title
                leftActionButton?.setTitle(self.leftAction?.title, for: .normal)
            }
            else    {
                // Set Blank Title
                leftActionButton?.setTitle(nil, for: .normal)
            }
        }
    }
    public var rightAction: CFAlertAction? {
        didSet {
            
            if let action = self.rightAction {
                
                // Set Action Style
                var actionBackgroundColor: UIColor? = action.backgroundColor
                var actionTextColor: UIColor? = action.textColor
                let textFont = action.textFont
                let cornerRadius = action.cornerRadius as? CGFloat
                let borderWidth = action.borderWidth as? CGFloat
                let borderColor = action.borderColor
                
                switch action.style {
                    
                case .Cancel:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_CANCEL_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_CANCEL_ACTION_TEXT_COLOR()
                    }
                    rightActionButton?.backgroundColor = UIColor.clear
                    rightActionButton?.setTitleColor(actionTextColor, for: .normal)
                    rightActionButton?.layer.borderColor = actionBackgroundColor?.cgColor
                    rightActionButton?.layer.borderWidth = 1.0
                    
                    
                case .Destructive:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_DESTRUCTIVE_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_DESTRUCTIVE_ACTION_TEXT_COLOR()
                    }
                    rightActionButton?.backgroundColor = actionBackgroundColor
                    rightActionButton?.setTitleColor(actionTextColor, for: .normal)
                    rightActionButton?.layer.borderColor = nil
                    rightActionButton?.layer.borderWidth = 0.0
                    
                default:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertActionTableViewCell.CF_DEFAULT_ACTION_COLOR()
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertActionTableViewCell.CF_DEFAULT_ACTION_TEXT_COLOR()
                    }
                    rightActionButton?.backgroundColor = actionBackgroundColor
                    rightActionButton?.setTitleColor(actionTextColor, for: .normal)
                    rightActionButton?.layer.borderColor = nil
                    rightActionButton?.layer.borderWidth = 0.0
                }
                
                if let font = textFont {
                    rightActionButton?.titleLabel?.font = font
                }
                if let cornerRadius = cornerRadius {
                    rightActionButton?.layer.cornerRadius = cornerRadius
                    rightActionButton?.clipsToBounds = true
                }
                if let borderWidth = borderWidth {
                    rightActionButton?.layer.borderWidth = borderWidth
                }
                if let borderColor = borderColor {
                    rightActionButton?.layer.borderColor = borderColor.cgColor
                }
                
                // Set Alignment
                switch action.alignment {
                    
                case .right:
                    // Right Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    rightActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .left:
                    // Left Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    // Set Content Edge Inset
                    rightActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .center:
                    // Center Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    actionButtonsCenterXConstraint?.isActive = true
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    // Set Content Edge Inset
                    rightActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                default:
                    // Justified Align
                    actionButtonsLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonsCenterXConstraint?.isActive = false
                    actionButtonsTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    rightActionButton?.contentEdgeInsets = UIEdgeInsets.init(top: 15.0, left: 20.0, bottom: 15.0, right: 20.0)
                }
                
                // Set Title
                rightActionButton?.setTitle(self.leftAction?.title, for: .normal)
            }
            else    {
                // Set Blank Title
                rightActionButton?.setTitle(nil, for: .normal)
            }
        }
    }
    
    // MARK: Private
    @IBOutlet private var leftActionButton: CFPushButton?
    @IBOutlet private var rightActionButton: CFPushButton?
    @IBOutlet private weak var actionButtonsTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonsLeadingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonsCenterXConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonsSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonsTrailingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonsBottomConstraint: NSLayoutConstraint?

    public override func awakeFromNib() {
        super.awakeFromNib()
        basicInitialisation()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        basicInitialisation()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    internal func basicInitialisation() {
        // Set Action Button Properties
        leftActionButton?.layer.cornerRadius = 6.0
        leftActionButton?.pushTransformScaleFactor = 0.9
        rightActionButton?.layer.cornerRadius = 6.0
        rightActionButton?.pushTransformScaleFactor = 0.9
    }
    
    public override func layoutSubviews() {
        super.layoutIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    // MARK: - Button Click Events
    @IBAction internal func leftActionButtonClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.alertActionCell(self, didClickAction: leftAction)
        }
    }
    @IBAction internal func rightActionButtonClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.alertActionCell(self, didClickAction: rightAction)
        }
    }
}
