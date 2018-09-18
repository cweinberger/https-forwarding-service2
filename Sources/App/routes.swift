import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    router.get("google") { req in
        return try req.client().get("https://www.google.de")
    }

    router.get("google-map") { req -> Future<Response> in
        return try req.client().get("https://www.google.de").map { response in

            return req.makeResponse(http: response.http)
        }
    }
}
