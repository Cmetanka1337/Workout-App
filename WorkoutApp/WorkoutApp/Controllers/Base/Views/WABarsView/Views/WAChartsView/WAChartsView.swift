//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 02.09.2024.
//

import UIKit

extension WAChartsView {
    struct Data {
        let title: String
        let value: Int
    }
}

final class WAChartsView: BaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()
    
    func configure(with data: [WAChartsView.Data], topChartOffset: Int = 10) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartOffset)
    }
}

extension WAChartsView {
    override func setupViews(){
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }
    
    override func constraintViews(){
        super.constraintViews()
        
            NSLayoutConstraint.activate([
                yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
                yAxisView.topAnchor.constraint(equalTo: topAnchor),
                yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
                
                xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor,constant: 8),
                xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 4),
                xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
                chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
                chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16)
            ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
        
    }
}
