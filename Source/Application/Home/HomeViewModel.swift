//
//  HomeViewModel.swift
//  Places
//
//  Created Christian Ampe on 5/11/19.
//  Copyright © 2019 christianampe. All rights reserved.
//

struct HomeViewModel: HomeViewModelProtocol, Decodable {
    var panels: [HomeCollectionRow] = []
}

struct HomeCollectionRow: Decodable {
    let title: String
    let places: [HomePlace]
}
