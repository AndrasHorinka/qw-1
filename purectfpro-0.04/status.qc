
/*
 ****************************************************************************************
 * Rename "motd_new.qc" to "motd.qc" and then edit it to change the Message of the day! *
 ****************************************************************************************
 */

float PLAYERSTATTIME = 1.75;

void() MOTD =
{
// ***MOTD*** --> Changed motd a bit to make it easier to change. 
// PCP dyna - MOTD
	setmotd();
//	if (self.classname == "spectator" )
//		centerprint6(self, motdbegin, motd1, motd2, motd3, motd4, motd5, motdend);
//	else if (gamestart)
//		centerprint7(self, motdbegin, motd1, motd2, motd3, motd4, motd5, motdend,  motdexit); //choose exit
//	else if (!FLAG_CTF)
//		centerprint6(self, motdbegin, motd1, motd2, motd3, motd4, motd5, motdend);
//	else if ((self.steam == TEAM_COLOR1))
//		centerprint7(self, motdbegin, motd1, motd2, motd3, motd4, motd5, motdend,  motdred); //red
//	else
//		centerprint7(self, motdbegin, motd1, motd2, motd3, motd4, motd5, motdend,  motdblue); //blue
centerprint7(self, motdbegin, motd1, "\n", motd2, "\n\n", motd3, motdend);
// PCP //
//****MOTD*** <--
};

void() TeamCaptureCheckUpdate =
{
	local entity p;

	if (gamestart)
		return; // handled by vote exit
	if (lastteamscrtime > time)
		return;

	lastteamscrtime = time + TEAMSCRTIME;

	// count up teamscr
	teamscr1 = teamscr2 = 0;
	p = PLAYER_CHAIN;
	while (p != world) {
		if ((p.steam == TEAM_COLOR1))
			teamscr1 = teamscr1 + p.frags;
		else if ((p.steam == TEAM_COLOR2))
			teamscr2 = teamscr2 + p.frags;
		p = p.clientchain;
	}
};

void() TeamCaptureResetUpdate =
{
	lastteamscrtime = 0;
	TeamCaptureCheckUpdate();
};

//
// Set statubarposition for 1 line statusbar
//
string(float statuspos) TeamSetStatRes = {
	// *optimize* 
	statuspos = statuspos - 1;
	if (statuspos > 7) // 768 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 7) // 600 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 6) // 480 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 5) // 400
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 4) // 384 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 3) // 350 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 2) // 300 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 1) // 240 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	// 200 
	return "\n\n\n\n\n\n\n\n\n\n\n\n";
};

//
// Set statubarposition for 2 lines statusbar.
//
string(float statuspos) TeamSetStatRes2 =
{
	statuspos = statuspos - 1;

	if (statuspos > 7) // 768 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 7) // 600 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 6) // 480 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 5) // 400
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 4) // 384 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 3) // 350 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 2) // 300 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 1) // 240 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	// 200 
	return "\n\n\n\n\n\n\n\n\n\n\n";
};

//
// Set statubarposition for 3 lines statusbar.
//
string(float statuspos) TeamSetStatRes3 = {
	statuspos = statuspos - 1;

	if (statuspos > 7) // 768 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 7) // 600 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 6) // 480 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 5) // 400
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 4) // 384 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 3) // 350 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 2) // 300 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	else if (statuspos == 1) // 240 
		return "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	// 200 
	return "\n\n\n\n\n\n\n\n\n\n";
};




void() TeamCapturePlayerUpdate = {
	local string n, t, s1,s2,s3,s4;
	local float x;	

	TeamCaptureCheckUpdate();

	// debug 
	if (!self.state)
	self.state = stof(infokey(self, "menu"));	

	// This will not be overridden by cprint.
	if (self.state) { 
		Menu();
		return;
// PCP dyna - VoteCenterprint
/*
	} else if (VoteCenterprint()) {
		return;
*/		
// PCP //
	} else if (CountDown) {
		return;
 	} else if (self.motd_endtime > time) {
		MOTD();
		return;

	// This is toggled by the "cprint" command.
	} else if (!(self.pure & SETINFO_CPRINT)) {
		if (IsObserver(self)) {
			centerprint(self, "Observer mode");
			return;
		} else if (FLAG_ARENA && !ArenaHasPlayers()) {
			centerprint(self, "Waiting for opponent\n");
		} else 	if (self.pausetime > time) {		// *check* pausetime ska bort	
			if (RESTART) {
				s1 = "������� ��� ��� ������� �� ����������\n\n ����� ���";
				s2 = getnum(RESTART - TEAM1 - TEAM2);
				s3 = " ������� �����\n";
				centerprint3(self, s1, s2, s3);
			} else if (STARTDELAY) {
				x = floor(STARTDELAY - time);
				if (x < 0) x = 0;
				t = getnum(x);
				centerprint2(self, "Waiting for players to reconnect...\n\nTimeout:", t);
			} else if (FLAG_ISAUTOPAUSED)
				centerprint(self, "Game ������ because\na player disconnected!");
			else
				centerprint(self, "Game ������\nby admin or vote!");
			return;
		} if (FLAG_STANDBY) {
			UpdateStandby();
			return;
		}
	}


	if (time < (last_flag_capture + 6)) {
		if (last_capture_team == TEAM_COLOR1) 
			TeamUpdateStatusbar(self,"��� �������!");
		else 
			TeamUpdateStatusbar(self,"���� �������!");
	} else 
		TeamUpdateStatusbar(self, string_null);
};



