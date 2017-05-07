//
//  CommonExtension.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

extension UITableView {

    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }

    func registerHeaderFooterViewNib(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }

    func dequeue<T>(aClass: T.Type, forIndexPath indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: aClass.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(aClass.className)")
        }
        return cell
    }

    func dequeue<T>(aClass: T.Type) -> T where T: UITableViewHeaderFooterView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: aClass.className) as? T else {
            fatalError("Could not dequeue cell with identifier: \(aClass.className)")
        }
        return view
    }

}

extension UICollectionView {

    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }

    func dequeue<T>(aClass: T.Type, forIndexPath indexPath: IndexPath) -> T where T: UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: aClass.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(aClass.className)")
        }
        return cell
    }

    func registerReusableViewNib(viewClass: AnyClass, ofKind kind: String) {
        let identifier = String.className(aClass: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }

    func dequeue<T>(aClass: T.Type, ofKind kind: String, forIndexPath indexPath: IndexPath) -> T where T: UICollectionReusableView {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: aClass.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(aClass.className)")
        }
        return cell
    }

}

extension String {

    static var empty: String {
        return ""
    }

    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }

}

extension NSObject {

    public var className: String {
        return type(of: self).className
    }

    public static var className: String {
        return String.className(aClass: self)
    }

}

extension Int {

    static var zero: Int {
        return 0
    }

}

extension Double {

    static var zero: Double {
        return 0.0
    }

}

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

extension UIViewController {
    
    func transparentNavigationBar() {
        guard let navVC = parent as? UINavigationController else {
            return
        }
        navVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navVC.navigationBar.shadowImage = UIImage()
        navVC.navigationBar.isTranslucent = true
        navVC.navigationBar.backgroundColor = UIColor.clear
    }

    func blueNavigationBar() {
        guard let navVC = parent as? UINavigationController else {
            return
        }
        navVC.navigationBar.setBackgroundImage(nil, for: .default)
        navVC.navigationBar.shadowImage = nil
        navVC.navigationBar.isTranslucent = true
        navVC.navigationBar.backgroundColor = UIColor(red: 51/255, green: 152/255, blue: 219/255, alpha: 1)
        navVC.navigationBar.barTintColor = UIColor(red: 51/255, green: 152/255, blue: 219/255, alpha: 1)
    }

}

extension UIView {

    var screenshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        if let tableView = self as? UITableView {
            tableView.superview!.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else if let collectionView = self as? UICollectionView {
            collectionView.superview!.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {
            layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }

    class func topVC(vc: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = vc as? UINavigationController {
            return topVC(vc: nav.visibleViewController)
        }

        if let presnted = vc?.presentedViewController {
            return topVC(vc: presnted)
        }

        return vc
    }
}






















