//
//  IconControl.swift
//  IconControl
//
//  Created by Frank McAuley on 11/11/15.
//


import UIKit
@IBDesignable

// Subclassing UIControl so that the class can access the Target Action feature
// UIControl is a subclass of UIView

class IconControl: UIControl {
    
    private lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(30.0, weight: UIFontWeightLight)
        return label
    }()
    
    private var spacingConstraint: NSLayoutConstraint!
    
    @IBInspectable
    var spacing : CGFloat = 20.0 {
        didSet {
            spacingConstraint?.constant = spacing
        }
    }
    
    // below are the two initializers that are always needed for UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInitialization()
    }
}

// API for control
extension IconControl {
    @IBInspectable
    var image : UIImage? {
        get {
            return imageView.image
        }
        set(newImage) {
            imageView.image = newImage?.imageWithRenderingMode(.AlwaysTemplate)
        }
    }
    @IBInspectable
    var text: String? {
        get {
            return label.text
        }
        set(newText) {
            label.text = newText
        }
    }
}

extension IconControl {
    private func sharedInitialization() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(imageView)
        
        label.textColor = tintColor
        
        
        spacingConstraint = label.leftAnchor.constraintEqualToAnchor(imageView.rightAnchor, constant: spacing)
        
        NSLayoutConstraint.activateConstraints([
            imageView.leadingAnchor.constraintEqualToAnchor(layoutMarginsGuide.leadingAnchor),
            imageView.topAnchor.constraintEqualToAnchor(layoutMarginsGuide.topAnchor),
            imageView.bottomAnchor.constraintEqualToAnchor(layoutMarginsGuide.bottomAnchor),
            spacingConstraint,
            label.rightAnchor.constraintEqualToAnchor(layoutMarginsGuide.rightAnchor),
            imageView.centerYAnchor.constraintEqualToAnchor(label.centerYAnchor)
        ])
        
        
        label.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)
        imageView.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)
        
        layer.cornerRadius = 10
    }
}

extension IconControl {
    private func addTapGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleIcontapped:")
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    func handleIcontapped(sender: UITapGestureRecognizer) {
        sendActionsForControlEvents(.TouchUpInside)
    }
}

extension IconControl {
    override func tintColorDidChange() {
        super.tintColorDidChange()
        label.textColor = tintColor
    }
}

