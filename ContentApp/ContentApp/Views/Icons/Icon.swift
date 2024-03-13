//
//  Icons.swift
//  ContentApp
//
//  Created by Никита Китаев on 13.03.2024.
//

import UIKit

final class Icon: UIView {
    public var icon = UIImageView()
    
    init(_ named: String) {
        super.init(frame: .zero)
        
        icon.image = UIImage(named: named) ?? UIImage()
        
        configureUI()
    }
    
    func configureUI() {
        addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: icon.image?.size.height ?? 0),
            icon.widthAnchor.constraint(equalToConstant: icon.image?.size.width ?? 0),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}