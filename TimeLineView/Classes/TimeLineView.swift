//
//  TimeLineView.swift
//  TimeLineView
//
//  Created by hoangnc on 16/10/20.
//

import UIKit

public struct TimeLineModel {
    public var dayMonthYear: String!
    public var secondHourGMT: String!
    public var title: String!
    public var author: String!
    public init() {}
    public init(dayMonthYear: String,
                secondHourGMT: String,
                title: String,
                author: String) {
        self.dayMonthYear = dayMonthYear
        self.secondHourGMT = secondHourGMT
        self.title = title
        self.author = author
    }
}

extension TimeLineModel: Equatable {
    public static func == (lhs: TimeLineModel, rhs: TimeLineModel) -> Bool {
        return lhs.dayMonthYear == rhs.dayMonthYear &&
            lhs.secondHourGMT == rhs.secondHourGMT &&
            lhs.title == rhs.title &&
            lhs.author == rhs.author
    }
}

public protocol TimeLineViewDataSource: class {
    func timeLineData(_ timeLineView: TimeLineView) -> [TimeLineModel]
}

public class TimeLineView: UIView {
    public weak var dataSource: TimeLineViewDataSource?
    @IBOutlet weak var stackView: UIStackView!

    public convenience init() {
        self.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// :nodoc:
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    public func reloadView() {
        guard let dataSource = dataSource else { return }
        var indexDraw: Int = 0
        var previousPoint: CGPoint!
        var nextPoint: CGPoint!
        for item in dataSource.timeLineData(self) {
            let auditTrail = TimeLineItemView()
            auditTrail.topDate = item.dayMonthYear
            auditTrail.bottomDate = item.secondHourGMT
            auditTrail.title = item.title
            auditTrail.assign = item.author
            self.stackView.addArrangedSubview(auditTrail)
            self.stackView.layoutIfNeeded()
            indexDraw += 1
            if indexDraw == 2 {
                indexDraw = 1
                nextPoint = auditTrail.convert(auditTrail.startCirclePoint, to: stackView)
                self.drawLine(fromPoint: previousPoint, toPoint: nextPoint)
                previousPoint = auditTrail.convert(auditTrail.endCirclePoint, to: stackView)
            } else {
                previousPoint = auditTrail.convert(auditTrail.endCirclePoint, to: stackView)
            }
        }
    }
    private func drawLine(fromPoint: CGPoint, toPoint: CGPoint) {
        self.stackView.createDottedLine(width: 1.0,
                                        color: ThemeColor.light.cgColor,
                                        startX: fromPoint.x,
                                        startY: fromPoint.y,
                                        endX: toPoint.x,
                                        endY: toPoint.y,
                                        lineDashPattern: false)
    }
    private func commonInit() {
        backgroundColor = UIColor.clear
        _ = fromNib(nibName: String(describing: TimeLineView.self), isInherited: true)
        self.stackView.axis = .vertical
        self.stackView.distribution = .equalSpacing
        self.stackView.alignment = .fill
        self.stackView.spacing = 16.00
    }
}
