//
//  +ParentVCDelegate.swift
//  Kids123
//
//  Created by Denis Kozlov on 31.05.2020.
//  Copyright © 2020 Denis Kozlov. All rights reserved.
//

import UIKit
import Foundation
import StoreKit
import SafariServices

extension ParentViewController: UITextFieldDelegate, SFSafariViewControllerDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedChars = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedChars.isSuperset(of: characterSet)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text, let year = Int(text) else {return}
        let date = Date()
        let calendar = Calendar.current
        if text.count == 4 {
            print(year)
            guard year >= 1900 else {
                textField.text! = ""
                return animateFail(someThing: payment.parentControllView)
            }
            guard year <= calendar.component(.year, from: date) - 14 else {
                textField.text! = ""
                return animateFail(someThing: payment.parentControllView)
            }
            
            animateSeccess(someThing: payment.parentControllView)
            textField.resignFirstResponder()
            textField.isUserInteractionEnabled = false
            
            showSafariViewController(for: "https://apps.apple.com/us/app/kids-timer-focus-calm/id1458897489?l=en&ls=1")
            
        }
    }
    
//    func switchTypeOfHandler(to type: HandlerType) {
//        
//        switch type {
//                                    
//            case .purchase:
//                print("purchase case")
//                // Parent Control To Buy
//                                
//            case .linkTerms:
//                print("link Terms case")
//                // Parent Control To Link Terms
//                showSafariViewController(for: "https://apps.apple.com/us/app/kids-timer-focus-calm/id1458897489?l=en&ls=1")
//                
//            case .linkPolicy:
//                print("link Policy case")
//                // Parent Control To Link Policy
//                showSafariViewController(for: "https://deniskozlov.tilda.ws/privacypolicy")
//                
//            case .share:
//                print("share case")
//                // Parent Control To Share
////                 present(buttons.shareViewController, animated: true, completion: nil)
//        }
//    }
    
    private func showSafariViewController(for url: String) {
        
        guard let theUrl = URL(string: url) else {return}
        let safariVC = SFSafariViewController(url: theUrl)
        safariVC.delegate = self
        present(safariVC, animated: true)
        
    }
    
    @objc func buyCancel(sender: UIButton!) {
        parentControllViewRemoveWithAnimate()
        print("Button cancel tapped")
    }
    
    // shake something animation
    fileprivate func animateFail(someThing: UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            someThing.transform.ty = 15
        }) { (true) in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
                someThing.transform.ty = 0
            })
        }
    }
    
    fileprivate func animateSeccess(someThing: UIView) {
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 6, options: .curveEaseInOut, animations: {
            someThing.transform.ty = -20
        }) { (true) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 6, options: .curveEaseIn, animations: {
                someThing.transform.ty = 0
            }) { (true) in
                self.payment.birthYearTextField.text! = "GOOD"
                self.removeParentControllView()
                // Remuve Sub Controller
            }
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func parentControllViewRemoveWithAnimate() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.payment.parentControllText.alpha = 0
            self.payment.birthYearTextFieldView.alpha = 0
            self.payment.birthYearTextField.alpha = 0
            self.payment.parentDontSaveDataText.alpha = 0
            self.payment.cancelButton.alpha = 0
        }) { (true) in
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
                self.payment.parentControllView.transform = CGAffineTransform(scaleX: 0.55, y: 0.18)
                self.payment.parentControllView.transform.ty = 250
                self.payment.parentControllView.alpha = 0
            }, completion: { (true) in
                self.removeParentControllView()
                UIView.animate(withDuration: 0.3, animations: {
                    self.payment.restoreButton.alpha = 1
                })
            })
        }
    }
    
    func removeParentControllView() {
        payment.birthYearTextField.removeFromSuperview()
        payment.birthYearTextFieldView.removeFromSuperview()
        payment.parentControllText.removeFromSuperview()
        payment.parentDontSaveDataText.removeFromSuperview()
        payment.parentControllView.removeFromSuperview()
        payment.cancelButton.removeFromSuperview()
        dismiss(animated: true, completion: nil)
        self.view.layer.opacity = 0.0
        self.removeFromParent()
    }
}
