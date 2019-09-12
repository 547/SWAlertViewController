//
//  CFAlertTitleSubtitleTableViewCell.swift
//  CFAlertViewControllerDemo
//
//  Created by Shivam Bhalla on 1/19/17.
//  Copyright © 2017 Codigami Inc. All rights reserved.
//

import UIKit


public class CFAlertTitleSubtitleTableViewCell: UITableViewCell {
    
    // MARK: - Declarations
    
    
    // MARK: - Variables
    // MARK: Public
    public static func identifier() -> String    {
        return String(describing: CFAlertTitleSubtitleTableViewCell.self)
    }
    @IBOutlet public var titleLabel: UILabel?
    @IBOutlet public var subtitleLabel: UILabel?
    @IBOutlet weak var bottomLine: UIView!
    public var contentTopMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            titleLabelTopConstraint?.constant = contentTopMargin
            layoutIfNeeded()
        }
    }
    public var titlesSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            subtitleLabelTopConstraint?.constant = titlesSpace
            layoutIfNeeded()
        }
    }
    public var contentBottomMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            titleLabelBottomConstraint?.constant = contentBottomMargin
            subtitleLabelBottomConstraint?.constant = (titleLabelBottomConstraint?.constant)!
            layoutIfNeeded()
        }
    }
    public var contentLeadingSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint Values
            titleLeadingSpaceConstraint?.constant = contentLeadingSpace
            subtitleLeadingSpaceConstraint?.constant = (titleLeadingSpaceConstraint?.constant)!
            layoutIfNeeded()
        }
    }
    
    public var bottonLineTop: CGFloat = 0.0 {
        didSet {
            // Update Constraint
//            bottonLineTopConstraint?.constant = bottonLineTop
//            layoutIfNeeded()
        }
    }
    public var bottonLineLeadingSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            bottonLineLeadingSpaceConstraint?.constant = bottonLineLeadingSpace
            layoutIfNeeded()
        }
    }
    public var bottonLineTrailing: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            bottonLineTrailingSpaceConstraint?.constant = bottonLineTrailing
            layoutIfNeeded()
        }
    }
    public var bottonLineBottom: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            bottonLineBottomConstraint?.constant = bottonLineBottom
            layoutIfNeeded()
        }
    }
    public var bottonLineHeight: CGFloat = 0.0 {
        didSet {
            // Update Constraint Values
            bottonLineHeightConstraint?.constant = bottonLineHeight
            layoutIfNeeded()
        }
    }
    
    
    
    // MARK: Private
    @IBOutlet private weak var titleLabelTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleLeadingSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleLabelBottomConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleSubtitleVerticalSpacingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var subtitleLabelTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var subtitleLeadingSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var subtitleLabelBottomConstraint: NSLayoutConstraint?
    
    
//    @IBOutlet private weak var bottonLineTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottonLineLeadingSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottonLineTrailingSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottonLineBottomConstraint: NSLayoutConstraint?
    @IBOutlet private weak var bottonLineHeightConstraint: NSLayoutConstraint?
    
    // MARK: Initialization Methods
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
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
        
        // Reset Text and Color
        titleLabel?.text = nil
        subtitleLabel?.text = nil
        
        // Set Content Leading Space
        contentLeadingSpace = 20.0;
    }
    
    
    // MARK: - Layout Methods
    override public func layoutSubviews() {
        super.layoutIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    
    // MARK: Helper Methods
    public func setTitle(_ title: String?, titleColor: UIColor?, titleFont: UIFont?, subtitle: String?, subtitleColor: UIColor?, subtitleFont: UIFont?, bottomLineColor:UIColor?, alignment: NSTextAlignment) {
        
        // Set Cell Text Fonts & Colors
        titleLabel?.text = title
        titleLabel?.textColor = titleColor
        titleLabel?.font = titleFont
        titleLabel?.textAlignment = alignment
        subtitleLabel?.text = subtitle
        subtitleLabel?.textColor = subtitleColor
        subtitleLabel?.font = subtitleFont
        subtitleLabel?.textAlignment = alignment
        
        bottomLine.backgroundColor = bottomLineColor ?? UIColor.clear
        
        // Update Constraints
        var titleCharCount = 0
        if let count = titleLabel?.text?.count  {
            titleCharCount = count
        }
        var subtitleCharCount = 0
        if let count = subtitleLabel?.text?.count  {
            subtitleCharCount = count
        }
        
        if (titleCharCount <= 0 && subtitleCharCount <= 0) || subtitleCharCount <= 0 {
            titleLabelBottomConstraint?.isActive = true
            subtitleLabelTopConstraint?.isActive = false
            titleSubtitleVerticalSpacingConstraint?.constant = 0.0
        }
        else if titleCharCount <= 0 {
            titleLabelBottomConstraint?.isActive = false
            subtitleLabelTopConstraint?.isActive = true
            titleSubtitleVerticalSpacingConstraint?.constant = 0.0
        }
        else {
            titleLabelBottomConstraint?.isActive = false
            subtitleLabelTopConstraint?.isActive = false
            titleSubtitleVerticalSpacingConstraint?.constant = 5.0
        }
    }
}
