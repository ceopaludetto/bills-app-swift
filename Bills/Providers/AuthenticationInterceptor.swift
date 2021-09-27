//
//  AuthInterceptor.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Apollo
import Foundation

class AuthenticationSendInterceptor: ApolloInterceptor {
  private func addToken<Operation: GraphQLOperation>(token: String, chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    request.addHeader(name: "Authorization", value: "Bearer \(token)")
    chain.proceedAsync(request: request, response: response, completion: completion)
  }

  func interceptAsync<Operation: GraphQLOperation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    if TokenManager.shared.exists() {
      addToken(token: TokenManager.shared.get()!, chain: chain, request: request, response: response, completion: completion)
      return
    }

    chain.proceedAsync(request: request, response: response, completion: completion)
  }
}

class AuthenticationSaveInterceptor: ApolloInterceptor {
  enum AuthenticationSaveInterceptorErrors: Error {
    case NotYetReceived
  }

  func interceptAsync<Operation: GraphQLOperation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    defer {
      chain.proceedAsync(request: request, response: response, completion: completion)
    }

    guard let res = response else {
      chain.handleErrorAsync(AuthenticationSaveInterceptorErrors.NotYetReceived, request: request, response: response, completion: completion)

      return
    }

    let token = res.httpResponse.value(forHTTPHeaderField: "Authorization")

    if token != nil {
      TokenManager.shared.set(token: token!)
    }
  }
}
