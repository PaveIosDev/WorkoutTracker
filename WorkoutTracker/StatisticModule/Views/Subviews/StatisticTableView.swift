//
//  StatisticTableView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 20.10.2022.
//

import UIKit

class StatisticTableView: UITableView {
    
    private let idStatisticsTableViewCell = "idStatisticsTableViewCell"

    private var differenceArray = [DifferenceWorkout]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(StatistictsTableViewCell.self, forCellReuseIdentifier: idStatisticsTableViewCell)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        separatorStyle = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    public func setDifferenceArray(array: [DifferenceWorkout]) {
        differenceArray = array
    }
}

// MARK: - UITableViewDataSource

extension StatisticTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        differenceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idStatisticsTableViewCell, for: indexPath) as? StatistictsTableViewCell else {
            return UITableViewCell()
        }
        let model = differenceArray[indexPath.row]
        cell.cofigure(differenceWorkout: model)
        return cell
    }
}

extension StatisticTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
