//
//  CardList.swift
//  ContentApp
//
//  Created by Никита Китаев on 15.03.2024.
//

import UIKit

class CardList: UICollectionView {
    enum Constants {
        static let verticalGap: CGFloat = 15
        static let horizontalGap: CGFloat = 9
        static let cardHeight: CGFloat = 52
    }
    
    var data: [CardData] = []
    private var addCardTapAction: (() -> Void)?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        register(Card.self, forCellWithReuseIdentifier: "CardCell")
        register(CreateCard.self, forCellWithReuseIdentifier: "CreateCardCell")
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(_ data: [CardData]) {
        self.data = data
        reloadData()
    }
    
    func configureAddCardTapAction(_ action: @escaping () -> Void) {
        addCardTapAction = action
    }
}

extension CardList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateCardCell", for: indexPath) as! CreateCard
            
            cell.configureCardTapAction(addCardTapAction ?? {})
            
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! Card
        let project = data[indexPath.item - 1]
        
        cell.configure(with: project)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Constants.horizontalGap) / 2
        return CGSize(width: width, height: Constants.cardHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.horizontalGap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.verticalGap
    }
}
