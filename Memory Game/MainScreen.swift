import SwiftUI

struct MainScreen: View
{
    let gameSize = UIScreen.main.bounds.size.width - 20
    
    @StateObject
    var vm = ViewModel()
    
    var columns : Array <GridItem> {
        return (0..<vm.gridSize).map { _ in GridItem(.flexible(), spacing: 1) }
    }
    
    @State
    var picker = 1
    
    
    var body: some View
    {
        VStack
        {
            TitleView()
            
            Spacer()
            
            Picker(selection: $picker, label: Text("Some Label")) {
                Text("2 X 2").tag(0) // <3>
                Text("4 X 4").tag(1) // <3>
                Text("6 X 6").tag(2) // <4>
                Text("8 X 8").tag(3) // <5>
            }.onChange(of: picker) { _ in
                switch (picker)
                {
                case 1: vm.gridSize = 6
                case 2: vm.gridSize = 8
                default: vm.gridSize = 4
                }
                restart()
            }.pickerStyle(SegmentedPickerStyle())
                .padding(16)
                        
            LazyVGrid (columns: columns, spacing: 1)
            {
                ForEach (vm.allTiles) { tile in
                    tile
                }
            }.frame(width: gameSize, height: gameSize)
                .background(.gray)
            

            NotificationView(vm: vm)
            
            
            Spacer()
            
            RestartView(action: restart)

        }
        .onAppear()
        {
            restart()
        }
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
