//
//  LoginViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var authService: AuthService!
    
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        authService = AppDelegate.shared().authService
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        authService.wakeUpSession()
    }
}
