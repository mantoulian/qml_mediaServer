#pragma once


enum { MediaServer_Func_Begin = 0,
	MediaServer_Func_MaxSourceNum,
	MediaServer_Func_MaxConnectionNum,
	MediaServer_Func_CenterService,
	MediaServer_Func_Rtmp,
	MediaServer_Func_End};

enum { IP_Matrix_Func_Begin = 0,
	IP_Matrix_Func_MaxInPortNum,
	IP_Matrix_Func_MaxOutPortNum,
	IP_Matrix_Func_MaxConnectionNum,
	IP_Matrix_Func_End};


enum {IP_Switcher_Func_Begin = 0,
	IP_Switcher_Func_MaxInPortNum,
	IP_Switcher_Func_MaxConnectionNum,
	IP_Switcher_Func_End};

enum {IP_LiveDeliver_Func_Begin = 0,
	IP_LiveDeliver_Func_MaxInPortNum,
	IP_LiveDeliver_Func_End};


enum {IP_TVPlayer_Func_Begin = 0,
	IP_TVPlayer_Func_MaxChannelNum,
	IP_TVPlayer_Func_End};
