// *****************************************************************
//  Pure CTF v1.99beta4 by Dan "Methabol" Zetterstr�m 1998-08-??
//  Pure CTF Homepage: http://purectf.solgames.com/
//  Report bugs and ideas to: methabol@bt.nu
// *****************************************************************

void() CompetitionHelpCommands = {
	sprint(self, PRINT_HIGH, "---- Competition Mode -------------\n");
	sprint(self, PRINT_HIGH, "�����      : ����� ��� �����\n");
	sprint(self, PRINT_HIGH, "�����      : ����� �����\n");
	sprint(self, PRINT_HIGH, "��������   : ��� ��� ������\n");
};

void() LockMaxClients = {

	local float noofplayers;
	local string maxclients, tmp;

	
	noofplayers = TOTALPLAYERS;

	return; //deny access on server join instead.

	maxclients = infokey(world, "maxclients");
	tmp = ftos(noofplayers);

	bprint (PRINT_HIGH, "MaxClients locked to ");
	bprint (PRINT_HIGH, tmp);
	bprint (PRINT_HIGH, "\n");
	if (infokey(world, "saveplayers") == "") {
		localcmd("localinfo saveplayers ");
		localcmd(maxclients);
		localcmd("\n");
	}

	localcmd("maxclients ");
	localcmd(tmp);
	localcmd("\n");

};


void() RestoreMaxClients = {
	local string tmp;
	
	return; //deny access on server join instead.
	
	tmp=infokey(world, "saveplayers");
	if (tmp != "") {
		localcmd("maxclients ");
		localcmd(tmp);
		localcmd("\n");
		localcmd("localinfo saveplayers \"\"\n");
		localcmd("serverinfo saveplayers \"\"\n");
		bprint(PRINT_HIGH, "Maxclients restored to ");
		bprint(PRINT_HIGH, tmp);
		bprint(PRINT_HIGH, "\n");
	}
};


void() CompShowStatus = {
	local entity e;

	if (CountDown) {
		sprint(self, PRINT_HIGH, "The Match will begin after the countdown.\n");
	} else if (FLAG_STANDBY) {
		sprint(self, PRINT_HIGH, "READY: ");
		e = find(world, classname, "ready");
		if (!e) sprint(self, PRINT_HIGH, "-NONE-");
		while (e) {
			sprint(self, PRINT_HIGH, e.netname);
			sprint(self, PRINT_HIGH, " ");
			e = find(e, classname, "ready");
		}
		sprint(self, PRINT_HIGH, "\nNOT READY: ");
		e = find(world, classname, "notready");
		if (!e) sprint(self, PRINT_HIGH, "-NONE-");
		while (e) {
			sprint(self, PRINT_HIGH, e.netname);
			sprint(self, PRINT_HIGH, " ");
			e = find(e, classname, "notready");
		}
		sprint(self, PRINT_HIGH, "\n");
	} else {
		sprint(self, PRINT_HIGH, "Match in progress.\n");
	}
	PrintAdmin();
};

string() PowerupString = {
	local string s7;

		if (VAR_DISABLEPOWERUPS & BIT_NOQUAD) {
			if (VAR_DISABLEPOWERUPS & BIT_NORING) {
				if (VAR_DISABLEPOWERUPS & BIT_NOPENTA) {
					s7 = "NONE";
				} else {
					s7 = "-P- ";
				}
			} else {
				if (VAR_DISABLEPOWERUPS & BIT_NOPENTA) {
					s7 = "--R ";
				} else {
					s7 = "-PR ";
				}
			}
		} else {
			if (VAR_DISABLEPOWERUPS & BIT_NORING) {
				if (VAR_DISABLEPOWERUPS & BIT_NOPENTA) {
					s7 = "Q-- ";
				} else {
					s7 = "QP- ";
				}
			} else {
				if (VAR_DISABLEPOWERUPS & BIT_NOPENTA) {
					s7 = "Q-R ";
				} else {
					s7 = "YES ";
				}
			}
		}
	return s7;
};

