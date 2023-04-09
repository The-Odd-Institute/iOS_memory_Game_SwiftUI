
import SwiftUI

struct TitleView: View
{    
    var body: some View
    {
        Text ("Memory Game")
            .font(.largeTitle)
            .padding(12)
            .frame(maxWidth: .infinity,
                   minHeight: 128,
                   alignment: .bottom)
            .background(.orange)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
