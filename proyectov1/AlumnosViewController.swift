//
//  AlumnosViewController.swift
//  SideMenuProyectoEG
//
//  Created by DAMII on 11/11/23.
//

import UIKit

class AlumnosViewController: UIViewController {
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuBtn.target = self.revealViewController()
        sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
    }
}
