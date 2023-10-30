//
//  Functions.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import Foundation

// Inputs:
//    - the original list
//    - what outcome does the user want included (undetermined, incorrect, correct)
// Output:
//    - the filtered list
func filtering(
    originalList: [Result],
    on desiredOutcome: Outcome
) -> [Result] {
    
    // When the desired outcome is undetermined, just stop and return the original list
    if desiredOutcome == .undetermined {
        return originalList
    }
    
    // Create an empty list to populate before returning
    var filteredResults: [Result] = []
    
    // Iterate over the entire original list
    for result in originalList {
        
        // Copy any results that match the desired outcome to the new list
        if result.outcome == desiredOutcome {
            filteredResults.append(result)
        }
        
    }
    
    // Return only the filtered list
    return filteredResults
    
}
