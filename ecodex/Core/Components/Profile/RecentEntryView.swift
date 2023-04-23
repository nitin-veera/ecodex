
import SwiftUI

struct RecentEntryView: View {
    @ObservedObject var viewModel: RecentEntryViewModel
    
    init(entry: Entry) {
        self.viewModel = RecentEntryViewModel(entry: entry)
        print(viewModel.entry.id!)
    }

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 200)
                .cornerRadius(15)
                .foregroundColor(Color("TertiaryTheme"))
                .padding(.horizontal, 2)
            VStack {
                if let image = viewModel.entryImage {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(15)
                        .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        .offset(x: 0, y: -4)
                }
                else {
                    Image("Verbena")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .cornerRadius(15)
                        .shadow(color: Color(.gray).opacity(0.4), radius: 5)
                        .offset(x: 0, y: -4)
                }
                VStack {
                    if viewModel.plant != nil {
                        Text(viewModel.plant!.commonName)
                            .foregroundColor(Color(.white))
                        Text(viewModel.plant!.scientificName)
                            .font(.caption)
                            .foregroundColor(Color(.white))
                    }
                }
                .offset(x: 0, y: -4)
            }
        }
        .padding(.horizontal, 2)
    }
}

//struct RecentEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentEntryView()
//    }
//}
