import SwiftUI

#Preview {
    ContentView()
}

struct FootballClub: Identifiable {
    let name: String
    let id = UUID()
}

let textColor = Color(red: 0.25, green: 0.25, blue: 0.25)
let backgroundColor = Color(red: 0.975, green: 0.975, blue: 0.975)

struct ContentView: View {
    @State private var footBallClubs: [FootballClub] = [
        .init(name: "🏴󠁧󠁢󠁥󠁮󠁧󠁿 Manchester United"),
        .init(name: "🇪🇸 Real Madrid"),
        .init(name: "🏴󠁧󠁢󠁥󠁮󠁧󠁿 Tottenham Hotspur"),
        .init(name: "🇮🇹 Internazionale"),
        .init(name: "🏴󠁧󠁢󠁥󠁮󠁧󠁿 Manchester City"),
        .init(name: "🇫🇷 Paris Saint-Germain"),
        .init(name: "🇩🇪 Bayern Munich"),
        .init(name: "🇪🇸 Atletico de Madrid"),
    ]

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(footBallClubs) { myObject in
                        HStack {
                            Text(myObject.name)
                                .foregroundStyle(textColor)
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.cyan)
                        }
                        .font(.title2)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                        .background(backgroundColor)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 10, x: 5, y: 5)
                    }
                    .onDelete(perform: { indexSet in })
                } header: {
                    VStack {
                        Image("trophy-star-white")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)
                        Text("Champions League")
                            .padding(.leading, 3)
                            .padding(.top, 0)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                } footer: {
                    Text("Check Game Scores")
                        .font(.title3)
                        .underline()
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listSectionSeparator(.hidden)
            }
            .listStyle(.plain)
            .overlay(alignment: .bottomTrailing) {
                ViewComponent2(frameSize: 50)
                    .padding(.trailing)
            }
            .background {
                LinearGradient(colors: [.green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
        }
    }
}






//struct ContentView: View {
//    @State private var countrys = [
//        ("🇯🇵 Japan", UUID()),
//        ("🇩🇪 Germany", UUID()),
//        ("🇪🇸 Spain", UUID()),
//        ("🇯🇵 Japan", UUID()),
//        ("🇩🇪 Germany", UUID()),
//        ("🇪🇸 Spain", UUID()),
//        ("🇯🇵 Japan", UUID()),
//        ("🇩🇪 Germany", UUID()),
//        ("🇪🇸 Spain", UUID()),
//    ]
//
//    var body: some View {
//        List {
//            Section {
//                ForEach(countrys, id: \.1) { country in
//                    Text(country.0)
//                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
//                            Button("delete", systemImage: "xmark.circle", action: {
//                                DispatchQueue.main.asyncAfter(deadline: .now()+0.35) {
//                                    withAnimation(Animation.easeIn(duration: 0.05)) {
//                                        countrys.removeAll { $0.1 == country.1 }
//                                    }
//                                }
//                            })
//                        }
//                        .tint(.clear)
//                }
//            } header: {
//                Text("Countrys")
//                    .foregroundStyle(.white)
//                    .font(.largeTitle.bold())
//                    .frame(maxWidth: .infinity)
//            }
//            .listRowSeparator(.hidden)
//            .listRowBackground(
//                Capsule()
//                    .fill(Color(white: 1, opacity: 0.8))
//                    .padding(.vertical, 2)
//                    .padding(.horizontal, 10)
//            )
//            .listRowInsets(.init(top: 10, leading: 25, bottom: 10, trailing: 25))
//        }
//        .listRowSpacing(10) // Listに対して付与
//        .listStyle(.plain)
//        .background {
//            LinearGradient(colors: [.orange, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//        }
//    }
//}
