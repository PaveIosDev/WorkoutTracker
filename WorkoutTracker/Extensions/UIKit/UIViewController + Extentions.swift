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
        
        let cancelAction = UIAlertAction(title: "Выйти", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func alertPhotoOrCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completionHandler(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Галерея", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completionHandler(photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Выйти", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
