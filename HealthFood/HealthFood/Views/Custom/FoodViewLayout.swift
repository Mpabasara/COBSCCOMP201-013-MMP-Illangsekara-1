//
//  FoodViewLayout.swift
//  HealthFood
//
//  Created by Mobios on 1/31/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
import UIKit
class FoodCompositionalLayout {
    
    static let shared = FoodCompositionalLayout()
    
    private init() {}
    
    
    func discountLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(170)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func deliveryLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(170)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)), elementKind: HeaderCollectionReusableView.reusableId, alignment: .top)
        ]
        return section
    }
    
    func defaultLayout () -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(170)), subitems: [item])
       
        let section = NSCollectionLayoutSection.init(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
