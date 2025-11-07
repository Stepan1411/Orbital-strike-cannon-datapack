# Requirements Document

## Introduction

This document defines the requirements for a Minecraft dialog-based user interface system for managing orbital strike charges. The system allows players to add, remove, view, and launch orbital strike charges at specified coordinates using Minecraft's native dialog system. The interface supports two charge types (Stab and Nuke) with three power levels each.

## Glossary

- **Dialog System**: Minecraft's native UI system for creating interactive forms and menus
- **Charge**: A stored orbital strike target with coordinates, type, and power level
- **Charge List**: A collection of up to 10 stored charges
- **Stab Strike**: A precision orbital strike type
- **Nuke Strike**: A high-damage area orbital strike type
- **Power Level**: The intensity of the strike (Power 1, Power 2, or Power 3)
- **Armor Stand**: A Minecraft entity used as an execution point for strike commands
- **Chunk Loading**: The process of loading a world chunk to ensure commands execute properly

## Requirements

### Requirement 1

**User Story:** As a player, I want to open a main menu dialog, so that I can access all orbital strike management functions

#### Acceptance Criteria

1. WHEN a player triggers the dialog system, THE Dialog System SHALL display a main menu with options for "Add Charge", "Remove Charge", "Launch Charges", and "Remove List"
2. THE Dialog System SHALL display a visual separator between action buttons and the charge list
3. THE Dialog System SHALL display all currently stored charges with their coordinates, type, and power level
4. WHEN a player selects "Add Charge", THE Dialog System SHALL open the add charge dialog
5. WHEN a player selects "Remove Charge", THE Dialog System SHALL enable removal mode for the charge list

### Requirement 2

**User Story:** As a player, I want to add a new charge with specific coordinates and properties, so that I can prepare orbital strikes at target locations

#### Acceptance Criteria

1. WHEN a player opens the add charge dialog, THE Dialog System SHALL display input fields for X, Y, and Z coordinates
2. THE Dialog System SHALL provide a "Paste Player Coords" button that automatically fills coordinate fields with the player's current position
3. THE Dialog System SHALL provide a dropdown selector for charge type with options "Stab" and "Nuke"
4. THE Dialog System SHALL provide a dropdown selector for power level with options "Power 1", "Power 2", and "Power 3"
5. WHEN a player clicks "Add to List", THE Dialog System SHALL store the charge in the first available slot
6. WHEN a player clicks "Cancel", THE Dialog System SHALL return to the main menu without saving
7. IF the charge list contains 10 charges, THEN THE Dialog System SHALL display an error message and prevent adding more charges

### Requirement 3

**User Story:** As a player, I want to remove individual charges from the list, so that I can manage my stored targets

#### Acceptance Criteria

1. WHEN a player activates remove mode, THE Dialog System SHALL display a minus button next to each stored charge
2. WHEN a player clicks a minus button, THE Dialog System SHALL remove that specific charge from the list
3. WHEN a charge is removed, THE Dialog System SHALL update the charge list display immediately
4. THE Dialog System SHALL allow removing charges until the list is empty

### Requirement 4

**User Story:** As a player, I want to launch all stored charges, so that I can execute multiple orbital strikes simultaneously

#### Acceptance Criteria

1. WHEN a player selects "Launch Charges", THE Dialog System SHALL process each stored charge in sequence
2. FOR each charge, THE Dialog System SHALL force load the chunk at the target coordinates
3. FOR each charge, THE Dialog System SHALL summon an armor stand at the exact target coordinates
4. IF the charge type is Stab and power is 1, THEN THE Dialog System SHALL execute function orbital:stab_power_1 at the armor stand location
5. IF the charge type is Stab and power is 2, THEN THE Dialog System SHALL execute function orbital:stab_power_2 at the armor stand location
6. IF the charge type is Stab and power is 3, THEN THE Dialog System SHALL execute function orbital:stab_power_3 at the armor stand location
7. IF the charge type is Nuke and power is 1, THEN THE Dialog System SHALL execute function orbital:nuke_power_1 at the armor stand location
8. IF the charge type is Nuke and power is 2, THEN THE Dialog System SHALL execute function orbital:nuke_power_2 at the armor stand location
9. IF the charge type is Nuke and power is 3, THEN THE Dialog System SHALL execute function orbital:nuke_power_3 at the armor stand location
10. WHEN the strike command completes, THE Dialog System SHALL remove the armor stand entity

### Requirement 5

**User Story:** As a player, I want to clear all charges from the list at once, so that I can quickly reset my target list

#### Acceptance Criteria

1. WHEN a player selects "Remove List", THE Dialog System SHALL clear all stored charges
2. THE Dialog System SHALL reset all charge slot data to empty state
3. WHEN the list is cleared, THE Dialog System SHALL display an empty charge list in the main menu
4. THE Dialog System SHALL provide confirmation feedback that the list was cleared

### Requirement 6

**User Story:** As a player, I want to see clear visual feedback for all actions, so that I understand what the system is doing

#### Acceptance Criteria

1. WHEN a charge is added successfully, THE Dialog System SHALL display a success message
2. WHEN a charge is removed, THE Dialog System SHALL display a confirmation message
3. WHEN charges are launched, THE Dialog System SHALL display launch status for each charge
4. WHEN an error occurs, THE Dialog System SHALL display a descriptive error message in red text
5. THE Dialog System SHALL use consistent color coding for success (green) and error (red) messages
