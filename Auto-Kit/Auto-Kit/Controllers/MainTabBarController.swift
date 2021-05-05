//
//  MainViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 30.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import VK_ios_sdk

protocol MainDisplayLogic: AnyObject {
    func displayData(viewModel: AutoKit.Model.ViewModel.ViewModelData)
}

class MainTabBarController: UITabBarController, TitleViewDelegate, MainDisplayLogic {
    
    var interactor: MainBusinessLogic?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupTopBars()
        interactor?.makeRequest(request: AutoKit.Model.Request.RequestType.getUser)
    }
    
    private lazy var titleView = TitleView()
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = MainInteractor()
        let presenter             = MainPresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }

    
    private func setupTopBars() {
        let topBar = UIView(frame: UIApplication.shared.statusBarFrame)
        topBar.backgroundColor = .blue
        topBar.layer.shadowColor = UIColor.black.cgColor
        topBar.layer.shadowOpacity = 0.3
        topBar.layer.shadowOffset = CGSize.zero
        topBar.layer.shadowRadius = 8
        self.view.addSubview(topBar)

        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.titleView = titleView

        titleView.delegate = self
    }
    
    // MARK: Log out session delegate
    func buttonLogOutSession(sender: UIButton) {

        let loginStoryboard = R.storyboard.loginViewController()

        guard let authViewController: LoginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            print("Couldn't find the view controller")
            return
        }

        let alert = UIAlertController(title: "Выйти?",
                                      message: "Вы всегда можете получить доступ к своему аккаунту, войдя в систему",
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.default, handler: { _ in
            print("\(#function)")
        }))

        alert.addAction(UIAlertAction(title: "Выйти",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        print("\(#function)")
                                        //LogOut and segue at authViewController
                                        VKSdk.forceLogout()
                                        self.navigationController?.pushViewController(authViewController,
                                                                                      animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func displayData(viewModel: AutoKit.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayUser(let userViewModel):
            titleView.set(userViewModel: userViewModel)
        }
    }
    
}
