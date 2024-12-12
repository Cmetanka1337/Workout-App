//
//  XAxisView.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 02.09.2024.
//

import UIKit

final class XAxisView: BaseView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
            
        }
        
        data.forEach {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 9)
            label.textColor = R.Colors.inactive
            label.text = $0.title.uppercased()
            label.textAlignment = .center
            
            stackView.addArrangedSubview(label)
        }
    }
}

extension XAxisView {
    override func setupViews(){
        super.setupViews()
        setupView(stackView)
    }
    
    override func constraintViews(){
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
