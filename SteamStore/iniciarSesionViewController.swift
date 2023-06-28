//
//  ViewController.swift
//  SteamStore
//
//  Created by Yoanina Mamani Paredes on 27/06/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){(users, error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error:\(String(describing: error))")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                    if error != nil{
                        print("error:\(String(describing:error))")
                    }else{
                        print("el usuario se ha creado correctamente")
                        //el usuario se crea en caso no exista
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func crearNuevaCuentaTapped(_ sender: Any) {
        
    }
    
}

