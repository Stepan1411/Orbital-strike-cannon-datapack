# Design Document

## Overview

The Orbital Strike Dialog System provides a user-friendly interface for managing orbital strike charges in Minecraft using the native dialog system. Players can add charges with specific coordinates and properties, view all stored charges, remove individual charges, launch all charges simultaneously, and clear the entire list. The system supports up to 10 charges with two strike types (Stab and Nuke) and three power levels each.

## Architecture

### Dialog Flow

```
Main Menu Dialog
├── Add Charge → Add Charge Dialog → Main Menu
├── Remove Charge → Main Menu (with removal buttons)
├── Launch Charges → Execute strikes → Main Menu
└── Remove List → Clear all → Main Menu
```

### Data Storage

The system uses Minecraft scoreboards to store charge data:
- 10 charge slots (0-9), each with 5 properties:
  - X coordinate
  - Y coordinate
  - Z coordinate
  - Type (0=Stab, 1=Nuke)
  - Power (0=Power1, 1=Power2, 2=Power3)
- Active flag for each slot to track occupied slots
- Temporary scores for player input and processing

## Components and Interfaces

### 1. Dialog Files (data/orbital/dialog/)

#### main.json
Main menu dialog displaying:
- Title: "Orbital Strike Control"
- Buttons:
  - "Add Charge" → Opens add_charge dialog
  - "Remove Charge" → Opens main_remove dialog
  - "Launch Charges" → Executes launch function
  - "Remove List" → Executes clear function
- Separator line
- Dynamic charge list display showing all active charges with format:
  - "Slot X: [Type] Power Y at (x, y, z)"

#### add_charge.json
Form dialog for adding new charges:
- Title: "Add Orbital Strike Charge"
- Input fields:
  - Text input: "X Coordinate" (coord_x)
  - Text input: "Y Coordinate" (coord_y)
  - Text input: "Z Coordinate" (coord_z)
- Dropdowns:
  - "Charge Type": ["Stab", "Nuke"] (charge_type)
  - "Power Level": ["Power 1", "Power 2", "Power 3"] (power_level)
- Buttons:
  - "Paste Player Coords" → Executes paste_coords function
  - "Add to List" → Executes process_add function
  - "Cancel" → Returns to main dialog

#### main_remove.json
Main menu with removal buttons:
- Same as main.json but with minus buttons next to each charge
- Each minus button executes remove_slot_X function

### 2. Function Files (data/orbital/function/dialog/)

#### init.mcfunction
Initializes all scoreboards:
- osc.charge.x/y/z - Temporary storage for player input
- osc.charge.type - Temporary storage for charge type
- osc.charge.power - Temporary storage for power level
- osc.charge.active - Tracks which slots are occupied
- osc.temp - Temporary calculations
- osc.c0-c9.x/y/z/type/power - Storage for 10 charge slots

#### paste_coords.mcfunction
Copies player's current position:
1. Store player Pos[0] to osc.charge.x
2. Store player Pos[1] to osc.charge.y
3. Store player Pos[2] to osc.charge.z
4. Display confirmation message
5. Reopen add_charge dialog with populated coordinates

#### process_add.mcfunction
Processes form submission from add_charge dialog:
1. Parse form data (coord_x, coord_y, coord_z, charge_type, power_level)
2. Find first free slot (check osc.charge.active for each slot)
3. If slot found:
   - Store coordinates, type, and power in slot scoreboards
   - Set slot active flag to 1
   - Display success message
4. If no slot found:
   - Display error message (list full)
5. Return to main dialog

#### add_slot_X.mcfunction (X = 0-9)
Stores charge data in specific slot:
1. Copy osc.charge.x/y/z to osc.cX.x/y/z
2. Copy osc.charge.type to osc.cX.type
3. Copy osc.charge.power to osc.cX.power
4. Set #chargeX osc.charge.active to 1
5. Set #found osc.temp to 1

#### launch_charges.mcfunction
Launches all active charges:
1. Iterate through slots 0-9
2. For each active slot, call launch_slot_X function
3. Display launch status messages
4. Return to main dialog

