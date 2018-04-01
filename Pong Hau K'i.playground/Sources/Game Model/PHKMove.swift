import GameplayKit

public class PHKMove: NSObject, GKGameModelUpdate {
    /// The id of the place to move to.
    public var value: Int
    public init(from slot: Int) {
        self.value = slot
    }
}