// *check* timer.qc ??
void(entity pl) PrintCountDown = {
	local string s1, s2, s3, s4,s5,s6,s7;
	local float x;
	x = TIMELEFT;
	s1 = getnum(x);
	if (FLAG_ARENA && FLAG_COMPETITION) {
		if (!(TEAMPLAY & TEAM_LOCK_COLORS))
			s2 = "";
		else if ((self.steam == TEAM_COLOR1))
			s2 = "You are ��� team.\n\n";
		else
			s2 = "You are ���� team.\n\n";
		if ((RedWins + BlueWins) == 0) {
			s3 = "The game will start\nafter the countdown\n\n";
			centerprint3(pl, s2,s3,s1);
			return;
		}
		if (RedWins > BlueWins) {
			s3 = "��� ����� ����";
			s4 = getnum(RedWins - BlueWins);
			s6 = getnum(CLANARENAWINS - RedWins);
		} else if (BlueWins > RedWins) {
			s3 = "���� ����� ����";
			s4 = getnum(BlueWins - RedWins);
			s6 = getnum(CLANARENAWINS - BlueWins);
 		} else {
			s3 = "��� ����� ��� ���� ����";
			s4 = getnum(BlueWins);
			s6 = getnum(CLANARENAWINS - BlueWins);
		}
		if (CLANARENAWINS) {
			s5 = " ����\n ��� ����";
			s7 = " ���� ��� ��������\n\n ���� �� ���� �����:";
		} else {
			s5 = " ";
			s6 = "����\n\n";
			s7 = "���� �� ���� �����:";
		}
		centerprint7(pl, s2,s3,s4,s5,s6,s7,s1);
	} else 	if (FLAG_ARENA) {
		s2 = ARENAPLAYER1.netname;
		s3 = ARENAPLAYER2.netname;
		centerprint5(pl, s2, " vs ", s3, "\n\n", s1);
	} else if (TIMELEFT <= 3 ) {
		if (FLAG_CTF) s7 = "\n\n\n\n\n\n\n";
		else s7 = "\n\n\n\n\n";
		centerprint2(pl, SECONDS_LEFT, s7);
	} else if (FLAG_CTF) {
		s1 = SECONDS_LEFT;
		if (DEATHMATCH == 1) 		s2 = "\n\n ���������� - 01\n ���������  - ";
		else if (DEATHMATCH == 2) 	s2 = "\n\n ���������� - 02\n ���������  - ";
		else if (DEATHMATCH == 3) 	s2 = "\n\n ���������� - 03\n ���������  - ";
		else if (DEATHMATCH == 4) 	s2 = "\n\n ���������� - 04\n ���������  - ";
		else if (DEATHMATCH == 5) 	s2 = "\n\n ���������� - 05\n ���������  - ";
		else if (DEATHMATCH == 0) 	s2 = "\n\n ���������� - 00\n ���������  - ";

		s3 = TL_STRING;
		s4 = "\n\n �������� - ";
		if (FLAG_TOSSRUNE) 	s5 = "YES \n �������� - ";
		else 			s5 = " NO \n �������� - ";

		if (FLAG_DROPQUAD && FLAG_DROPRING)
		 	s6 = "YES \n �������� - YES \n �������� - ";
		else if (!FLAG_DROPQUAD && FLAG_DROPRING)
		 	s6 = " NO \n �������� - YES \n �������� - ";
		else if (FLAG_DROPQUAD && !FLAG_DROPRING)
		 	s6 = "YES \n �������� -  NO \n �������� - ";
		else if (!FLAG_DROPQUAD && !FLAG_DROPRING)
		 	s6 = " NO \n �������� -  NO \n �������� - ";
		s7 = PowerupString();
		centerprint7(pl, s1,s2,s3,s4,s5,s6,s7);

	} else {		// DM

		s1 = SECONDS_LEFT;
		if (DEATHMATCH == 1) 		s2 = "\n\n ���������� -  01 \n ��������   -  ";
		else if (DEATHMATCH == 2) 	s2 = "\n\n ���������� -  02 \n ��������   -  ";
		else if (DEATHMATCH == 3) 	s2 = "\n\n ���������� -  03 \n ��������   -  ";
		else if (DEATHMATCH == 4) 	s2 = "\n\n ���������� -  04 \n ��������   -  ";
		else if (DEATHMATCH == 5) 	s2 = "\n\n ���������� -  05 \n ��������   -  ";
		else if (DEATHMATCH == 0) 	s2 = "\n\n ���������� -  00 \n ��������   -  ";


		s3 = TP_STRING;
		s4 = " \n ���������  -  ";
		s5 = TL_STRING;
		s6 = " \n ��������   - ";
		s7 = PowerupString();
		centerprint7(pl, s1,s2,s3,s4,s5,s6,s7);
	}
};

void() startintro = {
	soundall("fun/starting.wav");
//	soundflags("fun/starting.wav", CHAN_WEAPON); *check*
	remove(self);
};

