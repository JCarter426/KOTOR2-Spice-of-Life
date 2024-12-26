#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer = GetObjectByTag("m_202_002");
	
	if( !GetIsObjectValid(oContainer) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	
	PlaceSpice(oContainer, GetSpiceRare());	
	// Andris
	PlaceSpice(oContainer, 1); 
	PlaceSpice(oContainer, 1);
	// Carsunum
	PlaceSpice(oContainer, 4);
	PlaceSpice(oContainer, 4);	
	// Ryll/Glitterstim
	PlaceSpice(oContainer, 11);
	PlaceSpice(oContainer, 11);	
	// Sansanna
	PlaceSpice(oContainer, 12);
	PlaceSpice(oContainer, 12);
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}