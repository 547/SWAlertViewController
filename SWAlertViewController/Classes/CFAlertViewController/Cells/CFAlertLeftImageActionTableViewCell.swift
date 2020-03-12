//
//  CFAlertLeftImageActionTableViewCell.swift
//  SWAlertViewController_Example
//
//  Created by SSD on 2020/3/12.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class CFAlertLeftImageActionTableViewCell: UITableViewCell {
    // MARK: Public
    public static func identifier() -> String    {
        return String(describing: CFAlertActionTableViewCell.self)
    }
    public weak var delegate: CFAlertActionTableViewCellDelegate?
    public var actionButtonTopMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionViewTopConstraint?.constant = actionButtonTopMargin
            layoutIfNeeded()
        }
    }
    public var actionButtonBottomMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionViewBottomConstraint?.constant = actionButtonBottomMargin
            layoutIfNeeded()
        }
    }
    
    public var actionButtonLeftMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionViewLeadingConstraint?.constant = actionButtonLeftMargin
            layoutIfNeeded()
        }
    }
    public var actionButtonRightMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionViewTrailingConstraint?.constant = actionButtonRightMargin
            layoutIfNeeded()
        }
    }

    public var actionButtonHeight: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            actionViewHeightConstraint?.constant = actionButtonHeight
            layoutIfNeeded()
        }
    }
    
    public var action: CFAlertAction? {
        didSet {
            
            if let action = self.action {
                
                // Set Action Style
                var actionBackgroundColor: UIColor? = action.backgroundColor
                var actionTextColor: UIColor? = action.textColor
                let textFont = action.textFont
                
                switch action.style {
                    
                case .Cancel:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_CANCEL_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_CANCEL_ACTION_TEXT_COLOR
                    }
                    contentView.backgroundColor = UIColor.clear
                    actionTitleLabel?.textColor = actionTextColor
                    
                    
                case .Destructive:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_DESTRUCTIVE_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_DESTRUCTIVE_ACTION_TEXT_COLOR
                    }
                    contentView.backgroundColor = actionBackgroundColor
                    actionTitleLabel?.textColor = actionTextColor
                    
                default:
                    if actionBackgroundColor == nil {
                        actionBackgroundColor = CFAlertColors.CF_DEFAULT_ACTION_COLOR
                    }
                    if actionTextColor == nil {
                        actionTextColor = CFAlertColors.CF_DEFAULT_ACTION_TEXT_COLOR
                    }
                    contentView.backgroundColor = actionBackgroundColor
                    actionTitleLabel?.textColor = actionTextColor
                }
                actionButton?.backgroundColor = contentView.backgroundColor
                if let font = textFont {
                    actionTitleLabel?.font = font
                }
                
                // Set Alignment
                switch action.alignment {
                    
                case .right:
                    // Right Align
                    actionViewLeadingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    actionViewCenterXConstraint?.isActive = false
                    actionViewTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .left:
                    // Left Align
                    actionViewLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionViewCenterXConstraint?.isActive = false
                    actionViewTrailingConstraint?.priority = UILayoutPriority(rawValue: 749.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                case .center:
                    // Center Align
                    actionViewLeadingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    actionViewCenterXConstraint?.isActive = true
                    actionViewTrailingConstraint?.priority = UILayoutPriority(rawValue: 750.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
                    
                default:
                    // Justified Align
                    actionViewLeadingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    actionViewCenterXConstraint?.isActive = false
                    actionViewTrailingConstraint?.priority = UILayoutPriority(rawValue: 751.0)
                    // Set Content Edge Inset
                    actionButton?.contentEdgeInsets = action.contentEdgeInsets ?? UIEdgeInsets.init(top: 15.0, left: 20.0, bottom: 15.0, right: 20.0)
                }
                
                // Set Title
                actionTitleLabel?.text = self.action?.title
                actionImageView?.image = self.action?.leftImage
            }else {
                // Set Blank Title
                actionTitleLabel?.text = nil
                actionImageView?.image = nil
            }
        }
    }

    // MARK: Private
    @IBOutlet private var actionView: UIView?
    @IBOutlet private var actionButton: CFPushButton?
    @IBOutlet private var actionImageView: UIImageView?
    @IBOutlet private var actionTitleLabel: UILabel?
    @IBOutlet private weak var actionViewTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionViewLeadingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionViewCenterXConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionViewTrailingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionViewBottomConstraint: NSLayoutConstraint?
    @IBOutlet private weak var actionViewHeightConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
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
        actionView?.layer.cornerRadius = 6.0
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
