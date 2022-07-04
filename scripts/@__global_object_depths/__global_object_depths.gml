// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // objControlglobal.__objectDepths[1] = -1; // objBallglobal.__objectDepths[2] = 0; // objSimpleExample

global.__objectNames[0] = "objControl";global.__objectNames[1] = "objBall";global.__objectNames[2] = "objSimpleExample";

global.__objectDepths[3] = -1000; // obj_Shockwave
global.__objectDepths[4] = 0; // obj_DEMO
global.__objectDepths[5] = 0; // obj_DEMO_Button_Parent
global.__objectDepths[6] = 0; // obj_DEMO_ViewEnable
global.__objectDepths[7] = 0; // obj_DEMO_Update
global.__objectDepths[8] = 0; // obj_DEMO_Additive
global.__objectDepths[9] = 0; // obj_DEMO_WaveWidth_Up
global.__objectDepths[10] = 0; // obj_DEMO_WaveWidth_Down
global.__objectDepths[11] = 0; // obj_DEMO_WaveRadius_Up
global.__objectDepths[12] = 0; // obj_DEMO_WaveRadius_Down
global.__objectDepths[13] = 0; // obj_DEMO_WaveSpeed_Up
global.__objectDepths[14] = 0; // obj_DEMO_WaveSpeed_Down
global.__objectDepths[15] = 0; // obj_DEMO_WaveSegment_Up
global.__objectDepths[16] = 0; // obj_DEMO_WaveSegment_Down
global.__objectDepths[17] = 0; // obj_DEMO_WaveColour_Up
global.__objectDepths[18] = 0; // obj_DEMO_WaveColour_Down
global.__objectDepths[19] = 0; // obj_DEMO_WavePush_Up
global.__objectDepths[20] = 0; // obj_DEMO_WavePush_Down


global.__objectNames[3] = "obj_Shockwave";
global.__objectNames[4] = "obj_DEMO";
global.__objectNames[5] = "obj_DEMO_Button_Parent";
global.__objectNames[6] = "obj_DEMO_ViewEnable";
global.__objectNames[7] = "obj_DEMO_Update";
global.__objectNames[8] = "obj_DEMO_Additive";
global.__objectNames[9] = "obj_DEMO_WaveWidth_Up";
global.__objectNames[10] = "obj_DEMO_WaveWidth_Down";
global.__objectNames[11] = "obj_DEMO_WaveRadius_Up";
global.__objectNames[12] = "obj_DEMO_WaveRadius_Down";
global.__objectNames[13] = "obj_DEMO_WaveSpeed_Up";
global.__objectNames[14] = "obj_DEMO_WaveSpeed_Down";
global.__objectNames[15] = "obj_DEMO_WaveSegment_Up";
global.__objectNames[16] = "obj_DEMO_WaveSegment_Down";
global.__objectNames[17] = "obj_DEMO_WaveColour_Up";
global.__objectNames[18] = "obj_DEMO_WaveColour_Down";
global.__objectNames[19] = "obj_DEMO_WavePush_Up";
global.__objectNames[20] = "obj_DEMO_WavePush_Down";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for