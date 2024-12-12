//
//  R.swift
//  WorkoutApp
//
//  Created by Всеволод Буртик on 12.08.2024.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let separator = UIColor(hexString: "#E8ECEF")
        static let background = UIColor(hexString: "#F8F9F9")
        
        static let titleGray = UIColor(hexString: "#545C77")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let subtitleGray = UIColor(hexString: "#D8D8D8")
        
    }
    
    enum Strings {
        enum TabBar{
            static func title(for tab: Tabs) -> String{
                switch tab{
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        enum NavBar {
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum Session{
            static var navBarPause = "Pause"
            static var navBarFinish = "Finish"
            static var navBarStart = "Start    "
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"
            
            static let workoutStats = "Workout stats"
            static let averagepace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            
            static let stepsCounter = "Steps Counter"
        }
        enum Progress{
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
            
            static let dailyPerfomance = "Daily perfomance"
            static let last7Days = "Last 7 days"
            static let monthlyPerformance = "Monthly performance"
            static let last10Months = "Last 10 Months"
        }
        enum Overview{
            static let allWorkoutsButton = "All Workouts"
        }
    }
    enum Images{
        enum TabBar{
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab{
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "session_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Stats {
            static let averagePace = UIImage(named: "stats_averagePace")
            static let heartRate = UIImage(named: "stats_heartRate")
            static let totalDistance = UIImage(named: "stats_totalDistance")
            static let totalSteps = UIImage(named: "stats_totalSteps")
        }
        
        enum Common {
            static var downArrow = UIImage(named: "arrow_button")
            static var add = UIImage(named: "add_button")
        }
        
        enum OverView {
            static let rightArrow = UIImage(named: "right_arrow")
            static let checkmarkNotDone = UIImage(named: "checkmark_not_done")
            static let checkmarkDone = UIImage(named: "checkmark_done")
        }
    }
    
    enum Fonts{
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
