import SwiftUI

struct NotificationView: View
{
    @ObservedObject
    var vm: ViewModel
    
    var body: some View
    {
        Text (vm.won ? "You won" : "Keep playing...")
            .font(.headline)
            .foregroundColor(vm.won ? .green : .gray)
            .padding([.leading, .trailing], 24)
            .padding([.top, .bottom], 8)
            .cornerRadius(16)
    }
}


struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(vm: ViewModel())
    }
}
