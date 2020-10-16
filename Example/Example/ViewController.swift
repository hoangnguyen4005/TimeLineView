//
//  ViewController.swift
//  Example
//
//  Created by hoangnc on 16/10/20.
//

import UIKit
import TimeLineView

class ViewController: UIViewController {
    
    @IBOutlet weak var auditTrailView: TimeLineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auditTrailView.dataSource = self
        auditTrailView.reloadView()
    }
    func createMockup() -> [TimeLineModel] {
        let item1 = TimeLineModel(dayMonthYear: "20 Oct 2020,",
                                  secondHourGMT: "01:07:02 AM (GMT+8)",
                                  title: "Created By",
                                  assignName: "Chi Hoang")
        
        let item2 = TimeLineModel(dayMonthYear: "28 Oct 2020,",
                                  secondHourGMT: "01:07:02 AM (GMT+8)",
                                  title: "Comment By",
                                  assignName: "Harry")
        
        let item3 = TimeLineModel(dayMonthYear: "20 Oct 2020,",
                                  secondHourGMT: "01:07:02 AM (GMT+8)",
                                  title: "Pending By",
                                  assignName: "Harry Nguyen")
        
        let item4 = TimeLineModel(dayMonthYear: "30 Oct 2020,",
                                  secondHourGMT: "01:07:02 AM (GMT+8)",
                                  title: "Approved By",
                                  assignName: "Nguyen Chi Hoang")
        return [item1, item2, item3, item4]
    }
}
extension ViewController: TimeLineViewDataSource {
    func numberOfItems(_ timeLineView: TimeLineView) -> [TimeLineModel] {
        return createMockup()
    }
}

