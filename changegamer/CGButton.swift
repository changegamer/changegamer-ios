//
//  CGButton.swift
//  changegamer
//
//  Created by Kenan Pulak on 10/15/16.
//  Copyright © 2016 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit
import pop

class CustomButton: UIButton {
    
    func popButton()
    {
        self.addTarget(self, action: #selector(scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: #selector(scaleToDefault), for: .touchDragExit)

    }
    
    func scaleToSmall(){
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.toValue = CGSize(width: 0.95, height: 0.95)
        scaleAnimation?.dynamicsFriction = 20
        scaleAnimation?.dynamicsTension = 500
        scaleAnimation?.removedOnCompletion = false
        self.layer.pop_removeAllAnimations()
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleAnimation(){
        let scaleAnimation : POPSpringAnimation = self.layer.pop_animation(forKey: "layerScaleSmallAnimation") as! POPSpringAnimation
        /*scaleAnimation.completionBlock = ^(POPAnimation anim, Bool finished){
          self.layer.transform = CATransform3DIdentity
        };*/
        if !scaleAnimation.isPaused {
            
        }
        scaleAnimation.dynamicsFriction = 20
        scaleAnimation.dynamicsTension = 500
        scaleAnimation.removedOnCompletion = false
        self.layer.pop_removeAllAnimations()
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
    func scaleToDefault(){
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation?.toValue = CGSize(width: 0.95, height: 0.95)
        scaleAnimation?.dynamicsFriction = 20
        scaleAnimation?.dynamicsTension = 500
        scaleAnimation?.removedOnCompletion = false
        self.layer.pop_removeAllAnimations()
        self.layer.pop_add(scaleAnimation, forKey: "layerScaleSmallAnimation")
    }
    
}

/*
        - (void)scaleAnimation
            {
                POPSpringAnimation *scaleAnimation = [self.layer pop_animationForKey:@"layerScaleSmallAnimation"];
                scaleAnimation.completionBlock =^(POPAnimation *anim, BOOL finished) {
                    [self.layer setTransform:CATransform3DIdentity];
                };
                if (!scaleAnimation.isPaused) {
                    // if the scale to small animation is still going. spring it back when it's done
                    scaleAnimation.animationDidReachToValueBlock = ^(POPAnimation *animation) {
                        ((POPSpringAnimation *)animation).velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
                        ((POPSpringAnimation *)animation).toValue  = [NSValue valueWithCGSize:CGSizeMake(1., 1.)];
                        animation.removedOnCompletion = YES;
                    };
                } else {
                    scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
                    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
                    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
                    [scaleAnimation setDynamicsFriction:20];
                    [scaleAnimation setDynamicsTension:500];
                    [self.layer pop_removeAllAnimations];
                    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
                }
            }
            
            - (void)scaleToDefault
                {
                    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
                    scaleAnimation.completionBlock =^(POPAnimation *anim, BOOL finished) {
                        [self.layer setTransform:CATransform3DIdentity];
                    };
                    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
                    [self.layer pop_removeAllAnimations];
                    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleDefaultAnimation"];
}
*/
