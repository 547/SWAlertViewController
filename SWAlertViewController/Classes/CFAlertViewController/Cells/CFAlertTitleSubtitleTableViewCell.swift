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
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var titlesSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var contentBottomMargin: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var contentLeadingSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint Values
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var bottonLineLeadingSpace: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var bottonLineTrailing: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var bottonLineBottom: CGFloat = 0.0 {
        didSet {
            // Update Constraint
            updateConstraint()
            layoutIfNeeded()
        }
    }
    public var bottonLineHeight: CGFloat = 0.0 {
        didSet {
            // Update Constraint Values
            updateConstraint()
            layoutIfNeeded()
        }
    }
    
    
    
    // MARK: Private
    @IBOutlet private weak var titleLabelTopConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleLabelHeightConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleLeadingSpaceConstraint: NSLayoutConstraint?
    @IBOutlet private weak var titleSubtitleVerticalSpacingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var subtitleLabelBottomConstraint: NSLayoutConstraint?
    @IBOutlet private weak var subtitleLabelHeightConstraint: NSLayoutConstraint?
    
    
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
        updateConstraint()
    }
    private func updateConstraint() -> () {
        var titleCharCount = 0
        var titleHeight:CGFloat = 0
        if let text = titleLabel?.text, let width = titleLabel?.bounds.width, let font = titleLabel?.font {
            titleCharCount = text.count
            titleHeight = NSString.init(string: text).boundingRect(with: CGSize(width: width, height: .infinity), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).height
            
        }
        var subtitleCharCount = 0
        var subtitleHeight:CGFloat = 0
        if let text = subtitleLabel?.text, let width = subtitleLabel?.bounds.width, let font = subtitleLabel?.font   {
            subtitleCharCount = text.count
            subtitleHeight = NSString.init(string: text).boundingRect(with: CGSize(width: width, height: .infinity), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).height
        }
        
        
        titleLabelHeightConstraint?.constant = titleHeight
        titleLabelTopConstraint?.constant = contentTopMargin
        titleLeadingSpaceConstraint?.constant = contentLeadingSpace
        titleSubtitleVerticalSpacingConstraint?.constant = (titleCharCount > 0 && subtitleCharCount > 0) ?  titlesSpace : 0
        subtitleLabelBottomConstraint?.constant = contentBottomMargin
        subtitleLabelHeightConstraint?.constant = subtitleHeight
        
        bottonLineLeadingSpaceConstraint?.constant = bottonLineLeadingSpace
        bottonLineTrailingSpaceConstraint?.constant = bottonLineTrailing
        bottonLineBottomConstraint?.constant = bottonLineBottom
        bottonLineHeightConstraint?.constant = bottonLineHeight
    }
}
