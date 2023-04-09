import Foundation

extension MainScreen
{
    func makeTiles ()
    {
        let count = vm.gridSize * vm.gridSize

        var nums = [Int](1...count/2)
        nums += nums
        nums.shuffle()
        
        vm.allTiles = []
        
        let tileWidth = gameSize / CGFloat(vm.gridSize)
        
        
        for i in 0..<count
        {
            let tile = Tile(num: nums[i],
                            height: tileWidth,
                            vm: vm)
            
            vm.allTiles.append(tile)
        }
    }
}
