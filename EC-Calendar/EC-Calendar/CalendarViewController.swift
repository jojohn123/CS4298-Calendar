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
    
    var months = [1: ("Jan", "一月", 0), 2: ("Feb", "二月", 3), 3: ("Mar", "三月", 4), 4: ("Apr","四月", 0), 5:("May","五月", 2), 6:("Jun", "六月", 5),7: ("Jul", "七月", 0), 8:("Aug", "八月", 3), 9:("Sept", "九月", 5), 10:("Oct", "十月", 0), 11:("Nov", "十一月", 3), 12:("Dec", "十二月", 4)]
    
    var currentYear = Calendar.current.component(.year, from: Date())
    
    var currentMonth = Calendar.current.component(.month, from: Date())
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var adjustment = months[currentMonth]!.2
        if !isLeapYear() {
            if isFeb() {
                adjustment += 1
            } else if isAug() {
                adjustment -= 1
            }
        }
        
        return numberOfDaysInThisMonth + adjustment
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let textLabel = cell.contentView.subviews[0] as? UIButton{
            textLabel.layer.cornerRadius = 14
            textLabel.clipsToBounds = true
            
            let NumberOfDaysAdded = months[currentMonth]!.2
//            if isLeapYearAndFeb() {
//                NumberOfDaysAdded += 1
//            }
            if indexPath.row < NumberOfDaysAdded {
                textLabel.setTitle("", for: .normal)
            } else {
                textLabel.setTitle("\(indexPath.row + 1 - NumberOfDaysAdded)", for: .normal)
            }
            if isSunday(indexPath) || is1stDec(textLabel.currentTitle!) {
                textLabel.setTitleColor(UIColor.lightGray, for: .normal)
            } else {
                textLabel.setTitleColor(UIColor.darkGray, for: .normal)
            }
            if isToday(textLabel.currentTitle!) {
                textLabel.backgroundColor = UIColor.brown
                textLabel.setTitleColor(UIColor.white, for: .normal)
            } else {
                textLabel.backgroundColor = UIColor.white
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
        if isEng() {
            timeLabel.text = months[currentMonth]!.0 + " \(currentYear)"
        } else {
            timeLabel.text = months[currentMonth]!.1 + " \(currentYear)"
        }
        
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
    
    func isLeapYear() -> Bool {
        return currentYear % 4 == 0
    }
    
    func isFeb() -> Bool {
        return currentMonth == 2
    }
    
    func isAug() -> Bool {
        return currentMonth == 8
    }
    
    func isSunday(_ indexPath: IndexPath) -> Bool {
        return ((indexPath.row + 1) % 7) == 0
    }
    
    func isToday(_ day: String) -> Bool {
        let sameYear = currentYear == Calendar.current.component(.year, from: Date())
        let sameMonth = currentMonth == Calendar.current.component(.month, from: Date())
        let sameDay = Int(day) == Calendar.current.component(.day, from: Date())
        return sameYear && sameMonth && sameDay
    }
    
    func is1stDec(_ day: String) -> Bool {
        let firstDayOfMonth = Int(day) == 1
        return currentMonth == 12 && firstDayOfMonth
    }
    
    func isEng() -> Bool {
        let lang = NSLocale.preferredLanguages[0]
        return lang.contains("en")
    }
}