void() soundintro = {
	local entity e;
	e = spawn();
	e.nextthink = time + 0.3;
	e.think = startintro;
};

void() CheckReady = {
	local string tmp;
	local entity e;
	local float flag;

	READY = 0;
	NOTREADY = 0;

	e = PLAYER_CHAIN;
	while (e) {
		if (e.classname == "ready")
			READY = READY + 1;
		else if (e.classname == "notready")
			NOTREADY = NOTREADY + 1;
		e = e.clientchain;
	}

	flag = 0;
	if (RESTART) {
		if (!NOTREADY && (READY == RESTART))
			flag = 1;
	} else {
		if (!NOTREADY && ((READY > 1) || FLAG_DEBUG) && READY)
			flag = 1;
	}
	if (flag && !CountDown) {
		RESTART = 0;
		LockMaxClients();
		AutoDemo();
// PCP *HrZ* - MVD Recording *NEW* Changed it so names are nice now.
		localcmd("easyrecord\n");
// PCP //
		bprint(PRINT_HIGH, "\nGame Starts in ");
		tmp = ftos(COUNTDOWNTIME);
		bprint(PRINT_HIGH, tmp);
		bprint(PRINT_HIGH, " seconds!\n");
		bprint(PRINT_HIGH, "\n");

// PCP *HrZ* - Make runes spawn @ countdown instead!
		RespawnAllRunes();
// PCP //

		StartCountDown(COUNTDOWNTIME, StartMatch, "��� ����� ���� �����\n ����� ��� ���������\n\n");

		if (FLAG_CTF) {
			Freeze(FREEZE_PLAYERS);
			e = PLAYER_CHAIN;
			while (e) {
				e.player_flag = e.player_flag | (PF_KILLMERESTART);
				e = e.clientchain;
			}
			if (FLAG_FUNSOUNDS) {
				soundintro();
				soundall("fun/goodday.wav");
			}
		} else
			Freeze(FREEZE_WEAPONS_BUT_HOOK);
	} else if (NOTREADY && CountDown) {
		bprint(PRINT_HIGH, "\nGame Breaked!\n\n");
		if (FLAG_FUNSOUNDS) soundflags("weapons/tink1.wav", CHAN_WEAPON);
		RestoreMaxClients();
		forceready = 0;
		RESTART = 0;
		CountDown = 0;
		UnFreeze(FREEZE_PLAYERS);
		if (FLAG_ARENA) {
			e = PLAYER_CHAIN;
			while (e) {
				e.player_flag = e.player_flag | (PF_KILLMERESTART);
				e = e.clientchain;
			}
		} else {
			TraversePlayers(SetFreshItems);
		}
		StopDemos();
// PCP *HrZ* - MVD Recording 
		localcmd("cancel\n");
// PCP //
	}

};

void() NotReady = {
// PCP dyna - Enhanced ingame and spectator admin start/break
	local entity e;
// PCP // 

	if (!FLAG_COMPETITION) {
		return;
// PCP dyna - Enhanced ingame and spectator admin start/break
/*
	} else if (self.classname == "spectator") {
		return;
*/
// PCP //
	} else if (!FLAG_STANDBY) {
		VoteBreak();
	} else if (forceready) {
		if (IsAdmin(self)) {
			bprint(PRINT_HIGH, "The admin has forced the game to end.\n");
// PCP dyna - Enhanced ingame and spectator admin start/break
//			self.classname = "notready";
			e = PLAYER_CHAIN;
			while(e) {
				e.classname = "notready";
				e = e.clientchain;
			}
// PCP //
			CheckReady();
		} else {
			sprint(self, PRINT_HIGH, "Only the admin kan break this countdown.\n");
		}
	} else {
		if (self.classname == "ready") {
			bprint(PRINT_HIGH, self.netname);
			bprint(PRINT_HIGH, " is NOT READY for the match.\n");
		}
// PCP dyna - Enhanced ingame and spectator admin start/break
		if (IsAdmin(self)) {
			bprint(PRINT_HIGH, "The admin has set everyone to notready.\n");
			e = PLAYER_CHAIN;
			while(e) {
				e.classname = "notready";
				e = e.clientchain;
			}
			CheckReady();
		} 
		else {
// PCP //
		self.classname = "notready";
// PCP dyna - Enhanced ingame and spectator admin start/break
		}
// PCP // 
		CheckReady();
	}
};

