int GetSpiceAmount(int nLevel);
int GetSpiceCommon();
int GetSpiceMilitary();
int GetSpiceRare();
string GetSpiceTemplate(int nSpice, int nLevel);
int GetTreasureLevel(object obj);
void PlaceSpice(object oContainer, int nSpice);
int UpgradeSpice(int nSpice);

int GetSpiceAmount(int nLevel) {
	return Random(nLevel / 5 + 2) + 1;
}

int GetSpiceCommon() {
	switch( Random(4) ) {
	case 0: return 1;  // Andris
	case 1: return 4;  // Carsunum
	case 2: return 11; // Ryll/Glitterstim
	case 3: return 12; // Sansanna
	}
	return 0;
}
	
int GetSpiceMilitary() {
	switch( Random(3) ) {
	case 0: return 3;  // Booster Blue
	case 1: return 7;  // Karrak
	case 2: return 10; // Pyrepenol
	}
	return 0;
}

int GetSpiceRare() {
	switch( Random(5) ) {
	case 0: return 5;  // Giggledust
	case 1: return 8;  // Lesai
	case 2: return 9; // Millaflower
	case 3: return 14; // Yaladai
	case 4: return 15; // Yarrock
	}
	return 0;
}

string GetSpiceTemplate(int nSpice, int nLevel) {
	if( nLevel >= 15 )
		nSpice = UpgradeSpice(nSpice);
	string sTemplate = "jc_spice_";
	if( nSpice < 10 )
		return sTemplate + "0" + IntToString(nSpice);
	return sTemplate + IntToString(nSpice);
}

int GetTreasureLevel(object obj) {
	int nLevel = GetHitDice(obj) + Random(8) - 5;
	if( nLevel < 1 )
		return 1;
	return nLevel;
}

void PlaceSpice(object oContainer, int nSpice) {
	int nLevel = GetTreasureLevel(GetFirstPC());
	int nAmount = GetSpiceAmount(nLevel);
	string sTemplate = GetSpiceTemplate(nSpice, nLevel);
	CreateItemOnObject(sTemplate, oContainer, nAmount, TRUE);
}

int UpgradeSpice(int nSpice) {
	switch( nSpice ) {
	case 1:  return 2;  // Andris   -> Refined Andris
	case 12: return 13; // Sansanna -> Pure Sansanna
	case 11: return 6;  // Ryll     -> Glitterstim
	}
	return nSpice;
}