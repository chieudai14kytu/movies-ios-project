//
//  PopInAndOutAnimator.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/5/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

protocol PushAndPopable {

    var scrollViewType: UIScrollView? { get }
    var sourceCell: UIView? { get }

}

class PopInAndOutAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    fileprivate let operatorType: UINavigationControllerOperation
    fileprivate let transitionDuration: TimeInterval

    init(operation: UINavigationControllerOperation) {
        self.operatorType = operation
        self.transitionDuration = 0.5
    }

    init(operation: UINavigationControllerOperation, transitionDuration: TimeInterval) {
        self.operatorType = operation
        self.transitionDuration = transitionDuration
    }

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if operatorType == .push {
            performPushTransition(using: transitionContext)
        } else if operatorType == .pop {
            performPopTransition(using: transitionContext)
        }
    }

    // MARK: - Push and Pop animation performers

    func performPushTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }

        let containerView = transitionContext.containerView

        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? PushAndPopable,
            let tableView = fromViewController.scrollViewType,
            let currentCell = fromViewController.sourceCell else {
            return
        }

        toViewController.tabBarController?.tabBar.isHidden = true

        containerView.addSubview(toView)

        let screenshotToView = UIImageView(image: toView.screenshot)
        screenshotToView.frame = currentCell.frame
        let containerCoord = tableView.convert(screenshotToView.frame.origin, to: containerView)
        screenshotToView.frame.origin = containerCoord

        let screenshotFromView = UIImageView(image: currentCell.screenshot)
        screenshotFromView.frame = screenshotToView.frame

        containerView.addSubview(screenshotToView)
        containerView.addSubview(screenshotFromView)

        toView.isHidden = true
        screenshotToView.isHidden = true

        let delayTime = DispatchTime.now() + Double(Int64(0.08 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            screenshotToView.isHidden = false
        }

        UIView.animate(withDuration: transitionDuration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {

            screenshotFromView.alpha = 0.0
            screenshotToView.frame = toView.frame
            screenshotToView.frame.origin = CGPoint.zero
            screenshotFromView.frame = screenshotToView.frame

        }, completion: { finished in

            screenshotToView.removeFromSuperview()
            screenshotFromView.removeFromSuperview()
            toView.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        })

    }

    func performPopTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let pushAndPopable = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? PushAndPopable,
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to),
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let tableView = pushAndPopable.scrollViewType,
            let currentCell = pushAndPopable.sourceCell else {
                return
        }

        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }

        if let _ = fromViewController as? MovieViewController {
            toViewController.blueNavigationBar()
            toViewController.tabBarController?.tabBar.isHidden = false
        }

        let containerView = transitionContext.containerView

        containerView.addSubview(toView)

        let screenshotFromView = UIImageView(image: fromView.screenshot)
        screenshotFromView.frame = fromView.frame

        let screenshotToView = UIImageView(image: currentCell.screenshot)
        screenshotToView.frame = screenshotFromView.frame

        containerView.addSubview(screenshotToView)
        containerView.insertSubview(screenshotFromView, belowSubview: screenshotToView)

        screenshotToView.alpha = 0.0
        fromView.isHidden = true
        currentCell.isHidden = true

        let containerCoord = tableView.convert(currentCell.frame.origin, to: containerView)

        UIView.animate(withDuration: transitionDuration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {

            screenshotToView.alpha = 1.0
            screenshotFromView.frame = currentCell.frame
            screenshotFromView.frame.origin = containerCoord
            screenshotToView.frame = screenshotFromView.frame

        }, completion: { finished in
            
            currentCell.isHidden = false
            screenshotToView.removeFromSuperview()
            screenshotFromView.removeFromSuperview()
            toView.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        })

    }

}














