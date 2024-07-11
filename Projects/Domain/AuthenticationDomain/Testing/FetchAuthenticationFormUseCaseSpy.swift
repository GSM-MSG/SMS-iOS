import AuthenticationDomainInterface

public final class FetchAuthenticationFormUseCaseSpy: FetchAuthenticationFormUseCase {
    public var callCount = 0
    public var handler: (() async throws -> AuthenticationFormEntity)? = {
        return AuthenticationFormEntity(
            files: [
                AuthenticationFormEntity.File(name: "File 1", url: "http://example.com/file1"),
                AuthenticationFormEntity.File(name: "File 2", url: "http://example.com/file2")
            ],
            areas: [
                AuthenticationFormEntity.Area(
                    title: "Area 1",
                    sections: [
                        SectionEntity(
                            sectionId: "1",
                            title: "Section 1",
                            maxCount: 5,
                            groups: [
                                GroupEntity(
                                    groupId: "group1",
                                    maxScore: 100.0,
                                    fields: [
                                        FieldEntity(
                                            fieldId: "field1",
                                            type: FieldType.text,
                                            scoreDescription: "Description 1",
                                            values: nil,
                                            placeholder: "Enter Text"
                                        ),
                                        FieldEntity(
                                            fieldId: "field2",
                                            type: FieldType.number,
                                            scoreDescription: "Description 2",
                                            values: nil,
                                            placeholder: "Enter Number"
                                        ),
                                        FieldEntity(
                                            fieldId: "field3",
                                            type: FieldType.select,
                                            scoreDescription: "Description 3",
                                            values: [
                                                ValueEntity(selectId: "f3s1", value: "Option1"),
                                                ValueEntity(selectId: "f3s2", value: "Option2"),
                                                ValueEntity(selectId: "f3s3", value: "Option3")
                                            ],
                                            placeholder: "Select Select"
                                        ),
                                        FieldEntity(
                                            fieldId: "field4",
                                            type: FieldType.boolean,
                                            scoreDescription: "Description 3",
                                            values: [
                                                ValueEntity(selectId: "f4s1", value: "Option1"),
                                                ValueEntity(selectId: "f4s2", value: "Option2")
                                            ],
                                            placeholder: "Select boolean"
                                        ),
                                        FieldEntity(
                                            fieldId: "field5",
                                            type: FieldType.file,
                                            scoreDescription: "Description 4",
                                            values: nil,
                                            placeholder: "Select file"
                                        ),
                                    ]
                                )
                            ]
                        )
                    ]
                )
            ]
        )
    }

    public init() {}

    public func execute() async throws -> AuthenticationFormEntity {
        guard let handler else { fatalError() }
        return try await handler()
    }
}
