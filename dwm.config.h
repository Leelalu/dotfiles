/* See LICENSE file for copyright and license details. */

/*
 * Config for a dwm6.2 install with these patches applied:
 *		dwm-cyclelayouts-20180524-6.2
 *		dwm-fullgaps-6.2
 *		dwm-tagswapmon-6.2
 *		dwm-fixborders-6.2
 *		dwm-movestack-20211115-a786211
 *		dwm-focusonclick-20200110
 *		dwm-statusallmons-6.2
 */

#include "movestack.c"

// Fonts
static const char *fonts[]          = { "inconsolata:pixelsize=14:antialias=true:autohint=true" };
// Mouse focus
static const int focusonwheel       = 1;
// Bars
static const int showbar            = 1;
static const int topbar             = 1;
// Windows
static const unsigned int borderpx  = 3;
static const unsigned int snap      = 32;
static const float mfact            = 0.55;
static const int nmaster            = 1;
static const int resizehints        = 0;
static const int gappx              = 15;
// Color
static const char col_grey[]        = "#333333";
static const char col_white[]       = "#eeeeee";
static const char col_darkpurple[]  = "#5F00AF";
static const char col_lightpurple[] = "#AF5FFF";
static const char *colors[2][3]     = {
	[SchemeNorm] = { col_white, col_grey, col_lightpurple },
	[SchemeSel]  = { col_white, col_grey,  col_darkpurple  },
};

// The tag
static const char *tags[] = {"1"};

// Window Rules
static const Rule rules[] = {
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};


// Layouts
static const Layout layouts[] = {
	{ "-|-",      tile },
	{ "[0]",      monocle },
	{ NULL,       NULL },
};

// Shortcuts
// Modkey
#define MODKEY Mod4Mask
// Shell cmd spawner
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
// Dmenu cmd
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", fonts,"-nb", col_grey, "-nf", col_white, "-sb", col_darkpurple, "-sf", col_white, NULL };

// Key shortcuts
static Key keys[] = {
	// Aplications
	{ MODKEY,           XK_semicolon, spawn,    {.v = dmenucmd } },
	{ MODKEY,           XK_Return,    spawn,    SHCMD("st") },
	// Volume
	{ MODKEY|Mod1Mask,  XK_v,      spawn,       SHCMD("amixer set 'Master' 3%-")  },
	{ MODKEY,           XK_v,      spawn,       SHCMD("amixer set 'Master' 3%+")  },
	// Brightness
	{ MODKEY|Mod1Mask,  XK_i,      spawn,       SHCMD("xlight.sh -3")  },
	{ MODKEY,           XK_i,      spawn,       SHCMD("xlight.sh 3")  },
	// Win
	{ MODKEY,           XK_j,      focusstack,  {.i = +1 } },
	{ MODKEY,           XK_k,      focusstack,  {.i = -1 } },
  { MODKEY|Mod1Mask,  XK_j,      movestack,   {.i = +1 } },
	{ MODKEY|Mod1Mask,  XK_k,      movestack,   {.i = -1 } },
	{ MODKEY,           XK_b,      tagswapmon,  {.i = +1 } },
	{ MODKEY|Mod1Mask,  XK_b,      tagmon,      {.i = +1 } },
	{ MODKEY,           XK_space,  cyclelayout, {.i = +1 } },
	// Meta
	{ MODKEY|Mod1Mask,  XK_space,  togglebar,   {0} },
	{ MODKEY,           XK_0,      killclient,  {0} },
	{ MODKEY,           XK_r,      quit,        {0} },
	{ MODKEY|ShiftMask, XK_q,      spawn,       SHCMD("killall Xorg") },
};

// Mouse shortcuts
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
};
