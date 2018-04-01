import GameplayKit

public class PHKMove: NSObject, GKGameModelUpdate {
    /// The id of the place to move to.
    public var slot: Int
    public var value: Int = 0
    private var idx: Int
    private static var idx = 0
    public init(from slot: Int) {
        self.slot = slot
        self.idx = PHKMove.idx
        PHKMove.idx += 1
    }
    override public var description: String {
        return "\(slot): \(value)"
    }
}
