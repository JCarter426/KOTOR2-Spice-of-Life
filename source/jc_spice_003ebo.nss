#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer = GetObjectByTag("EboHiddenContainer");
	
	if( !GetIsObjectValid(oContainer) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	
	PlaceSpice(oContainer, GetSpiceCommon());
	PlaceSpice(oContainer, GetSpiceCommon());
	PlaceSpice(oContainer, GetSpiceRare());
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}