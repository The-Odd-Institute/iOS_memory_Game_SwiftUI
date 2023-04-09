import SwiftUI

struct RestartView: View
{
    let action: () -> Void
    
    var body: some View
    {
        Button ("Restart")
        {
            action ()
        }
        .frame(maxWidth: .infinity, minHeight: 96)
        .font(.title)
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(80)
        .padding(16)
    }
}


struct RestartView_Previews: PreviewProvider {
    static var previews: some View {
        RestartView(action: {})
    }
}
