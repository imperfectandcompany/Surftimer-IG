void RestartAnnouncer()
{
	RegConsoleCmd("sm_time", Server_Time, "[IG] Tells you the current time where the server is hosted - Georgia, Atlanta");
}


public Action Server_Time(int client, int args)
{
	int g_time = GetTime();
	/* -- Restart Announcer -- */
	int iYear, iMonth, iDay, iHour, iMinute, iSecond;
	
	if (client)
    {
    UnixToTime(GetTime(), iYear, iMonth, iDay, iHour, iMinute, iSecond, UT_TIMEZONE_PST );
    
	ReplyToCommand(client, "Server time below is in PST/PDT.");
    ReplyToCommand(client, "%02d:%02d", iHour, iMinute);
	ReplyToCommand(client, "We regularly restart at 12:00 AM, 6:00 AM, 12:00 AM and 6:00 PM in accordance to the server time above.");
	
    }
	else
	{
    
    UnixToTime(GetTime(), iYear, iMonth, iDay, iHour, iMinute, iSecond, UT_TIMEZONE_PST );
    
    PrintToServer("%02d:%02d", iHour, iMinute);
        PrintToServer("Command from server");
    }
	   
	return Plugin_Handled;

	
}