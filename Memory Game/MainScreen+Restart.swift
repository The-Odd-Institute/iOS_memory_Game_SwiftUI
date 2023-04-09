import Foundation

extension MainScreen
{
    func restart ()
    {
        vm.won = false
        vm.aTileIsFlipping = false
        vm.foundTiles = 0

        vm.firstTile = nil
        vm.secondTile = nil

        makeTiles()
    }
}
