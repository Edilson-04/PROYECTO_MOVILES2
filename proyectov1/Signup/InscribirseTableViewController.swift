//
//  InscribirseTableViewController.swift
//  proyectov1
//
//  Created by DAMII on 3/11/23.
//

import UIKit

class InscribirseTableViewController: UITableViewController {

    
    @IBOutlet weak var imgPerfil: UIImageView!
    @IBOutlet weak var txtUsuarionom: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtConfContraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imagenaprovechada(tapGestureReconigzer:)))
     
        imgPerfil.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func imagenaprovechada(tapGestureReconigzer:UITapGestureRecognizer){
        
        abrirGaleria()
    }
    
    
    @IBAction func btnInscribirseClicked(_ sender: UIButton) {
            if let correo = txtCorreo.text,let contraseña = txtContraseña.text,
               let nomusuario = txtUsuarionom.text,let conContraseña = txtConfContraseña.text{
                if nomusuario == ""{
                    print("Please enter username")
                }else if !nomusuario.validateUsuarioId(){
                    openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                    print("email is not valid")
                }else if !contraseña.validateContraseña(){
                    print("Password is not valid")
                } else{
                    if conContraseña == ""{
                        print("Please confirm password")
                    }else{
                        if contraseña == conContraseña{
                            // navigation code
                            print("Navigation code Yeah!")
                        }else{
                            print("password does not match")
                        }
                    }
                }
            }else{
                print("Please check your details")
            }
        
    }
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight)/2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}
extension InscribirseTableViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
  
    func abrirGaleria(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
        }
    }
    
    func imagenRecogController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage{
            imgPerfil.image = img
        }
        dismiss(animated: true)
    }
}

