//
//  NewWorkoutViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel = UILabel(text: "НОВАЯ ТРЕНИРОВКА",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    private lazy var closeButton = CloseButton(type: .system)
    
    private let nameView = NameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()

    private lazy var saveButton = GreenButton(text: "СОХРАНИТЬ")

    private var stackView = UIStackView()
    
    private var workoutModel = WorkoutModel()
    
    private let testImage = UIImage(named: "testWorkout")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        addGesture()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        stackView = UIStackView(arrangedSubviews: [nameView,
                                                   dateAndRepeatView,
                                                   repsOrTimerView],
                                axis: .vertical,
                                spacing: 20)
        view.addSubview(stackView)
  
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        workoutModel.workoutName = nameView.getNameTextFieldText()
        
        workoutModel.workoutDate = dateAndRepeatView.getDateAndRepeat().date.localDate()
        workoutModel.workoutNumberOfDay = dateAndRepeatView.getDateAndRepeat().date.getWeekdayNumber()
        workoutModel.workoutRepeat = dateAndRepeatView.getDateAndRepeat().repeat
        
        workoutModel.workoutSets = repsOrTimerView.sets
        workoutModel.workoutReps = repsOrTimerView.reps
        workoutModel.workoutTimer = repsOrTimerView.timer
        
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
    }
    
    private func saveModel() {
        let text = nameView.getNameTextFieldText()
        let count = text.filter { $0.isNumber || $0.isLetter }.count
        
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(workoutModel)
            createNotification()
            workoutModel = WorkoutModel()
            presentSimpleAlert(title: "Success", message: nil)
            resetValues()
        } else {
            presentSimpleAlert(title: "Error", message: "Enter all parametrs")
        }
    }
    
    private func resetValues() {
        nameView.deleteTextFieldText()
        dateAndRepeatView.resetDateAndRepeat()
        repsOrTimerView.resetSliderViewValues()
    }
    
    private func addGesture() {
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(hideKeybord))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
        
    }
    
    @objc private func hideKeybord() {
        view.endEditing(true)
    }
    
    private func createNotification() {
        let notifications = Notifications()
        let stringDate = workoutModel.workoutDate.ddMMyyyyFromDate()
        notifications.scheduleDateNotification(date: workoutModel.workoutDate, id: "workout" + stringDate)
    }
    
}

//MARK: - Set Constraints

extension NewWorkoutViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameView.heightAnchor.constraint(equalToConstant: 60),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 115),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 340),

            stackView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
