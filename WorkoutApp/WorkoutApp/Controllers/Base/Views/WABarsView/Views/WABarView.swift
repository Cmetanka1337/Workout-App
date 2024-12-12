//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 29.08.2024.
//

import UIKit

extension WABarView {
    struct Data{
        let value: String
        let heightMultipier: Double
        let title: String
    }
}

final class WABarView: BaseView {
    private let heightMultipier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.active
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 9)
        label.textColor = R.Colors.inactive
        
        return label
    }()
    
    private let barView: UIView = {
       let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    init(data: Data) {
        self.heightMultipier = data.heightMultipier
        super.init(frame: .zero)
        
        titleLabel.text = data.title.uppercased()
        valueLabel.text = data.value
    }
    
    required init?(coder: NSCoder) {
        self.heightMultipier = 0
        super.init(frame: .zero)
    }
}

extension WABarView {
    override func setupViews(){
        super.setupViews()
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
    }
    
    override func constraintViews(){
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: barView.topAnchor, constant: -5),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultipier * 0.8),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 7),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