#### launch_slot_X.mcfunction (X = 0-9)
Launches charge from specific slot:
1. Check if slot is active
2. Store coordinates in NBT storage
3. Force load chunk at target coordinates
4. Summon invisible, invulnerable armor stand at coordinates
5. Based on type and power, execute appropriate function:
   - Type 0, Power 0: orbital:stab_power_1
   - Type 0, Power 1: orbital:stab_power_2
   - Type 0, Power 2: orbital:stab_power_3
   - Type 1, Power 0: orbital:nuke_power_1
   - Type 1, Power 1: orbital:nuke_power_2
   - Type 1, Power 2: orbital:nuke_power_3
6. Kill armor stand
7. Unload chunk

#### remove_slot_X.mcfunction (X = 0-9)
Removes charge from specific slot:
1. Reset osc.cX.x/y/z/type/power to 0
2. Set #chargeX osc.charge.active to 0
3. Display confirmation message
4. Return to main dialog

#### clear_list.mcfunction
Clears all charges:
1. Call remove_slot_X for all slots 0-9
2. Display confirmation message
3. Return to main dialog

#### open_main.mcfunction
Opens main menu dialog:
1. Execute `dialog open @s orbital:main`

## Data Models

### Charge Data Structure
```
Charge {
  x: integer (coordinate)
  y: integer (coordinate)
  z: integer (coordinate)
  type: integer (0=Stab, 1=Nuke)
  power: integer (0=Power1, 1=Power2, 2=Power3)
  active: boolean (1=occupied, 0=free)
}
```

### Scoreboard Objectives
```
osc.charge.x/y/z - Player input buffer
osc.charge.type - Player input buffer
osc.charge.power - Player input buffer
osc.charge.active - Slot occupation tracker
osc.temp - Temporary calculations
osc.c[0-9].x/y/z - Charge slot coordinates
osc.c[0-9].type - Charge slot type
osc.c[0-9].power - Charge slot power
```

## Error Handling

### Input Validation
- Coordinate inputs: Accept any integer value (Minecraft handles invalid coordinates)
- Type selection: Dropdown ensures valid selection (0 or 1)
- Power selection: Dropdown ensures valid selection (0, 1, or 2)

### Capacity Management
- Check slot availability before adding
- Display error message when list is full (10 charges)
- Prevent adding beyond capacity

### Launch Safety
- Force load chunks before spawning entities
- Use invulnerable armor stands to prevent premature destruction
- Clean up armor stands after strike execution
- Handle empty slots gracefully (skip inactive slots)

### User Feedback
- Success messages in green with ✓ symbol
- Error messages in red with ✖ symbol
- Coordinate confirmation when pasting player position
- Launch status for each charge
- Clear confirmation when removing charges

## Testing Strategy

### Unit Testing
- Test each slot add/remove function individually
- Verify scoreboard initialization
- Test coordinate paste functionality
- Validate form data parsing

### Integration Testing
- Test full add-launch-remove workflow
- Verify dialog navigation flow
- Test capacity limits (add 10+ charges)
- Test launching with mixed charge types and powers
- Test clearing full and partial lists

### Edge Cases
- Add charge when list is full
- Launch with empty list
- Remove from empty slot
- Paste coordinates at extreme positions
- Rapid dialog interactions

### User Acceptance Testing
- Verify dialog UI displays correctly
- Test all button interactions
- Confirm visual feedback is clear
- Validate strike execution at correct coordinates
- Ensure proper cleanup after launches

## Implementation Notes

### Dialog System Compatibility
- Uses Minecraft 1.20.5+ dialog system
- JSON dialog files in data/orbital/dialog/
- Form controls: text inputs, dropdowns, buttons
- Dialog opening via `dialog open` command

### Performance Considerations
- Chunk loading may cause brief lag
- Limit to 10 charges to prevent excessive entity spawning
- Armor stands cleaned up immediately after strike
- Scoreboards are efficient for data storage

### Localization
- All text in English as requested
- Messages use consistent formatting
- Color coding for clarity (green=success, red=error, aqua=data)

### Future Enhancements
- Configurable charge limit
- Named charges for easier identification
- Charge preview before launch
- Selective launch (individual charges)
- Import/export charge lists
