//
//  ViewController.swift
//  SteamStore
//
//  Created by Yoanina Mamani Paredes on 27/06/23.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

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
    
    func loginGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in guard error == nil else { return }
            guard let user = result?.user, let idToken = user.idToken?.tokenString
            else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) {result, error in print("Se ha iniciado sesión con Google: \(String(describing: result))")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
        
    }
    
    @IBAction func iniciarSesionGoogleTapped(_ sender: Any) {
        loginGoogle()
    }
    
    
    @IBAction func crearNuevaCuentaTapped(_ sender: Any) {
        
    }
    
}