void(entity who, string s, float updatenow) PrintStatusbar = {


	local float statuspos;

	if (!FLAG_CTF) {			// *check* for statusbars in nonctf
		centerprint(who, s);
		return;
	}
	if (!updatenow) {
		if (who.rune_notice_time > time)	// *optimize*
			return;
		who.rune_notice_time = time + 2;
	}

	statuspos = (who.pure & 15);

	TeamCaptureCheckUpdate();
	who.lastupdate = time + PLAYERSTATTIME;


	if (statuspos == 0) {
		centerprint(who, s);
		return;
	}


	TeamUpdateStatusbar(who, s);

};




void(entity pl, string s1) TeamUpdateStatusbar = {

	local float statuspos;
	local string s2,s5,s6,s7,res,n,st1, st2;
	local entity e, f;
	local float x, y ,z ;


	statuspos = (pl.pure & 15);
	if (statuspos == 0) {
		if (VAR_ANTICHEATS & CHEAT_ANTITIMER) {
			s1 = " ";
			centerprint(self, s1);
		}
		return;
	}

	if (pl.pure & SETINFO_SBAR_HUD)
		res = TeamSetStatRes3(statuspos);
	else
		res = TeamSetStatRes2(statuspos);


	// *check* detta ska inte vara h�r, flytta till teamcaptureupdate?
	if (gamestart) {
		if (vote_leader == world)
			centerprint2(pl, res, "\n                    Choose an exit...");
		else {
			res = TeamSetStatRes2();
			n = ftos(voteexit_time - time);
			centerprint5(pl, res, vote_leader.message,
				" leads\n", n, " seconds until exit");
		}
		return;
	}

	//.12345678901234567890123456789012345678901
	// Cloaking/Visible�R�B� 20:30 GREN BLUE 999

	e = find(world, classname, "item_flag_team1");
	f = find(world, classname, "item_flag_team2");

	if (pl.pure & SETINFO_SBAR_RUNE) {		// *check* (�r runor p�slagna?)
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\n� � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n� �B�\n"; 
			else s2 = "\n� �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\n�R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n�R�B�\n"; 
			else s2 = "\n�R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\n�҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n�҅B�\n"; 
			else s2 = "\n�҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\n� � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n� �B�"; 
			else s2 = "\n� �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\n�R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n�R�B�"; 
			else s2 = "\n�R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\n�҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\n�҅B�"; 
			else s2 = "\n�҅";} }
	} else if (self.classname == "observer") {
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   � �B�\n"; 
			else s2 = "\nOBSERVER MODE   � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   �R�B�\n"; 
			else s2 = "\nOBSERVER MODE   �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   �҅B�\n"; 
			else s2 = "\nOBSERVER MODE   �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   � �B�"; 
			else s2 = "\nOBSERVER MODE   � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   �R�B�"; 
			else s2 = "\nOBSERVER MODE   �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nOBSERVER MODE   �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nOBSERVER MODE   �҅B�"; 
			else s2 = "\nOBSERVER MODE   �҅";} }
	} else  if (pl.runes & ITEM_RUNE1_FLAG) {
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      � �B�\n"; 
			else s2 = "\nResistance      � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      �R�B�\n"; 
			else s2 = "\nResistance      �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      �҅B�\n"; 
			else s2 = "\nResistance      �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      � �B�"; 
			else s2 = "\nResistance      � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      �R�B�"; 
			else s2 = "\nResistance      �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nResistance      �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nResistance      �҅B�"; 
			else s2 = "\nResistance      �҅";} }
	} else if (pl.runes & ITEM_RUNE2_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        � �B�\n"; 
			else s2 = "\nStrength        � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        �R�B�\n"; 
			else s2 = "\nStrength        �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        �҅B�\n"; 
			else s2 = "\nStrength        �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        � �B�"; 
			else s2 = "\nStrength        � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        �R�B�"; 
			else s2 = "\nStrength        �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nStrength        �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nStrength        �҅B�"; 
			else s2 = "\nStrength        �҅";} }
	} else if (pl.runes & ITEM_RUNE3_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           � �B�\n"; 
			else s2 = "\nHaste           � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           �R�B�\n"; 
			else s2 = "\nHaste           �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           �҅B�\n"; 
			else s2 = "\nHaste           �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           � �B�"; 
			else s2 = "\nHaste           � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           �R�B�"; 
			else s2 = "\nHaste           �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nHaste           �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nHaste           �҅B�"; 
			else s2 = "\nHaste           �҅";} }
	} else if (pl.runes & ITEM_RUNE4_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    � �B�\n"; 
			else s2 = "\nRegeneration    � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    �R�B�\n"; 
			else s2 = "\nRegeneration    �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    �҅B�\n"; 
			else s2 = "\nRegeneration    �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    � �B�"; 
			else s2 = "\nRegeneration    � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    �R�B�"; 
			else s2 = "\nRegeneration    �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nRegeneration    �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nRegeneration    �҅B�"; 
			else s2 = "\nRegeneration    �҅";} }
	} else if (pl.runes & ITEM_RUNE5_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    � �B�\n"; 
			else s2 = "\nLiving Armor    � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    �R�B�\n"; 
			else s2 = "\nLiving Armor    �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    �҅B�\n"; 
			else s2 = "\nLiving Armor    �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    � �B�"; 
			else s2 = "\nLiving Armor    � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    �R�B�"; 
			else s2 = "\nLiving Armor    �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nLiving Armor    �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nLiving Armor    �҅B�"; 
			else s2 = "\nLiving Armor    �҅";} }
	} else if (pl.runes & ITEM_RUNE6_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      � �B�\n"; 
			else s2 = "\nProtection      � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      �R�B�\n"; 
			else s2 = "\nProtection      �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      �҅B�\n"; 
			else s2 = "\nProtection      �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      � �B�"; 
			else s2 = "\nProtection      � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      �R�B�"; 
			else s2 = "\nProtection      �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nProtection      �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nProtection      �҅B�"; 
			else s2 = "\nProtection      �҅";} }
	} else if (pl.runes & ITEM_RUNE7_FLAG){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       � �B�\n"; 
			else s2 = "\nVampirism       � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       �R�B�\n"; 
			else s2 = "\nVampirism       �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       �҅B�\n"; 
			else s2 = "\nVampirism       �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       � �B�"; 
			else s2 = "\nVampirism       � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       �R�B�"; 
			else s2 = "\nVampirism       �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nVampirism       �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nVampirism       �҅B�"; 
			else s2 = "\nVampirism       �҅";} }
	} else if ((pl.runes & ITEM_RUNE8_FLAG) && gene > time){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible� � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible� �B�\n"; 
			else s2 = "\nCloaking/Visible� �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible�R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible�R�B�\n"; 
			else s2 = "\nCloaking/Visible�R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible�҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible�҅B�\n"; 
			else s2 = "\nCloaking/Visible�҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible� � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible� �B�"; 
			else s2 = "\nCloaking/Visible� �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible�R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible�R�B�"; 
			else s2 = "\nCloaking/Visible�R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Visible�҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Visible�҅B�"; 
			else s2 = "\nCloaking/Visible�҅";} }
	} else if ((pl.runes & ITEM_RUNE8_FLAG) && gene < time){
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked� � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked� �B�\n"; 
			else s2 = "\nCloaking/Cloaked� �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked�R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked�R�B�\n"; 
			else s2 = "\nCloaking/Cloaked�R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked�҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked�҅B�\n"; 
			else s2 = "\nCloaking/Cloaked�҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked� � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked� �B�"; 
			else s2 = "\nCloaking/Cloaked� �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked�R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked�R�B�"; 
			else s2 = "\nCloaking/Cloaked�R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nCloaking/Cloaked�҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nCloaking/Cloaked�҅B�"; 
			else s2 = "\nCloaking/Cloaked�҅";} }
	} else if (!FLAG_CTF) {
		
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION� � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION� �B�\n"; 
			else s2 = "\nPURE COMPETITION� �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION�R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION�R�B�\n"; 
			else s2 = "\nPURE COMPETITION�R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION�҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION�҅B�\n"; 
			else s2 = "\nPURE COMPETITION�҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION� � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION� �B�"; 
			else s2 = "\nPURE COMPETITION� �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION�R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION�R�B�"; 
			else s2 = "\nPURE COMPETITION�R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nPURE COMPETITION�҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPURE COMPETITION�҅B�"; 
			else s2 = "\nPURE COMPETITION�҅";} }
 	} else {
		
// PCP dyna - Version
	if (pl.pure & SETINFO_SBAR_HUD) { 
		if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        � � �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        � �B�\n"; 
			else s2 = "\nPureCTF Pro        � �\n"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        �R� �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        �R�B�\n"; 
			else s2 = "\nPureCTF Pro        �R�\n"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        �҅ �\n"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        �҅B�\n"; 
			else s2 = "\nPureCTF Pro        �҅\n";} } 
	else { if (e.cnt == FLAG_AT_BASE) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        � � �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        � �B�"; 
			else s2 = "\nPureCTF Pro        � �"; } 
		else if (e.cnt == FLAG_CARRIED) { 
			if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        �R� �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        �R�B�"; 
			else s2 = "\nPureCTF Pro        �R�"; } 
		else { if (f.cnt == FLAG_AT_BASE) s2 = "\nPureCTF Pro        �҅ �"; 
			else if (f.cnt == FLAG_CARRIED) s2 = "\nPureCTF Pro        �҅B�"; 
			else s2 = "\nPureCTF Pro        �҅";} }
	}
