//
//  Extension.swift
//  proyectov1
//
//  Created by DAMII on 18/10/23.
//

import Foundation

extension String{
    
    func validateUsuarioId() -> Bool {
        let usuarioRegEx = "^[A-Za-z0-9._%+-]{3,20}"
        return applyPredicateOnRegex(regexStr: usuarioRegEx)
    }
    
    func validateContraseña(mini: Int = 8, max: Int = 8) -> Bool {
        //Minimo 8 caracteres al menos 1 Alfabeto y 1 Numero:
        var conRegEx = ""
        if mini >= max{
            conRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }else{
            conRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: conRegEx)
    }
    
    //https://stackoverflow.com/a/39284766/8201581
    
    func applyPredicateOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isStringValid = validateString.evaluate(with: trimmedString)
        return isStringValid
    }

  
}
