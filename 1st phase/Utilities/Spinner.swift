//
//  Spinner.swift
//  1st phase
//
//  Created by SOL MAC 15 on 9/5/21.
//

import UIKit



class Spinner {
    
   static func showSpinner(_ vc:UIViewController, _ completion: (() -> Void)?) {
        let alertController = UIAlertController(title: nil, message: "Please Wait...\n\n\n\n",
                                                preferredStyle: .alert)
        SaveAlertHandle.set(alertController)
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.color = UIColor(ciColor: .black)
        spinner.center = CGPoint(x: alertController.view.frame.midX,
                                 y: alertController.view.frame.midY)
        spinner.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin,
                                    .flexibleLeftMargin, .flexibleRightMargin]
        spinner.startAnimating()
        alertController.view.addSubview(spinner)
        vc.present(alertController, animated: true, completion: completion)
    }
    
    static func hideSpinner(_ completion: (() -> Void)?) {
        if let controller = SaveAlertHandle.get() {
            SaveAlertHandle.clear()
            controller.dismiss(animated: true, completion: completion)
        }
    }
    
    private class SaveAlertHandle {
        static var alertHandle: UIAlertController?
        
        class func set(_ handle: UIAlertController) {
            alertHandle = handle
        }
        
        class func clear() {
            alertHandle = nil
        }
        
        class func get() -> UIAlertController? {
            return alertHandle
        }
    }
    
}
