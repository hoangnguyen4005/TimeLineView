//
//  TimeLineItemView.swift
//  TimeLineView
//
//  Created by hoangnc on 16/10/20.
//

import UIKit

class TimeLineItemView: UIView {
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var bigCircleView: UIView!
    @IBOutlet weak var smallCircleView: UIView!

    @IBOutlet weak var topDateLabel: UILabel!
    @IBOutlet weak var bottomDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var assignLabel: UILabel!

    // swiftlint:disable implicit_getter
    var startCirclePoint: CGPoint {
        get {
            return CGPoint(x: self.bigCircleView.center.x,
                           y: self.bigCircleView.frame.origin.y)
        }
    }
    // swiftlint:disable implicit_getter
    var endCirclePoint: CGPoint {
        get {
            return CGPoint(x: self.bigCircleView.center.x,
                           y: self.bigCircleView.frame.origin.y +
                            self.bigCircleView.frame.height)
        }
    }

    var topDate: String? {
        get {
            return self.topDateLabel.text
        }
        set(value) {
            self.topDateLabel.text = value
        }
    }

    var bottomDate: String? {
        get {
            return self.bottomDateLabel.text
        }
        set(value) {
            self.bottomDateLabel.text = value
        }
    }

    var title: String? {
        get {
            return self.titleLabel.text
        }
        set(value) {
            self.titleLabel.text = value
        }
    }

    var assign: String? {
        get {
            return self.assignLabel.text
        }
        set(value) {
            self.assignLabel.text = value
            assignLabel.addInterlineSpacing(spacingValue: 4.00)
        }
    }

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// :nodoc:
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = UIColor.clear
        _ = fromNib(nibName: String(describing: TimeLineItemView.self), isInherited: true)
        coverView.backgroundColor = ThemeColor.lightGrey
        coverView.layer.borderColor = ThemeColor.light.cgColor
        coverView.layer.borderWidth = 1.0
        coverView.layer.cornerRadius = 4.00

        topDateLabel.font = UIFont.systemFont(ofSize: 12.0)
        topDateLabel.textColor = ThemeColor.darkBlueGrey

        bottomDateLabel.font = UIFont.systemFont(ofSize: 12.0)
        bottomDateLabel.textColor = ThemeColor.darkBlueGrey

        titleLabel.font = UIFont.systemFont(ofSize: 12.0)
        titleLabel.textColor = ThemeColor.darkBlueGrey

        assignLabel.font = UIFont.systemFont(ofSize: 16.0)
        assignLabel.textColor = ThemeColor.deepBlue
        assignLabel.numberOfLines = 0

        bigCircleView.clipsToBounds = true
        bigCircleView.backgroundColor = ThemeColor.white
        bigCircleView.layer.cornerRadius = bigCircleView.frame.width/2.0
        bigCircleView.layer.borderWidth = 1.0
        bigCircleView.layer.borderColor = ThemeColor.light.cgColor

        smallCircleView.clipsToBounds = true
        smallCircleView.layer.cornerRadius = smallCircleView.frame.width/2.0
        smallCircleView.backgroundColor = ThemeColor.darkBlue
    }
}
