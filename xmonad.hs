--- Xmonad conf ---
-------------------

--------------
-- Imports ---
--------------
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Actions.CycleWS
import XMonad.StackSet
import Data.Monoid
import Data.Map
import System.Exit


-----------------------------------------
--- Main apply values to Xconf record ---
-----------------------------------------
main = do xmonad $ def{
---------------
--- Windows ---
---------------
 -- Window borders
 normalBorderColor = "#AF5FFF",
 focusedBorderColor = "#5F00AF",
 borderWidth = 3,
 -- Window Mouse focus settings
 focusFollowsMouse = True,
 clickJustFocuses =True,
 -- Set modm to alt for initiating floating window managment exclusively
 modMask = mod1Mask,

------------------------
--- Window Placement ---
------------------------
 -- Layouts
 layoutHook = spacing 10 (smartBorders (spiral (6/7))) ||| noBorders Full,
 -- Workspaces
 XMonad.workspaces = ["Main", "Spare"],

--------------------
--- Manage Hooks ---
--------------------
 manageHook = composeAll [
  className =? "android-studio" --> doFloat],

---------------------
--- Set keysbinds ---
---------------------
 XMonad.keys = \conf -> Data.Map.fromList $ [
  -- Translation eo-en/en-eo
    ((mod4Mask, xK_e), spawn "dmenueo2en")
  , ((mod4Mask .|. shiftMask, xK_e), spawn "dmenuen2eo")
  -- Launch term
  , ((mod4Mask, xK_t), spawn "alacritty")
  -- Dmenu
  , ((mod4Mask, xK_x), spawn "env LC_ALL=en_US.UTF-8 dmenu_run -nb '#222222' -sf '#FFFFFF' -sb '#5F00AF' -nf '#FFFFFF' -p 'run:'")
  -- Dmenu status
  , ((mod4Mask, xK_d), spawn "~/bin/dmenustatus")
  -- Cmus pause toggle
  , ((mod4Mask, xK_p), spawn "cmus-remote -u")
  -- Close window
  , ((mod4Mask, xK_0), kill)
  -- Switch between layouts
  , ((mod4Mask, xK_space ), sendMessage NextLayout)
  -- Send floating window to tiling
  , ((mod4Mask .|. shiftMask, xK_space), withFocused $ windows . XMonad.StackSet.sink)
  -- Move focus to   next window/workspace
  , ((mod4Mask, xK_o), windows XMonad.StackSet.focusDown)
  , ((mod4Mask, xK_b), nextWS)
  -- Swap  focused window with next window/to next workspace
  , ((mod4Mask .|. shiftMask, xK_o), windows XMonad.StackSet.swapDown)
  , ((mod4Mask .|. shiftMask, xK_b), shiftToNext)
  -- Next screen
  , ((mod4Mask, xK_f), nextScreen)
  , ((mod4Mask .|. shiftMask, xK_f), shiftNextScreen)
  -- Vecrat/Xdotool for keyboard mouse interface
  , ((mod4Mask, xK_y), spawn "vecrat --stop")
  , ((mod4Mask, xK_h), spawn "vecrat -7 0")
  , ((mod4Mask, xK_j), spawn "vecrat 0 7")
  , ((mod4Mask, xK_k), spawn "vecrat 0 -7")
  , ((mod4Mask, xK_l), spawn "vecrat 7 0")
  , ((mod4Mask .|. shiftMask, xK_h), spawn "vecrat -3 0")
  , ((mod4Mask .|. shiftMask, xK_j), spawn "vecrat 0 3")
  , ((mod4Mask .|. shiftMask, xK_k), spawn "vecrat 0 -3")
  , ((mod4Mask .|. shiftMask, xK_l), spawn "vecrat 3 0")
  , ((mod4Mask, xK_m), spawn "xdotool click 1")
  , ((mod4Mask .|. shiftMask, xK_m), spawn "xdotool click 3")
  , ((mod4Mask .|. controlMask .|. shiftMask, xK_m), spawn "xdotool click 2")
  , ((mod4Mask, xK_u), spawn "killall unclutter; unclutter -idle 1")
  , ((mod4Mask .|. shiftMask, xK_u), spawn "killall unclutter")
  -- I3Lock
  , ((mod4Mask .|. shiftMask , xK_z), spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  -- Quit/Restart xmonad
  , ((mod4Mask, xK_s) , spawn "xmonad --recompile; xmonad --restart")
  , ((mod4Mask .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]
}
