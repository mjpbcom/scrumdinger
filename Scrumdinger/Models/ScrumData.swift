//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by Mariah Jessica Baysic on 7/2/21.
//

import Foundation

class ScrumData: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find documents folder")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("scrums.data")
    }
    
// MARK: - Load (from File)
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyScrum.testData
                }
                #endif
                return
            }
            guard let dailyScrums = try? JSONDecoder().decode([DailyScrum].self, from: data) else {
                fatalError("Can't decode saved scrum data")
            }
            
            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
    
// MARK: - Save (to File)
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let scrums = self?.scrums else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(scrums) else { fatalError("Error encoding scrum data") }
            
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
