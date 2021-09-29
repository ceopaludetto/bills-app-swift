//
//  Network.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Apollo
import Foundation

class NetworkInterceptorProvider: DefaultInterceptorProvider {
  override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    var interceptors = super.interceptors(for: operation)

    interceptors.insert(AuthenticationSendInterceptor(), at: 0)
    interceptors.insert(AuthenticationSaveInterceptor(), at: interceptors.endIndex)

    return interceptors
  }
}

class Network {
  static let shared = Network()

  private(set) lazy var apollo: ApolloClient = {
    let cache = InMemoryNormalizedCache()
    let store = ApolloStore(cache: cache)

    let client = URLSessionClient()
    let provider = NetworkInterceptorProvider(client: client, store: store)
    let url = URL(string: "http://192.168.15.18:3000/graphql")!

    let requestChain = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

    return ApolloClient(networkTransport: requestChain, store: store)
  }()
}
