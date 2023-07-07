//
//  NuevoJuegoViewController.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit

class NuevoJuegoViewcontroller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var btnEliminar: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var precioTxt: UITextField!
    @IBOutlet weak var descripcionTxt: UITextView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardarTouch(_ sender: Any) {
    }
    @IBAction func eliminarTouch(_ sender: Any) {
    }
    


}
