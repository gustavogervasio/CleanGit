import Foundation
import UIKit

struct R {

    struct string {}

    struct color {
        static let c_45_45_45 = UIColor(r: 45, g: 45, b: 45)
        static let c_70_70_70 = UIColor(r: 70, g: 70, b: 70)
        static let c_223_230_233 = UIColor(r: 223, g: 230, b: 233)
    }

    struct font {
        static let n12 = UIFont.systemFont(ofSize: 12)
        static let b12 = UIFont.boldSystemFont(ofSize: 12)
        static let b14 = UIFont.boldSystemFont(ofSize: 14)
    }

    struct image {}

    struct url {
        static let mobile = URL(string: "https://api.github.com")!
    }
}
