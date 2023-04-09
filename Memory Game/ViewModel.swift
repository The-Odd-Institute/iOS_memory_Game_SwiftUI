import Foundation

class ViewModel: ObservableObject
{
    var gridSize = 4
    
    @Published
    var allTiles = [Tile]()
    
    @Published
    var won = false
    
    var firstTile : Tile!
    var secondTile: Tile!
    
    var aTileIsFlipping: Bool = false
    
    var animTime = 0.5
    
    var foundTiles = 0
    
    func compare ()
    {
        if secondTile == nil { return }
        
        if firstTile.num == secondTile.num
        {
            firstTile.status = .MATCHED
            secondTile.status = .MATCHED
            
            foundTiles += 2
            if (foundTiles == gridSize * gridSize)
            {
                won = true
            }
        }
        else
        {
            firstTile.status = .UNKNOWN
            secondTile.status = .UNKNOWN
        }
        
        // reset the compare more
        firstTile = nil
        secondTile = nil
    }
}
