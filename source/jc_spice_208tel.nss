#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer1 = GetObjectByTag("MilHighPlstcCylin");
	object oContainer2 = GetObjectByTag("CivilFootLker");
	
	if( !GetIsObjectValid(oContainer1) || !GetIsObjectValid(oContainer2) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	
	PlaceSpice(oContainer1, GetSpiceCommon());
	PlaceSpice(oContainer1, GetSpiceCommon());
	
	// Sansanna
	PlaceSpice(oContainer2, 12);
	PlaceSpice(oContainer2, 12);
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}