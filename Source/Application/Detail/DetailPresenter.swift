//
//  DetailPresenter.swift
//  Places
//
//  Created Christian Ampe on 5/14/19.
//  Copyright © 2019 christianampe. All rights reserved.
//

import UIKit

final class DetailPresenter: DetailPresenterProtocol {
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    weak var view: DetailViewProtocol?
    
    var input: DetailInputProtocol?
    var viewModel: DetailViewModelProtocol?
    var output: DetailOutputProtocol?
    weak var delegate: DetailDelegateProtocol?
}