void() Ready = {
	if (!FLAG_COMPETITION) {
		return;
	} else if (self.classname == "spectator") {
		return;
	} else if (!FLAG_STANDBY) {
		sprint(self, PRINT_HIGH, "You can't do this now!\n");
		return;
	} else {
		if (self.classname == "notready") {
			bprint(PRINT_HIGH, self.netname);
			bprint(PRINT_HIGH, " is READY for the match.\n");
		}
		self.classname = "ready";
			CheckReady();
	}
};

void () SayReady = {
	local entity e;
	local float x;

	if (!FLAG_STANDBY)
		return;

	e = find(world, classname, "notready");
	if (!e) return;
	while (e) {
		if (!(e.player_flag & PF_GHOST)) {
				stuffcmd(self, "say \"");
			stuffcmd(self, e.netname);
			x = random();
			if ((0.00 <= x) && (x <= 0.10))
				stuffcmd(self, ", ready up now!");
			else if ((0.00 <= x) && (x <= 0.10))
				stuffcmd(self, ", hurry up and type ready!");
			else if ((0.10 <= x) && (x <= 0.20))
				stuffcmd(self, ", we're waiting to play!");
			else if ((0.20 <= x) && (x <= 0.30))
				stuffcmd(self, ", it spells R-E-A-D-Y!");
			else if ((0.30 <= x) && (x <= 0.40))
				stuffcmd(self, ", we're trying to get READY here!");
			else if ((0.40 <= x) && (x <= 0.50))
				stuffcmd(self, ", stop playing with yourself and type ready!");
			else if ((0.50 <= x) && (x <= 0.60))
				stuffcmd(self, ", REEEEEEADY now!");
			else if ((0.60 <= x) && (x <= 0.70))
				stuffcmd(self, ", drop that doughnut and type ready!");
			else if ((0.70 <= x) && (x <= 0.80))
				stuffcmd(self, ", stop fooling around and type ready!");
			else if ((0.80 <= x) && (x <= 0.90))
				stuffcmd(self, ", just type READY!");
			else if ((0.90 <= x) && (x <= 1.00))
				stuffcmd(self, ", time to play, type ready!");
			stuffcmd(self, "\"\n");
		}
		e = find(e, classname, "notready");
	}
};


void() StartMatch = {
	local entity e;
	local string tmp;

	bprint(PRINT_HIGH, "Match Started!\n");
	GSGameStart();

// *check*	if (FLAG_FUNSOUNDS) soundflags("weapons/tink1.wav", CHAN_WEAPON);

	FLAG_STANDBY = FALSE;

	if (FLAG_AUTOSPECTALK)
		SetVar(CVARINFO, "sv_spectalk", 0);

	UnFreeze(FREEZE_PLAYERS);
	StartTimer();

	// Kick all players and not ready;

	e = PLAYER_CHAIN;
	while(e) {
		if (e.classname == "ready") {
			e.classname = "player";
			e.frags = 0;
			e.log1 = 0;
			e.log2 = 0;
			e.log3 = 0;
			e.log4 = 0;
			if (!FLAG_CTF)
				e.player_flag = e.player_flag | (PF_KILLMERESTART);
		} else if (e.classname != "observer") {
			KickClient(e, "You were not ready.");
		}
		if (ProxyType(e) == PROXY_QIZMO)
			stuffcmd(e, "say proxy: time\n");
		e = e.clientchain;
	}

	nexttimercheck = 0;
	ClearScores();
// PCP *HrZ* -  Make runes spawn @ countdown instead!
//	RespawnAllRunes();
// PCP //
	LastStatusUpdate = 0;
};

void() UpdateStandby = {

	local string tp, tp2, tp3, tp4;
	local entity e;

	tp = getnum(READY);
	tp2 = getnum(NOTREADY);

	if ((NOTREADY == 1) && blink) {
		e = find(world, classname, "notready");
		while((e.player_flag & PF_GHOST) && (e != world)) {
			e = find(e, classname, "notready");
		}
		tp3 = e.netname;
		tp4 = ", we are waiting!";
	} else {
		tp3 = "";
		tp4 = "";
	}

	centerprint7(self, "Pure Competition ������� mode.\n\nType \"�����\" to begin.\n\"��������\" to list commands.\n\"��������\" to show settings.\n\"�����\" to vote for an admin.\n\"������\" to remove this text.\n\n �����: ", tp, "  ��� �����:", tp2, "\n\n", tp3, tp4);
};

// <-- check