// PCP //
	// tw50 


	if (FLAG_STANDBY) {
		if (pl.classname == "ready")
			s5 = "     Ready";
		else
			s5 = " Not Ready";
		s6 = string_null;
	} else if (CountDown) {
		s5 = " Countdown";
		s6 = string_null;
	} else {
		if (!(pl.pure & SETINFO_SBAR_WEAPON)) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " "; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = "   RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = "  BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = "  TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_AXE) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ů"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ů  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ů BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ů TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_SHOTGUN) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ǯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ǯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ǯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ǯ TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_SUPER_SHOTGUN) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ǯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ǯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ǯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ǯ TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_NAILGUN) {
			if (FLAG_TW) {	
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ӯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ӯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ӯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ӯ TIED:"; s6 = "---"; } }
			} else {	
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ǯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ǯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ǯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ǯ TIED:"; s6 = "---"; } } }
		} else if (pl.weapon == IT_SUPER_NAILGUN) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ǯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ǯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ǯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ǯ TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_GRENADE_LAUNCHER) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��̮"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��̮  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��̮ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��̮ TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_ROCKET_LAUNCHER) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��̮"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��̮  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��̮ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��̮ TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_LIGHTNING) {
			if (FLAG_TW) {	
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ����"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ����  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ���� BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ���� TIED:"; s6 = "---"; } }
			} else {	
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ��Ǯ"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ��Ǯ  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ��Ǯ BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ��Ǯ TIED:"; s6 = "---"; } } }
		} else if (pl.weapon == IT_GRAPPLE) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ����"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ����  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ���� BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ���� TIED:"; s6 = "---"; } }
		} else if (pl.weapon == IT_AIRGUN) {
			
	if ((pl.pure & SETINFO_SBAR_SCORES) || !FLAG_CTF) { s5 = " ����"; s6 = string_null; } 
	else {	if (teamscr1 > teamscr2) { s5 = " ����  RED:"; s6 = getnum3(teamscr1 - teamscr2); } 
		else if (teamscr1 < teamscr2) { s5 = " ���� BLUE:"; s6 = getnum3(teamscr2 - teamscr1); } 
		else { s5 = " ���� TIED:"; s6 = "---"; } }
		}
	}
	if (pl.pure & SETINFO_SBAR_TIME) {
		st1 = string_null;
		st2 = string_null;
	} else {
		st1 = MINUTES_LEFT;
		st2 = SECONDS_LEFT;
	}

	if ((s1 == string_null) && (pl.pure & SETINFO_SBAR_AUTOID)) {
		e = identify_player(0);
		if (e)
			s1 = e.netname;
	}

// PCP dyna - changed centerprint
// PCP *HrZ* - Modified
	if (self.classname == "spectator" )
		centerprint6(pl, res, s2, st1, st2, s5, s6);
	else
		centerprint7(pl, res, s1, s2, st1, st2, s5, s6);
// PCP //

};
















// <-- check


