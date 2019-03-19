//
//  CalendarViewController.swift
//  EC-Calendar
//
//  Created by LAM Chun Kit on 17/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet var calendar: UICollectionView!
    
    @IBOutlet var timeLabel: UILabel!
    
    var months = [1: ("Jan", 0), 2: ("Feb", 3), 3: ("Mar", 3), 4: ("Apr", 6), 5:("May", 1), 6:("Jun", 4),7: ("Jul", 6), 8:("Aug", 2), 9:("Sept", 5), 10:("Oct", 6), 11:("Nov", 2), 12:("Dec", 4)]
    
    var currentYear = Calendar.current.component(.year, from: Date())
    
    var currentMonth = Calendar.current.component(.month, from: Date())
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfDaysInThisMonth + months[currentMonth]!.1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let textLabel = cell.contentView.subviews[0] as? UIButton{
            var NumberOfDaysAdded = months[currentMonth]!.1
            if isLeapYearAndMarch() {
                NumberOfDaysAdded += 1
            }
            if indexPath.row < NumberOfDaysAdded {
                textLabel.setTitle("", for: .normal)
            } else {
                textLabel.setTitle("\(indexPath.row + 1 - NumberOfDaysAdded)", for: .normal)
            }
            if isSunday(indexPath) {
                textLabel.setTitleColor(UIColor.lightGray, for: .normal)
            } else {
                textLabel.setTitleColor(UIColor.darkGray, for: .normal)
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        return CGSize(width: width, height: 40)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setDate()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calendar.collectionViewLayout.invalidateLayout()
    }

    func setDate() {
        timeLabel.text = months[currentMonth]!.0 + " \(currentYear)"
        calendar.reloadData()
    }
    
    @IBAction func setLastMonth(_ sender: UIButton) {
        currentMonth -= 1
        if currentMonth == 0 {
            currentMonth = 12
            currentYear -= 1
        }
        setDate()
    }
    
    @IBAction func setNextMonth(_ sender: UIButton) {
        currentMonth += 1
        if currentMonth == 13 {
            currentMonth = 1
            currentYear += 1
        }
        setDate()
    }
    
    var numberOfDaysInThisMonth:Int{
        let dateComponents = DateComponents(year: currentYear ,
                                            month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month,
                                           for: date)
        return range?.count ?? 0
    }
    
    func isLeapYearAndMarch() -> Bool {
        return currentYear % 4 == 0 && currentMonth == 3
    }
    
    func isSunday(_ indexPath: IndexPath) -> Bool {
        return ((indexPath.row + 1) % 7) == 0
    }
}
