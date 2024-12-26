#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer = GetObjectByTag("CivilFootLker");
	
	if( !GetIsObjectValid(oContainer) )
		return;
	
	PlaceSpice(oContainer, GetSpiceMilitary());
	PlaceSpice(oContainer, GetSpiceMilitary());
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}