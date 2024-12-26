#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer1 = GetNearestObjectByTag("MilLowMetalBox", GetObjectByTag("Medben"));
	object oContainer2 = GetObjectByTag("EboHiddenContainer");
	
	if( !GetIsObjectValid(oContainer1) || !GetIsObjectValid(oContainer2) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	
	// Andris
	PlaceSpice(oContainer1, 1);
	PlaceSpice(oContainer1, 1);
	
	PlaceSpice(oContainer2, GetSpiceCommon());
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}