//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 12.08.2024.
//

import UIKit

class SessionController: BaseController {

    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)
    
    private let timerDuration = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func navBarLeftHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer { progress  in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.navBarRightHandler()
                    }
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForNavBarButton(title: timerView.state == .isRunning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart, at: .left)
    }
    
    override func navBarRightHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(title: R.Strings.Session.navBarFinish, at: .right)
        setTitleForNavBarButton(title: R.Strings.Session.navBarStart, at: .left)
    }
    
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 11),
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
   
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor) ,
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        statsView.configure(with: [.heartRate(value: "155"),
                                   .avaragePace(value: "8'20\""),
                                   .totalSteps(value: "7,682"),
                                   .totalDistance(value: "8.25")
        ])
        
        stepsView.configure(with: [.init(value: "8k", heightMultipier: 1, title: "2/14"),
                                   .init(value: "7k", heightMultipier: 0.8, title: "2/15"),
                                   .init(value: "5k", heightMultipier: 0.6, title: "2/16"),
                                   .init(value: "6k", heightMultipier: 0.7, title: "2/17")
                                  ])
    }
}
