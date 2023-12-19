// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CharactersQuery: GraphQLQuery {
  public static let operationName: String = "characters"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query characters { characters { __typename results { __typename id image status } } }"#
    ))

  public init() {}

  public struct Data: GraphqlAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: GraphqlAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.Characters }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: GraphqlAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphqlAPI.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", GraphqlAPI.ID?.self),
          .field("image", String?.self),
          .field("status", String?.self),
        ] }

        /// The id of the character.
        public var id: GraphqlAPI.ID? { __data["id"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? { __data["status"] }
      }
    }
  }
}
