// Exit if spectator
if (hasInterface && (typeOf player isEqualTo "potato_spectate_spectator" || typeOf player isEqualTo "ace_spectator_virtual")) exitWith {  // Check if player, even a host
	//systemChat "You are a spectator";
};

//Sets up local variables
Current_Laps = 1;
initial_Lap = true;
Current_Checkpoint = 1;
Sub_CP_obj = FINISH_LINE;
No_item = true;
UI_Color_int = [0,11] call BIS_fnc_randomInt;
UI_Color = [0.133,0.349,0.522,0.65];
Next_Sub_CP_Num = 0;
Loc_Array = [0, 0, 0, 0, player];
Player_Finished = false;
Current_Place = "N/A";
CP_NUM = count allMissionObjects "VR_3DSelector_01_complete_F";
SUB_CP_NUM = count allMissionObjects "Sign_Arrow_Large_Cyan_F";
Lightning_Particle_Effect = false;
CP_Manual_Override = false;
Sub_CP_Manual_Override = false;

//Sets the color values for UI Color Toggle function
Light_Blue = [0.133,0.349,0.522,0.65];
Light_Green = [0.114,0.639,0.255,0.65];
Light_Red = [0.749,0.141,0.129,0.65];
Light_Orange = [0.961,0.404,0.106,0.65];
Dark_Blue = [0,0.051,1,0.65];
Purple = [0.584,0,1,0.65];
Pink = [1,0.02,0.855,0.65];
Blue_violet = [0.451,0.4,0.741,0.65];
Bronze = [0.69,0.549,0.341,0.65];
Rose_Gold = [0.718,0.431,0.475,0.65];
Yellow = [1,1,0,0.65];
Khaki = [0.741,0.718,0.42,0.65];

uiNamespace setVariable ["NJP_Block_Keys", 0];
uiNamespace setVariable ["NJP_Block_Keys_EH", nil];

//Sets player vic fuel to 0
[vehicle player, 0] remoteexec ['setfuel',vehicle player, true];
			
//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

// NAMETAGS
[] execVM "Armakart_Main\Armakart_Scripts\Armakart_Scripts_Whale's_Nametags\wha_nametags_init.sqf";

WHA_NAMETAGS_TESTLOOP = [{{WHA_NAMETAGS_PLAYER reveal [_x,4]} forEach allUnits;}, 10, []] call CBA_fnc_addPerFrameHandler;

//Sets group name for spectator boys
[group player, [(name player)]] remoteExec ["setGroupIdGlobal", 2, true];
	
//Player markers for GPS
execVM 'Armakart_Main\Armakart_Scripts\Player_Markers.sqf';

//Compiles client functions
_Client_Fnc_init = execVM "Armakart_Main\Armakart_Scripts\Client_Fnc_Library.sqf";

waitUntil {scriptDone _Client_Fnc_init};

//Sets players initial character
["Farmer"] call NJP_Client_Fnc_Character_Swap;

[] spawn NJP_JIP_CHECK;

systemChat "|Armakart System| : Client initialization completed!";