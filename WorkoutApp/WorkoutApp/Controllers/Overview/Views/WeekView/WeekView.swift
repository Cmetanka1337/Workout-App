//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 13.08.2024.
//

import UIKit

final class WeekView: BaseView {
    
    private var calendar = Calendar.current
    
    private var stackView = UIStackView()
    
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()

        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekDays = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1{
            let sunday = weekDays.remove(at: 0)
            weekDays.append(sunday)
        }
        
        weekDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
