//
//  ViewController.swift
//  photospicker
//
//  Created by vignesh on 6/6/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    var imagepicker : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    @IBAction func pickimage(_ sender: Any) {
        
        print("hello")
        
        let alertcontroller = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        
        let cameraAction = UIAlertAction(title: "Use camera", style: .default) { (action) in
            self.imagepicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.imagepicker.sourceType = .camera
            self.imagepicker.allowsEditing = true
            
            self.present(self.imagepicker, animated: true, completion: nil)
        }
       
        
        
        let photolibraryAction = UIAlertAction(title: "Use Photo Library", style: .default) { (action) in
            self.imagepicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagepicker.sourceType = .photoLibrary
            self.imagepicker.allowsEditing = true
            
            self.present(self.imagepicker, animated: true, completion: nil)
            
        }
       
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertcontroller.addAction(cameraAction)
        alertcontroller.addAction(photolibraryAction)
        alertcontroller.addAction(cancelAction)
        
        present(alertcontroller, animated: true, completion: nil)
        
     }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenimage = info[UIImagePickerControllerEditedImage] as! UIImage
        profilePic.contentMode = .scaleAspectFill
        profilePic.image = chosenimage
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    

}

