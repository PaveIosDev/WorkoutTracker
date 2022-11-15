//
//  UIViewController + Extentions.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 27.10.2022.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func presentAlertWithActions(title: String, message: String?, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
