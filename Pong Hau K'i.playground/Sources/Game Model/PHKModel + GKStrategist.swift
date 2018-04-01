import GameplayKit

extension PHKModel {
    public func isWin(for player: GKGameModelPlayer) -> Bool {
        guard let this = player as? PHKPlayer else { return false }
        return isLoss(for: this.opponent)
    }

    public func isLoss(for player: GKGameModelPlayer) -> Bool {
        guard let this = player as? PHKPlayer else { return false }
        for (slot, player) in board.enumerated().lazy {
            if player == this && isEmptySpotAccessible(from: slot) {
                return false
            }
        }
        return true
    }

    public func score(for player: GKGameModelPlayer) -> Int {
        guard let this = player as? PHKPlayer else { return 0 }
        if isWin(for: this) { return 10 }
        if isLoss(for: this) { return -10 }
        let other = this.opponent
        if board[2] == .no {
            return this == currentPlayer ? 8 : -9
        }
        if other == currentPlayer && board[2] == this
            && (board[0] == other && board[3] == other
                || board[1] == other && board[4] == other) {
            return 5
        } else { return 0 }
    }
}
