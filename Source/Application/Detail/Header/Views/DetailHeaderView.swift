//
//  DetailHeaderView.swift
//  Places
//
//  Created by Christian Ampe on 5/14/19.
//  Copyright © 2019 christianampe. All rights reserved.
//

import UIKit

final class DetailHeaderView: UICollectionReusableView {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var progressView: DetailProgressView!
    @IBOutlet private weak var directionsButton: UIButton!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var viewModel: DetailHeaderViewModelProtocol?
}

extension DetailHeaderView {
    func set(properties newViewModel: DetailHeaderViewModelProtocol) {
        viewModel = newViewModel
        collectionView.reloadData()
    }
}

// MARK: - Lifecycle
extension DetailHeaderView {
    override func awakeFromNib() {
        super.awakeFromNib()
        progressView.setNumberOfIncrements(4)
    }
}

// MARK: - UICollectionViewDataSource
extension DetailHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.headerCellViewModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(for: indexPath) as DetailHeaderViewCell
    }
}

// MARK: - UICollectionViewDelegate
extension DetailHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        progressView.nextIndex = indexPath.row
        
        guard let cell = cell as? DetailHeaderViewCell else {
            assertionFailure("incorrect cell type used")
            return
        }
        
        guard let cellViewModel = viewModel?.headerCellViewModels?[safe: indexPath.row] else {
            return
        }
        
        cell.set(properties: cellViewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        progressView.unhighlight(at: indexPath.row)
    }
}

extension DetailHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
}