//
//  TrainingCellView.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 07.09.2024.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    
    static let id = "TrainingCellView"
    
    private let checkMarkView = UIImageView(image: R.Images.OverView.checkmarkNotDone)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let subtitle: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let rightArrowView = UIImageView(image: R.Images.OverView.rightArrow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        
        checkMarkView.image = isDone ? R.Images.OverView.checkmarkDone : R.Images.OverView.checkmarkNotDone
        
        switch roundedType {
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .all: self.roundCorners([.allCorners], radius: 5)
        case .notRounded: self.roundCorners([.allCorners], radius: 0)
        }
    }
}

private extension TrainingCellView {
    
    func setupViews() {
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(checkMarkView)
        setupView(rightArrowView)
    }
    
    func constraintViews() {
        
        
        NSLayoutConstraint.activate([
            checkMarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkMarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMarkView.heightAnchor.constraint(equalToConstant: 28),
            checkMarkView.widthAnchor.constraint(equalTo: checkMarkView.heightAnchor),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: checkMarkView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
    }
    
}
