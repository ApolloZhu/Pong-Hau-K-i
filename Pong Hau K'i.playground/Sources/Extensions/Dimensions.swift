import CoreGraphics
import Foundation

extension CGSize {
    static let standard = CGSize(
        width: 480, height: 640
    )
}

extension CGRect {
    static let standard = CGRect(
        origin: .zero, size: .standard
    )
}

extension CGFloat {
    static let r: CGFloat = 60
}

let cgCenters = [
    CGPoint(x: 80, y: 560),
    CGPoint(x: 400, y: 560),
    CGPoint(x: 240, y: 320),
    CGPoint(x: 400, y: 80),
    CGPoint(x: 80, y: 80)
]

let nsCenters: [NSPoint] = cgCenters.map {
    NSPoint(x: $0.x, y: $0.y)
}
