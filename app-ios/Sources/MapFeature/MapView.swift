import ComposableArchitecture
import SwiftUI
import Strings
import Assets
import Theme

public struct MapState: Equatable {
    // FIXME: This is a temporary image.
    let mapURL = URL(string: "https://user-images.githubusercontent.com/5885032/191032572-b128660f-bff2-4cd4-8228-27cc8f8974a9.png")

    public init() {}
}

public enum MapAction {
    case tapPin
}
public struct MapEnvironment {
    public init() {}
}
public let mapReducer = Reducer<MapState, MapAction, MapEnvironment> { state, action, environment in
    switch action {
    case .tapPin:
        print("TODO: Pin is not implemented yet!")
        return .none
    }
}

public struct MapView: View {
    private let store: Store<MapState, MapAction>

    public init(store: Store<MapState, MapAction>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack(alignment: .center) {
                    AsyncImage(url: viewStore.mapURL)
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                }
                .navigationTitle(L10n.Map.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            viewStore.send(.tapPin)
                        }) {
                            Image(asset: Assets.pin)
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Spacer()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            store: .init(
                initialState: .init(),
                reducer: .empty,
                environment: MapEnvironment()
            )
        )
    }
}
#endif
