//
//  MainPresener.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

protocol MainPresentationLogic {
    func presentData(response: AutoKit.Model.Response.ResponseType)
}

class MainPresenter: MainPresentationLogic {
    typealias ViewModelAlias = AutoKit.Model.ViewModel.ViewModelData
    weak var viewController: MainDisplayLogic?

    let dateFormatter: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ru_RU")
        dateFormater.dateFormat = "d MMM 'в' HH:mm"
        return dateFormater
    }()

    func presentData(response: AutoKit.Model.Response.ResponseType) {
        switch response {
        case .presentUserInfo(let user):
            let userViewModel = UserViewModel.init(photoUrlString: user?.photo100, name: user!.name)
            viewController?.displayData(viewModel: ViewModelAlias.displayUser(userViewModel: userViewModel))
        }
    }
}
