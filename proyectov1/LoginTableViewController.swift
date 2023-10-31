//
//  LoginTableViewController.swift
//  proyectov1
//
//  Created by DAMII on 10/10/23.
//

import UIKit

class LoginTableViewController: UITableViewController {

    
    @IBOutlet weak var txtUsuario: UITextField!
    
    
    @IBOutlet weak var txtContraseña: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()

    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        ValidationCode();
    }
    
};extension LoginTableViewController{
    fileprivate func ValidationCode() {
        if let usuario = txtUsuario.text, let contraseña  = txtContraseña.text{
            if !usuario.validateUsuarioId(){
                openAlert(title: "Alerta", message: "Usuario no encontrado", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else if !contraseña.validateContraseña(){
                openAlert(title: "Alerta", message: "Por favor entra una contraseña valida", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else{
                // Navigation - Home Screen
            }
        }else{
            openAlert(title: "Alerta", message: "Porfavor agrega el detalle.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
        //Posicionamiento del Login
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let tableViewHeight = self.tableView.frame.height
            let contentHeight = self.tableView.contentSize.height
            
            let centeringInset = (tableViewHeight - contentHeight)/2.0
            let topInset = max(centeringInset, 0.0)
            
            self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
        }
}
