//
//  HomeViewController.swift
//  SideMenuProyectoEG
//
//  Created by DAMII on 11/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    
    //g
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action=#selector(revealViewController()?.revealSideMenu)

    }
    



}
