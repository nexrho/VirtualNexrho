// The Swift Programming Language
// https://docs.swift.org/swift-book

import Initializable
import MachineAPIClient
import ContainerResource
import ContainerAPIClient

public protocol VNServiceProvider {
    associatedtype T
    
    func create() async throws -> T?
    func listAll() async throws -> [T]
}

@AutoAwaitThrowingInit
public final class MachineServiceProvider: ThrowingInitializable, VNServiceProvider {
    public let gate = ThrowingInitializationGate()
    
    public init() {
        Task { await markInitialized() }
    }
    
    public func create() async throws -> MachineSnapshot? { nil }
    
    public func listAll() async throws -> [MachineSnapshot] { [] }
}

@AutoAwaitThrowingInit
public final class ContainerServiceProvider: ThrowingInitializable, VNServiceProvider {
    public let gate = ThrowingInitializationGate()
    
    public init() {
        Task { await markInitialized() }
    }
    
    public func create() async throws -> ContainerSnapshot? { nil }
    
    public func listAll() async throws -> [ContainerSnapshot] { [] }
}
