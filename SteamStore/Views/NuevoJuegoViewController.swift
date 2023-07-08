//
//  NuevoJuegoViewController.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit
import SDWebImage
import FirebaseStorage
import FirebaseDatabase

class NuevoJuegoViewcontroller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var btnEliminar: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var precioTxt: UITextField!
    @IBOutlet weak var descripcionTxt: UITextView!
    @IBOutlet weak var almacenamientoTxt: UITextField!
    @IBOutlet weak var categoriasTxt: UITextField!
    @IBOutlet weak var desarrolladoraTxt: UITextField!
    @IBOutlet weak var btnComprar: UIButton!
    @IBOutlet weak var nombreTxt: UITextField!
    
    var imagePicker = UIImagePickerController()
    var juego:Juego? = nil
    var edicion = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        if (juego != nil ){
            nombreTxt.text = juego!.nombre
            imageView.sd_setImage(with: URL(string: juego!.imagenURL))
            descripcionTxt.text = juego!.descripcion
            precioTxt.text = juego!.precio
            almacenamientoTxt.text = juego!.almacenamiento
            categoriasTxt.text = juego!.categorias
            
            nombreTxt.backgroundColor = UIColor(red: 58, green: 55, blue: 64, alpha: 1)
            
            if (!edicion) {
                nombreTxt.isEnabled = false
                descripcionTxt.isEditable = false
                precioTxt.isEnabled = false
                almacenamientoTxt.isEnabled = false
                categoriasTxt.isEnabled = false
                
                btnGuardar.isHidden = true
                btnEliminar.isHidden = true
            }
        }
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
        
        if (edicion) {
            //Editar Firebase
            
        } else {
             let imagenID = NSUUID().uuidString
            var imagenURL = ""
             
             
              let imagenesFolder = Storage.storage().reference().child("imagenes")
              let imagenData = imageView.image?.jpegData(compressionQuality: 0.50)
              let cargarImagen = imagenesFolder.child("\(imagenID).jpg")
            cargarImagen.putData(imagenData!, metadata: nil) { (metadata, error) in
                if error != nil {
                    let alerta = UIAlertController(title: "Error", message: "Se presentò un error al subir la imagen.", preferredStyle: .alert)
                    let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alerta.addAction(btnOK)
                    self.present(alerta, animated: true)
                    print("Ocurrió un error al subir la imagen: \(error)")
                    return
                } else {
                    cargarImagen.downloadURL(completion: { (url, error) in
                        guard let enlaceURL = url else{
                            print("Ocurrio un error al obtener la informacion de la imagen")
                        return
                        }
                        imagenURL = enlaceURL.absoluteString
                    })
                }
            }
              
             
            
            let juegoNuevo = [
                "nombre": nombreTxt.text!,
                "imagenURL": imagenURL,
                "imagenID": imagenID,
                "descripcion": descripcionTxt.text!,
                "almacenamiento": almacenamientoTxt.text!,
                "precio": precioTxt.text!,
                "categorias": categoriasTxt.text!,
                "desarrolladora": desarrolladoraTxt.text!
            ]
            //Subir a Firebase
            
             Database.database().reference().child("juegos").childByAutoId().setValue(juegoNuevo)
             
            print("Se ha registrado nuevo juego!: \(juegoNuevo)")
        }
    }
    @IBAction func eliminarTouch(_ sender: Any) {
        //Eliminar Firebase con juego!.id y imagenID
    }
    @IBAction func comprarTouch(_ sender: Any) {
    }
    


}
