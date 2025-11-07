# Implementation Plan

- [-] 1. Create dialog JSON files for UI structure


  - [x] 1.1 Create main.json dialog with action buttons and charge list display

    - Define main menu structure with "Add Charge", "Remove Charge", "Launch Charges", and "Remove List" buttons
    - Add separator and dynamic charge list display area
    - Configure button actions to call appropriate functions
    - _Requirements: 1.1, 1.4, 1.5_



  - [ ] 1.2 Create add_charge.json form dialog for adding new charges
    - Define form with text inputs for X, Y, Z coordinates
    - Add dropdowns for charge type (Stab/Nuke) and power level (1/2/3)
    - Add "Paste Player Coords", "Add to List", and "Cancel" buttons
    - Configure form submission to call process_add function

    - _Requirements: 2.1, 2.2, 2.3, 2.4, 2.6_

  - [x] 1.3 Create main_remove.json dialog variant with removal buttons

    - Copy main.json structure
    - Add minus buttons next to each charge entry
    - Configure minus buttons to call remove_slot_X functions
    - _Requirements: 3.1, 3.2_

- [x] 2. Implement core charge management functions


  - [x] 2.1 Update init.mcfunction to initialize all required scoreboards


    - Add scoreboard objectives for charge storage (c0-c9 with x/y/z/type/power)
    - Add temporary scoreboards for player input processing
    - Add active flag scoreboards for slot tracking
    - _Requirements: 1.1, 2.1_

  - [x] 2.2 Create paste_coords.mcfunction to copy player position


    - Store player Pos[0] to osc.charge.x scoreboard
    - Store player Pos[1] to osc.charge.y scoreboard
    - Store player Pos[2] to osc.charge.z scoreboard
    - Display confirmation message with coordinates
    - Reopen add_charge dialog
    - _Requirements: 2.2_

  - [x] 2.3 Create process_add.mcfunction to handle form submission


    - Parse form data from dialog submission
    - Find first available slot by checking active flags
    - Call appropriate add_slot_X function if slot available
    - Display error message if list is full
    - Return to main dialog
    - _Requirements: 2.5, 2.7_

  - [x] 2.4 Create add_slot_X.mcfunction files for all 10 slots


    - Copy charge data from temporary scoreboards to slot scoreboards
    - Set slot active flag to 1
    - Set found flag to indicate successful addition
    - _Requirements: 2.5_



- [x] 3. Implement charge removal functionality

  - [x] 3.1 Create remove_slot_X.mcfunction files for all 10 slots

    - Reset slot scoreboards (x/y/z/type/power) to 0
    - Set slot active flag to 0
    - Display confirmation message
    - Return to main dialog
    - _Requirements: 3.2, 3.3_

  - [x] 3.2 Create clear_list.mcfunction to remove all charges


    - Iterate through all slots and reset their data
    - Set all active flags to 0
    - Display confirmation message
    - Return to main dialog
    - _Requirements: 5.1, 5.2, 5.3, 5.4_


- [x] 4. Implement charge launching system

  - [x] 4.1 Create launch_charges.mcfunction to process all active charges


    - Iterate through slots 0-9
    - Call launch_slot_X for each active slot
    - Display launch status messages
    - Return to main dialog
    - _Requirements: 4.1_

  - [x] 4.2 Create launch_slot_X.mcfunction files for all 10 slots


    - Check if slot is active
    - Store coordinates in NBT storage
    - Force load chunk at target coordinates
    - Summon invisible, invulnerable armor stand at exact coordinates
    - Execute appropriate strike function based on type and power
    - Kill armor stand after strike
    - _Requirements: 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 4.10_

  - [x] 4.3 Add strike function routing logic

    - Implement conditional execution for all 6 combinations (2 types × 3 powers)
    - Route to orbital:stab_power_1/2/3 for Stab strikes
    - Route to orbital:nuke_power_1/2/3 for Nuke strikes
    - _Requirements: 4.4, 4.5, 4.6, 4.7, 4.8, 4.9_


- [x] 5. Create dialog navigation helper functions

  - [x] 5.1 Create open_main.mcfunction to open main menu


    - Execute dialog open command for main menu
    - _Requirements: 1.1_

  - [x] 5.2 Update existing dialog functions to use new system


    - Ensure all dialog transitions work correctly
    - Verify cancel buttons return to appropriate dialogs
    - _Requirements: 2.6_

- [x] 6. Implement user feedback and messaging

  - [ ] 6.1 Add success messages for all operations
    - Green ✓ symbol for successful charge additions
    - Confirmation messages for removals
    - Launch status for each charge
    - _Requirements: 6.1, 6.2, 6.3_

  - [x] 6.2 Add error messages for failure cases

    - Red ✖ symbol for errors
    - "List full" message when capacity reached
    - Descriptive error messages for all failure scenarios
    - _Requirements: 6.4, 6.5_

- [x] 7. Integrate with existing orbital strike system



  - [x] 7.1 Verify compatibility with existing strike functions

    - Test that stab_power_1/2/3 functions work with armor stand execution
    - Test that nuke_power_1/2/3 functions work with armor stand execution
    - Ensure chunk loading works correctly
    - _Requirements: 4.4, 4.5, 4.6, 4.7, 4.8, 4.9_


  - [-] 7.2 Update load.mcfunction to call dialog init

    - Add call to dialog/init.mcfunction in main load function
    - Ensure scoreboards are initialized on datapack load
    - _Requirements: 1.1_
