//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 12.08.2024.
//

import UIKit

class ProgressController: BaseController {
    
    private let dailyPerformanceView = DailyPerformarmanceView(with: R.Strings.Progress.dailyPerfomance, buttonTitle: R.Strings.Progress.last7Days)
    
    private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Progress.monthlyPerformance, buttonTitle: R.Strings.Progress.last10Months)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout progress"
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
    }
    
    
}

extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        dailyPerformanceView.configure(with: [.init(value: "1", heightMultipier: 0.2, title: "Mon"),
                                              .init(value: "2", heightMultipier: 0.4, title: "Tue"),
                                              .init(value: "3", heightMultipier: 0.6, title: "Wed"),
                                              .init(value: "4", heightMultipier: 0.8, title: "Thu"),
                                              .init(value: "5", heightMultipier: 1, title: "Fri"),
                                              .init(value: "6", heightMultipier: 0.6, title: "Sat"),
                                              .init(value: "7", heightMultipier: 0.4, title: "Sun"),
                                              
        ])
        
        monthlyPerformanceView.configure(with: [.init(title: "Mar", value: 45),
                                                .init(title: "Apr", value: 55),
                                                .init(title: "May", value: 60),
                                                .init(title: "Jun", value: 65),
                                                .init(title: "Jul", value: 70),
                                                .init(title: "Aug", value: 80),
                                                .init(title: "Sep", value: 65),
                                                .init(title: "Oct", value: 45),
                                                .init(title: "Nov", value: 30),
                                                .init(title: "Dec", value: 15)],
                                         topChartOffset: 10)
    }
}
