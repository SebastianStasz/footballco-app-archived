//
//  Publisher+Ext.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Combine
import Foundation

extension Publisher {

    func `await`<T>(_ transform: @escaping (Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        flatMap { value in
            Future { promise in
                Task {
                    do {
                        let output = try await transform(value)
                        promise(.success(output))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
    }

    func `await`<O: AnyObject, T>(on object: O, perform: @escaping (O, Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        flatMap { value in
            Future { [weak object] promise in
                guard let object = object else { return }
                Task {
                    do {
                        let output = try await perform(object, value)
                        promise(.success(output))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
    }

    func perform<O: AnyObject, T>(
        on object: O,
        isLoading: PassthroughSubject<Bool, Never>? = nil,
        errorTracker: PassthroughSubject<Error, Never>? = nil,
        _ perform: @escaping (O, Output) async throws -> T
    ) -> Publishers.FlatMap<Publishers.SetFailureType<AnyPublisher<T, Never>, Never>, Self> {
        flatMap {
            Just($0)
                .handleEvents(receiveOutput: { _ in isLoading?.send(true) })
                .await(on: object, perform: perform)
                .catch(isLoading: isLoading, errorTracker: errorTracker)
                .receive(on: DispatchQueue.main)
                .handleEvents(receiveOutput: { _ in isLoading?.send(false) })
                .eraseToAnyPublisher()
        }
    }

    private func `catch`(isLoading: PassthroughSubject<Bool, Never>?, errorTracker: PassthroughSubject<Error, Never>? = nil) -> AnyPublisher<Output, Never> {
        `catch` { error -> AnyPublisher<Output, Never> in
            DispatchQueue.main.async {
                errorTracker?.send(error)
                isLoading?.send(false)
            }
            Swift.print("-----")
            Swift.print("‼️ \(error)")
            Swift.print("-----")
            return Just(nil).compactMap { $0 }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}


extension Publisher where Failure == Never {

    func sinkAndStore<VM: ViewModel>(on viewModel: VM, action: @escaping (VM, Output) -> Void) {
        sink { [weak viewModel] value in
            guard let viewModel = viewModel else { return }
            action(viewModel, value)
        }
        .store(in: &viewModel.cancellables)
    }
}
