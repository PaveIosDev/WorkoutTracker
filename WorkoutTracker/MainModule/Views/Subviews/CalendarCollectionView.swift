//
//  CalendarCollectionView.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 20.10.2022.
//

import UIKit

protocol CalendarViewProtocol: AnyObject {
    func selectItem(date: Date)
}

class CalendarCollectionView: UICollectionView {
    
    let collectionLayout = UICollectionViewFlowLayout()

    private let idCalendarCell = "idCalendarCell"
    
    weak var calendarDelegate: CalendarViewProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 3
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension CalendarCollectionView: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    7
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
        return UICollectionViewCell()
    }
    
    let dateTimeZone = Date()
    let weekArray = dateTimeZone.getWeekArray()
    cell.dateForCell(numberOfDay: weekArray[1][indexPath.row], dayOfWeek: weekArray[0][indexPath.row])
    
    if indexPath.item == 6 {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
    }
    
    return cell
}
}

//MARK: - UICollectionViewDelegate

extension CalendarCollectionView: UICollectionViewDelegate { // метод отвечающий за выделение ячейки
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let dateTimeZone = Date()
    let date = dateTimeZone.offsetDay(day: 6 - indexPath.item)
    calendarDelegate?.selectItem(date: date)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CalendarCollectionView: UICollectionViewDelegateFlowLayout { // размер ячейки
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width / 8,
           height: collectionView.frame.height)
}
}
