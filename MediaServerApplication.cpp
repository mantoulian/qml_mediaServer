#include "StdAfx.h"
#include "MediaServerApplication.h"

APP_DEFINE g_appMediaServer = {
	0x20160327,
	_T("流转发服务器"),
	{
		{ MediaServer_Func_MaxSourceNum, _T("最大信号源数"), TRUE, 10, 0},
		{ MediaServer_Func_MaxConnectionNum, _T("最大客户连接数"), TRUE, 200, 0},
		{ MediaServer_Func_CenterService, _T("媒体中心服务"), FALSE, 0, 0},
		{ MediaServer_Func_Rtmp, _T("网络直播平台"), FALSE, 0, 0},
	}
};

APP_DEFINE g_appMatrixServer = {
	0x20200702,
	_T("视音频流矩阵"),
	{
		{ IP_Matrix_Func_MaxInPortNum, _T("最大输入端口数"), TRUE, 8, 0 },
		{ IP_Matrix_Func_MaxOutPortNum, _T("最大输出端口数"), TRUE, 8, 0 },
		{ IP_Matrix_Func_MaxConnectionNum, _T("最大客户连接数"), TRUE, 200, 0 },
	}
};

APP_DEFINE g_appSwitcherServer = {
	0x20200703,
	_T("视音频流切换台"),
	{
		{ IP_Switcher_Func_MaxInPortNum, _T("最大输入端口数"), TRUE, 8, 0 },
		{ IP_Switcher_Func_MaxConnectionNum, _T("最大客户连接数"), TRUE, 200, 0 },
	}
};

APP_DEFINE g_appLiveDeliverServer = {
	0x20200707,
	_T("视音频流发布"),
	{
		{ IP_LiveDeliver_Func_MaxInPortNum, _T("允许的通道数"), TRUE, 8, 0 },
	}
};

APP_DEFINE g_appTVPlayerServer = {
	0x20200722,
	_T("流媒体电视"),
	{
		{ IP_TVPlayer_Func_MaxChannelNum, _T("允许的频道数"), TRUE, 8, 0 },
	}
};
