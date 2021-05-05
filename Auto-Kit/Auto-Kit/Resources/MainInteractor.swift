//
//  MainInteractor.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

protocol MainBusinessLogic {
    func makeRequest(request: AutoKit.Model.Request.RequestType)
}

class MainInteractor: MainBusinessLogic {
    typealias ResponseTypeAlias = AutoKit.Model.Response.ResponseType
    var presenter: MainPresentationLogic?
    var service: MainService?
    func makeRequest(request: AutoKit.Model.Request.RequestType) {
        if service == nil {
            service = MainService()
        }
        switch request {
        case .getUser:
            service?.getUser(completion: { [weak self] (user) in
                self?.presenter?.presentData(response:
                                                ResponseTypeAlias.presentUserInfo(user: user))
            })
        }
    }
}
