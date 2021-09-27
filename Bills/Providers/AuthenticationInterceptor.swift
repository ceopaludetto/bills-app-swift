//
//  AuthInterceptor.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Apollo
import Foundation

class AuthenticationSendInterceptor: ApolloInterceptor {
  func interceptAsync<Operation: GraphQLOperation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    if TokenManager.access.exists() {
      request.addHeader(name: "Authorization", value: "Bearer \(TokenManager.access.get()!)")
    }

    if TokenManager.refresh.exists() {
      request.addHeader(name: "RefreshToken", value: "Bearer \(TokenManager.refresh.get()!)")
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

    if res.parsedResponse?.errors?[0].message == "Unauthorized" {
      TokenManager.refresh.clear()
      TokenManager.access.clear()
    }

    let token = res.httpResponse.value(forHTTPHeaderField: "Authorization")
    let refreshToken = res.httpResponse.value(forHTTPHeaderField: "RefreshToken")

    if token != nil {
      TokenManager.access.set(token: token!)
    }

    if refreshToken != nil {
      TokenManager.refresh.set(token: refreshToken!)
    }
  }
}
