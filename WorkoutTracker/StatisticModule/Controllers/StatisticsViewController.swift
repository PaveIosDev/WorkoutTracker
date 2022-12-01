//
//  StatisticsViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 11.10.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    

    private let statisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "СТАТИСТИКА"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Упражнения"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Неделя", "Месяц"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.specialGray], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let nameTextField = BrownTextField()
    
    private let tableView = StatisticTableView()
    
    private var workoutArray = [WorkoutModel]()
    private var differenceArray = [DifferenceWorkout]()
    private var filteredArray = [DifferenceWorkout]()
    
    private var isFiltered = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        differenceArray = [DifferenceWorkout]()
        setStartScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setStartScreen()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticsLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(segmentedControl)
        nameTextField.brownDelegate = self
        view.addSubview(nameTextField)
        view.addSubview(tableView)
    }
    
    @objc private func segmentedChange() {
    
        let dateToday = Date().localDate()
        differenceArray = [DifferenceWorkout]()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let dateStart = dateToday.offsetDay(day: 7)
            getDifferenceModel(dateStart: dateStart)
        } else {
            let dateStart = dateToday.offsetMonth(month: 1)
            getDifferenceModel(dateStart: dateStart)
        }
        tableView.reloadData()
    }
    
    private func getWorkoutName() -> [String] {
        var nameArray = [String]()
        let allWorkouts = RealmManager.shared.getResultsWorkoutModel()
        
        for workoutModel in allWorkouts {
            if !nameArray.contains(workoutModel.workoutName){
                nameArray.append(workoutModel.workoutName)
            }
        }
        return nameArray
    }
    
    private func getDifferenceModel(dateStart: Date) {
        let dateEnd = Date().localDate()
        let nameArray = getWorkoutName()
        let allWorkouts = RealmManager.shared.getResultsWorkoutModel()
        
        for name in nameArray {
            let predicateDifference = NSPredicate(format: "workoutName = '\(name)' AND workoutDate BETWEEN %@",
            [dateStart,dateEnd])
            let filteredArray = allWorkouts.filter(predicateDifference).sorted(byKeyPath: "workoutDate")
            workoutArray = filteredArray.map{$0}
            
            guard let last = workoutArray.last?.workoutReps,
                  let first = workoutArray.first?.workoutReps else {
                      return
                  }
            
            let differenceWorkout = DifferenceWorkout(name: name, lastReps: last, firstReps: first)
            differenceArray.append(differenceWorkout)
        }
        tableView.setDifferenceArray(array: differenceArray)
    }
    
    private func setStartScreen() {
        let dateToday = Date().localDate()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
    
    private func filteringWorkouts(text: String) {
        
        for workout in differenceArray {
            if workout.name.lowercased().contains(text.lowercased()) {
                filteredArray.append(workout)
            }
        }
    }
}

//MARK: - BrownTextFieldProtocol

extension StatisticsViewController: BrownTextFieldProtocol {
    func typing(range: NSRange, replacementString: String) {
        if let text = nameTextField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: replacementString)
            filteredArray = [DifferenceWorkout]()
            isFiltered = updatedText.count > 0
            filteringWorkouts(text: updatedText)
        }
        
        if isFiltered {
            tableView.setDifferenceArray(array: filteredArray)
        } else {
            tableView.setDifferenceArray(array: differenceArray)
        }
        tableView.reloadData()
    }
    
    func clear() {
        isFiltered = false
        differenceArray = [DifferenceWorkout]()
        let dateToday = Date().localDate()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
}
    

//MARK: - setConstraints

extension StatisticsViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            statisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            segmentedControl.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            exercisesLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
