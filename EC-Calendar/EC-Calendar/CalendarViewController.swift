//
//  CalendarViewController.swift
//  EC-Calendar
//
//  Created by LAM Chun Kit on 17/3/2019.
//  Copyright © 2019 Group8. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController//, UICollectionViewDataSource, UICollectionViewDelegate{
{
//    @IBOutlet weak var calendar: UICollectionView!
//
//    @IBOutlet weak var monthLabel: UILabel!
//
//    let months = ["Jan": 0, "Feb": 3, "Mar": 3, "Apr": 6, "May":1, "Jun": 4, "Jul": 6, "Aug":2, "Sept": 5, "Oct": 6, "Nov": 2, "Dec":4]
//
//    var currentYear = Calendar.current.component(.year, from: Date())
//    var currentMonth = Calendar.current.component(.month, from: Date())
//
//    var numberOfDaysInThisMonth: Int {
//        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
//        let date = Calendar.current.date(from: dateComponents)!
//        let range = Calendar.current.range(of: .day, in: .month, for: date)
//        return range?.count ?? 0
//    }
//
//    var whatDatIsIt: Int {
//        let dateComponents = DateComponents(year: currentYear, month: currentMonth)
//        let date = Calendar.current.date(from: dateComponents)!
//        return Calendar.current.component(.weekday, from: date)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return numberOfDaysInThisMonth + Array(months)[currentMonth - 1].value
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        if let textButton = cell.contentView.subviews[0] as? UIButton{
//            var numberOfDaysAdded = Array(months)[currentMonth - 1].value
//            if isLeapYear() {
//                numberOfDaysAdded += 1
//            }
//            if indexPath.row < numberOfDaysAdded {
//                textButton.setTitle("", for: .normal)
//            } else {
//                textButton.setTitle("\(indexPath.row + 1 - numberOfDaysAdded)", for: .normal)
//            }
//            if ((indexPath.row + 1) % 7) == 0 {
//                textButton.setTitleColor(UIColor.lightGray, for: .normal)
//            } else {
//                textButton.setTitleColor(UIColor.darkGray, for: .normal)
//            }
//        }
//        return cell
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        setDate()
        // Do any additional setup after loading the view.
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInterimSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = CollectionView.frame.width / 7
//        return CGSize(width: width, height: 40)
//    }
//
//    func setDate() {
//        monthLabel.text = Array(months)[currentMonth - 1].key
//        calendar.reloadData()
//    }
//
//    func isLeapYear() -> Bool {
//        return currentYear % 4 == 0 && currentMonth  == 3
//    }
//
//    @IBAction func setNextMonth(_ sender: UIButton) {
//        currentMonth += 1
//        if currentMonth == 13{
//            currentMonth = 1
//            currentYear += 1
//        }
//        setDate()
//    }
//
//
//    @IBAction func setLastMonth(_ sender: UIButton) {
//        currentMonth -= 1
//        if currentMonth == 0{
//            currentMonth = 12
//            currentYear -= 1
//        }
//        setDate()
//    }


}
