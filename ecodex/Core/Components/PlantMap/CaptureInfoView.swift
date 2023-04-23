
import SwiftUI

struct CaptureInfoView: View {
    @ObservedObject var viewModel: CaptureInfoViewModel
    
    init(entry: Entry) {
        self.viewModel = CaptureInfoViewModel(entry: entry)
    }
    
    
    var body: some View {
        ZStack {
            Color("TertiaryTheme")
                .ignoresSafeArea()
            VStack(alignment: .center) {
                HStack {
                    if let image = viewModel.entryImage {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                            .offset(x: -32)
                    } else {
                        Image("Verbena")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                            .offset(x: -32)
                    }
                    if let plant = viewModel.plant {
                        Text(viewModel.plant!.commonName)
                            .foregroundColor(.white)
                            .font(.title)
                    } else {
                        Text("Verbena")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
                HStack {
                    if let image = viewModel.userImage {
                        Image(uiImage: image)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .scaleEffect(3)
                            .padding()
                    }
                    VStack(alignment: .leading) {
                        if let user = viewModel.user {Text(String("Caught by: \(user.username)")) }
                        Text("Location: \(viewModel.entry.location.latitude), \(viewModel.entry.location.longitude)")
//                        Text("Time Caught: \(viewModel.entry.timestamp).")
                    }
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.vertical, 10)
                }
            }
        }
    }
}

//struct CaptureInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaptureInfoView(entry:)
//    }
//}

