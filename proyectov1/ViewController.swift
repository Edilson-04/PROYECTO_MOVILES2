//
//  ViewController.swift
//  proyectov1
//
//  Created by DAMII on 3/10/23.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    //variables a usar en este controller
    var listaCursos = [Curso]()
    //referencia al contenedor de core data
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    //metodo obligatorio1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listaCursos.count
    }
    
    //metodo obligatorio2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = TablaCursos.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        let curso = listaCursos[indexPath.row]
        
        //operador ternario
        celda.textLabel?.text = curso.nombre
        celda.textLabel?.textColor = curso.disponible ? .black : .blue
        celda.detailTextLabel?.text = curso.disponible ? "No disponible" : "Disponible"
        
        //marcar con un identificardor
        celda.accessoryType = curso.disponible ? .checkmark : .none
        
        
        return celda
    }
    

    //algo tipo como un constructor parece xd
    @IBOutlet weak var TablaCursos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TablaCursos.delegate = self
        TablaCursos.dataSource = self
        
        leerCursos()
    }

    //boton
    @IBAction func nuevoCurso(_ sender: UIBarButtonItem) {
        var nombreCurso = UITextField()
        
        let alerta = UIAlertController(title: "Nuevo", message: "Curso", preferredStyle: .alert)
        //metodo en una variable xd??
        let accionAceptar = UIAlertAction(title: "Agregar", style: .default) { (_)  in
            let nuevoCurso = Curso(context:self.contexto)
            nuevoCurso.nombre = nombreCurso.text
            nuevoCurso.disponible = false
            
            self.listaCursos.append(nuevoCurso)
            self.guardar()
        }
        
        alerta.addTextField{ textfieldAlerta in
            textfieldAlerta.placeholder = "Ingrese un Curso"
            nombreCurso = textfieldAlerta
        }
        
        alerta.addAction(accionAceptar)
        
        present(alerta,animated: true)
        
    }
    
    //funcion guardar que se usara en el boton
    func guardar(){
        do{
            try contexto.save()
        }catch{
            print(error.localizedDescription)
        }
        
        self.TablaCursos.reloadData()
    }
    
    
    //funcion para que haga la lectura a la base de datos
    func leerCursos(){
        let solicitud : NSFetchRequest<Curso> = Curso.fetchRequest()
        
        do{
            listaCursos = try contexto.fetch(solicitud)
        }catch{
            print(error.localizedDescription)
        }
        
        
        
    }
    
    //funcion para el chekc del curso
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if TablaCursos.cellForRow(at: indexPath)?.accessoryType == .checkmark{
                TablaCursos.cellForRow(at: indexPath)?.accessoryType == .none
            } else {
                TablaCursos.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            
            //editar el dato en la bd
            listaCursos[indexPath.row].disponible = !listaCursos[indexPath.row].disponible
            guardar()
            
            
            //dseleccionar el check
            TablaCursos.deselectRow(at: indexPath, animated: true)
        }
    
    
    
    
    
    
    
    /*
    extension ViewController:UITableViewDelegate,UITableViewDataSource{
        
        //metodo obligatorio1
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  listaCursos.count
        }
        
        //metodo obligatorio2
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let celda = TablaCursos.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
            
            let curso = listaCursos[indexPath.row]
            
            //operador ternario
            celda.textLabel?.text = curso.nombre
            celda.textLabel?.textColor = curso.disponible ? .black : .blue
            celda.detailTextLabel?.text = curso.disponible ? "No disponible" : "Disponible"
            
            //marcar con un identificardor
            celda.accessoryType = curso.disponible ? .checkmark : .none
            
            
            return celda
        }
        */
}

