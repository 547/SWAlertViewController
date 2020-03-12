//
//  CFAlertActionTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Shivam Bhalla on 1/19/17.
//  Copyright © 2017 Codigami Inc. All rights reserved.
//

import UIKit


public protocol CFAlertActionTableViewCellDelegate: class {
    func alertActionCell(_ cell: UITableViewCell, didClickAction action: CFAlertAction?)
}


public class CFAlertActionTableViewCell: UITableViewCell {
    // MARK: Public
    public static func identifier() -> String    {
        return String(describing: CFAlertActionTableViewCell.self)
    }
    public weak var delegate: CFAlertActionTableViewCellDelegate?
    public var actionButtonTopMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonTopConstraint?.constant = actionButtonTopMargin
            layoutIfNeeded()
        }
    }
    public var actionButtonBottomMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonBottomConstraint?.constant = actionButtonBottomMargin
            layoutIfNeeded()
        }
    }
    
    public var actionButtonLeftMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonLeadingConstraint?.constant = actionButtonLeftMargin
            layoutIfNeeded()
        }
    }
    public var actionButtonRightMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonTrailingConstraint?.constant = actionButtonRightMargin
            layoutIfNeeded()
        }
    }

    public var actionButtonHeight: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionButtonHeightConstraint?.constant = actionButtonHeight
            layoutIfNeeded()
        }
    }
    
    public var action: CFAlertAction? {
        didSet {
            
            if let action = self.action    {
                
                // Set Action Style
                var actionBackgroundColor: UIColor? = action.backgroundColor
                var actionTextColor: UIColor? = action.textColor
                let textFont = action.textFont
                let cornerRadius = action.cornerRadius
                let borderWidth = action.borderWidth
                let borderColor = action.borderColor
                
                switch action.style {
                    
                case .Cancel:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_CANCEL_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_CANCEL_ACTION_TEXT_COLOR
                    }
                    actionButton?.backgroundColor = UIColor.clear
                    actionButton?.setTitleColor(actionTextColor, for: .normal)
                    actionButton?.layer.borderColor = actionBackgroundColor?.cgColor
                    actionButton?.layer.borderWidth = 1.0
                    
                    
                case .Destructive:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_DESTRUCTIVE_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_DESTRUCTIVE_ACTION_TEXT_COLOR
                    }
                    actionButton?.backgroundColor = actionBackgroundColor
                    actionButton?.setTitleColor(actionTextColor, for: .normal)
                    actionButton?.layer.borderColor = nil
                    actionButton?.layer.borderWidth = 0.0
                    
                default:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_DEFAULT_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_DEFAULT_ACTION_TEXT_COLOR
                    }
                    actionButton?.backgroundColor = actionBackgroundColor
                    actionButton?.setTitleColor(actionTextColor, for: .normal)
                    actionButton?.layer.borderColor = nil
                    actionButton?.layer.borderWidth = 0.0
                }
                
                if let font = textFont {
                    actionButton?.titleLabel?.font = font
                }
                if let cornerRadius = cornerRadius {
                    actionButton?.layer.cornerRadius = cornerRadius
                    actionButton?.clipsToBounds = true
                }
                if let borderWidth = borderWidth {
                    actionButton?.layer.borderWidth = borderWidth
                }
                if let borderColor = borderColor {
                    actionButton?.layer.borderColor = borderColor.cgColor
                }
                
                // Set Alignment
                switch action.alignment {
                    
                case .right:
                    // Right Align
                    actionButtonLeadingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    actionButtonCenterXConstraint?.isActive = false
                    actionButtonTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .left:
                    // Left Align
                    actionButtonLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonCenterXConstraint?.isActive = false
                    actionButtonTrailingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .center:
                    // Center Align
                    actionButtonLeadingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    actionButtonCenterXConstraint?.isActive = true
                    actionButtonTrailingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                default:
                    // Justified Align
                    actionButtonLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionButtonCenterXConstraint?.isActive = false
                    actionButtonTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 15.0, left: 20.0, bottom: 15.0, right: 20.0)
                }
                
                // Set Title
                actionButton?.setTitle(self.action?.title, for: .normal)
            }
            else    {
                // Set Blank Title
                actionButton?.setTitle(nil, for: .normal)
            }
        }
    }
    
    // MARK: Private
    @IBOutlet private var actionButton: CFPushButton?
    @IBOutlet private weak var actionButtonTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonLeadingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonCenterXConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonTrailingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonBottomConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionButtonHeightConstraint: NSLayoutConstraint?
    
    
    // MARK: - Initialization Methods
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
        actionButton?.layer.cornerRadius = 6.0
        actionButton?.pushTransformScaleFactor = 0.9
    }
    
    
    // MARK: - Layout Methods
    public override func layoutSubviews() {
        super.layoutIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    
    // MARK: - Button Click Events
    @IBAction internal func actionButtonClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.alertActionCell(self, didClickAction: action)
        }
    }
    
}
