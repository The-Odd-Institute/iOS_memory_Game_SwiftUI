import SwiftUI

enum TileStatus
{
    case UNKNOWN
    case MATCHED
    case FLIPPED
}



struct Tile: View, Identifiable
{
    var id = UUID()
    var num: Int
    var height: CGFloat
    
    @State
    var status = TileStatus.UNKNOWN
    
    @State
    var degrees: Double = 0
    
    @ObservedObject
    var vm: ViewModel
    
    var body: some View
    {
        let frontCard : (num: String, col: Color) = {
            if degrees < 90 { return ("?", .brown)}
            else if degrees > 270 { return ("✅", .black) }
            else { return ("", .clear) }
        }()
        
        let backCard : (num: String, col: Color) = {
            if degrees < 90 || degrees > 270 { return ("", .clear) }
            else { return (String(num), .orange) }
        }()
        
        
        
        
        
        ZStack
        {
            Text(backCard.num)
                .font(.title)
                .frame(maxWidth: .infinity,
                       minHeight: height)
                .background(backCard.col)
                .rotation3DEffect(.degrees(180),
                                  axis: (x: 0, y: 1, z: 0))
            
            
            Text(frontCard.num)
                .font(.title)
                .frame(maxWidth: .infinity,
                       minHeight: height)
                .background(frontCard.col)
        }
        .onTapGesture
        {
            if self.status != .UNKNOWN ||
                vm.aTileIsFlipping
            {
                return 
            }
            
            vm.aTileIsFlipping = true
            
            
            status = .FLIPPED
            if vm.firstTile == nil { vm.firstTile = self }
            else if vm.secondTile == nil { vm.secondTile = self }
        }
        .rotation3DEffect(.degrees(degrees),
                          axis: (x: 0, y: 1, z: 0))
        .onChange(of: status) { newValue in
            withAnimation(.easeInOut(duration: vm.animTime))
            {
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + vm.animTime, execute: {
                    
                    vm.aTileIsFlipping = false
                    vm.compare()
                })
                
                
                
                if self.status == .MATCHED { degrees = 360 }
                else if self.status == .FLIPPED { degrees = 180 }
                else { degrees = 0 }
            }
        }
        
    }
}

struct Tile_Previews: PreviewProvider {
    static var previews: some View {
        Tile(num: 3, height: 200, vm: ViewModel())
    }
}
