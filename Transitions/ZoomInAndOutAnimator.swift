//
//  ZoomInAndOutAnimator.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/6/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class ZoomInAndOutAnimator: NSObject, UIViewControllerAnimatedTransitioning {

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
            performZoomInTransition(using: transitionContext)
        } else if operatorType == .pop {
            performZoomOutTransition(using: transitionContext)
        }
    }

    private func performZoomInTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("Zoom In")
    }
    
    private func performZoomOutTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("Zoom Out")
    }

}
