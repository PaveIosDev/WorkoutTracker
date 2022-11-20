//
//  CollectionProfileView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 20.11.2022.
//

import UIKit

class ProfileCollectionView: UICollectionView {
    
    let collectionLayout = UICollectionViewFlowLayout()
    
    private let idProfileCell = "idProfileCell"

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        
        register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: idProfileCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 3
        collectionLayout.itemSize = CGSize(width: 173, height: 116)
        collectionLayout.scrollDirection = .horizontal
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
    
    private func setDelegates() {
        dataSource = self
//        delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension ProfileCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idProfileCell, for: indexPath) as? ProfileCollectionViewCell else {
            return UICollectionViewCell()
        }
                return cell
    }
}

////MARK: - UICollectionViewDelegateFlowLayout
//
//extension ProfileCollectionView: UICollectionViewDelegateFlowLayout { // размер ячейки
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    CGSize(width: collectionView.frame.width / 3,
//           height: collectionView.frame.height / 2)
//    }
//}



////MARK: - UICollectionViewDelegate
//
//extension ProfileCollectionView: UICollectionViewDelegate { // метод отвечающий за выделение ячейки
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
//}
