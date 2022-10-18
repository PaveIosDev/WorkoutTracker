//
//  NewWorkoutViewController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 16.10.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton : UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nameTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: 0))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let dateAndRepeatLabel : UILabel = {
        let label = UILabel()
        label.text = "Date and Repeat"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsOrTimerLabel : UILabel = {
        let label = UILabel()
        label.text = "Reps or timer"
        label.font = .robotoMedium14()
        label.textColor = .specialLightBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let saveButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialGreen
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dateAndRepeatView = DateAndRepeatView()
    let repsOfTimerView = RepsOfTimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
//        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(saveButton)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOfTimerView)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        print("save")
    }
    

}


//MARK: - setConstraints

extension NewWorkoutViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 1),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93),
            dateAndRepeatView.widthAnchor.constraint(equalToConstant: 345),
            
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 114),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            repsOfTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 1),
            repsOfTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOfTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOfTimerView.heightAnchor.constraint(equalToConstant: 360),
            repsOfTimerView.widthAnchor.constraint(equalToConstant: 345),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 370),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.widthAnchor.constraint(equalToConstant: 345)
            
     
        ])
    }
}

//    private let datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.tintColor = .specialGreen
//        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        return datePicker
//    }()
//
//    private lazy var testSwitch : UISwitch = {
//        let testSwitch = UISwitch()
//        testSwitch.isOn = true
//        testSwitch.onTintColor = .specialGreen
//        testSwitch.translatesAutoresizingMaskIntoConstraints = false
//        return testSwitch
//    }()
//
//    private lazy var testSlider : UISlider = {
//        let testSlider = UISlider()
//        testSlider.minimumValue = 0
//        testSlider.maximumValue = 10
//        testSlider.maximumTrackTintColor = .specialLightBrown
//        testSlider.minimumTrackTintColor = .specialGreen
//        testSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
//        testSlider.translatesAutoresizingMaskIntoConstraints = false
//        return testSlider
//    }()

//            datePicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//            testSwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
//            testSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//            testSlider.topAnchor.constraint(equalTo: testSwitch.bottomAnchor, constant: 20),
//            testSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            testSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
