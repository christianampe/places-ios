//
//  ProfileBuilder.swift
//  Places
//
//  Created Christian Ampe on 5/11/19.
//  Copyright © 2019 christianampe. All rights reserved.
//

import UIKit

final class ProfileBuilder {
    func create(_ delegate: ProfileDelegateProtocol?, input: ProfileInputProtocol, viewModel: ProfileViewModelProtocol = ProfileViewModelProtocol(), output: ProfileOutputProtocol = ProfileOutputProtocol()) -> UIViewController {
        
        let storyboard = UIStoryboard(storyboard: )
        let view: ProfileViewController = storyboard.instantiateViewController()
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        preenter.input = input
        presenter.viewModel = viewModel
        presenter.output = output
        presenter.delegate = delegate
        
        return view
    }
}