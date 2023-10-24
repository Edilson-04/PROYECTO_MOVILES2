//
//  UiAlertController.swift
//  proyectov1
//
//  Created by DAMII on 18/10/23.
//

import Foundation
import UIKit

extension UIViewController{
    public func openAlert(title:String,
                          message:String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions : [((UIAlertAction)-> Void)]){
        
        let alertController = UIAlertController(title:title,message:message,
                                                preferredStyle:alertStyle)
        for(index,indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title:indexTitle,style:
                                        actionStyles[index],handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated : true)
    }
    //https://stackoverflow.com/a/39284766/8201581
}
