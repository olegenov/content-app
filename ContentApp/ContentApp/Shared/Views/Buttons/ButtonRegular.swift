//
//  RegularButton.swift
//  ContentApp
//
//  Created by Никита Китаев on 21.02.2024.
//

import UIKit

final class ButtonRegular: Button {
    enum Constants {
        static let backgroundColor: UIColor = UIColor.clear
        static let titleColor: UIColor = UIColor.AppColors.textColor
        static let borderColor: UIColor = UIColor.AppColors.outlineColor
    }

    override init(_ title: String) {
        super.init(title)
        
        configureUI(title)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI(_ title: String) {
        setTitle(title, for: .normal)
        backgroundColor = Constants.backgroundColor
        setTitleColor(Constants.titleColor, for: .normal)
        titleLabel?.font = UIFont.appFont(.button)
        
        layer.borderColor = Constants.borderColor.cgColor
        layer.borderWidth = 1
        
        addPadding()
    }
}
