//
//  UIButton+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation



///  UIButton Chain
extension UIButton {

    /// contentEdgeInsets
    ///
    /// - Parameter value: contentEdgeInsets value
    /// - Returns: Self
    public func contentEdgeInsets(_ value: UIEdgeInsets) -> Self {
        contentEdgeInsets = value
        return self
    }
    /// titleEdgeInsets
    ///
    /// - Parameter value: titleEdgeInsets value
    /// - Returns: Self
    public func titleEdgeInsets(_ value: UIEdgeInsets) -> Self {
        titleEdgeInsets = value
        return self
    }
    /// imageEdgeInsets
    ///
    /// - Parameter value: imageEdgeInsets value
    /// - Returns: Self
    public func imageEdgeInsets(_ value: UIEdgeInsets) -> Self {
        imageEdgeInsets = value
        return self
    }
    /// adjustsImageWhenHighlighted
    ///
    /// - Parameter value: adjustsImageWhenHighlighted value
    /// - Returns: Self
    public func adjustsImageWhenHighlighted(_ value: Bool) -> Self {
        adjustsImageWhenHighlighted = value
        return self
    }
    /// adjustsImageWhenDisabled
    ///
    /// - Parameter value: adjustsImageWhenDisabled value
    /// - Returns: Self
    public func adjustsImageWhenDisabled(_ value: Bool) -> Self {
        adjustsImageWhenDisabled = value
        return self
    }
    /// showsTouchWhenHighlighted
    ///
    /// - Parameter value: showsTouchWhenHighlighted value
    /// - Returns: Self
    public func showsTouchWhenHighlighted(_ value: Bool) -> Self {
        showsTouchWhenHighlighted = value
        return self
    }
    
    /// tintColor
    ///
    /// - Parameter value: tintColor value
    /// - Returns: Self
    public func tintColor(_ value: UIColor) -> Self {
        tintColor = value
        return self
    }

    /// settitle and state
    ///
    /// - Parameters:
    ///   - value: title
    ///   - state: state
    /// - Returns: Self
    public func setTitle(_ value: String, state: UIControlState) -> Self {
        setTitle(value, for: state)
        return self
    }

    /// setTitleColor
    ///
    /// - Parameters:
    ///   - value: title color
    ///   - state: state
    /// - Returns: Self
    public func setTitleColor(_ value: UIColor, state: UIControlState) -> Self {
        setTitleColor(value, for: state)
        return self
    }

    /// set Image for state
    ///
    /// - Parameters:
    ///   - value: image
    ///   - state: sate
    /// - Returns: Self
    public func setImage(_ value: UIImage, state: UIControlState) -> Self {
        setImage(value, for: state)
        return self
    }

    /// tilte shadow color fro state
    ///
    /// - Parameters:
    ///   - value: color
    ///   - state: sate
    /// - Returns: Self
    public func titleShadowColor(_ value: UIColor, state: UIControlState) -> Self {
        setTitleShadowColor(value, for: state)
        return self
    }

    /// background image for state
    ///
    /// - Parameters:
    ///   - image: image
    ///   - state: sate
    /// - Returns: Self
    public func backgroundImage(_ image: UIImage, state: UIControlState) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }

    /// attributed title for sate
    ///
    /// - Parameters:
    ///   - attr: attributed  title
    ///   - state: state
    /// - Returns: Self
    public func attributedTitle(_ attr: NSAttributedString, state: UIControlState) -> Self {
        setAttributedTitle(attr, for: state)
        return self
    }

    /// target action for control event
    ///
    /// - Parameters:
    ///   - target: target
    ///   - action: action
    ///   - forControlEvents: control event
    /// - Returns: Self
    public func target(_ target: AnyObject?, action: Selector, forControlEvents: UIControlEvents) -> Self {
        addTarget(target, action: action, for: forControlEvents)
        return self
    }

    /// target for control event
    ///
    /// - Parameters:
    ///   - controlEvents: controlEvent
    ///   - block: block
    /// - Returns: Self
    public func target(for controlEvents: UIControlEvents,_ block:@escaping ((_ sender:UIButton?) -> Void)) -> Self  {
        self.block = block
        self.addTarget(self, action: #selector(self.buttonAction), for: controlEvents)
        return self
    }
}
