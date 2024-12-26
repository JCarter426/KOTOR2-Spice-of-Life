#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
		
	object oContainer1 = GetNearestObjectByTag("SpiceCase", OBJECT_SELF, 1);
	object oContainer2 = GetNearestObjectByTag("SpiceCase", OBJECT_SELF, 2);
	
	if( !GetIsObjectValid(oContainer1) || !GetIsObjectValid(oContainer2) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	// Ryll/Glitterstim
	PlaceSpice(oContainer1, 11);
	PlaceSpice(oContainer2, 11);
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}