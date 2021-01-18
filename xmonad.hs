-- Xmonad conf

-- Imports
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.StackSet
import Data.Monoid
import Data.Map
import System.Exit

-- Main func applying values to Xconf record
main = do xmonad $ def{
 -- Mouse settings
 focusFollowsMouse = True,
 clickJustFocuses =True,
 -- Window borders
 normalBorderColor = "#663399",
 focusedBorderColor = "#BF55EC",
 borderWidth = 3,
 -- Layouts
 layoutHook = spacing 10 (Tall 1 (3/100) (1/2)) ||| noBorders Full,
 -- Workspaces
 XMonad.workspaces = ["Main", "Spare"],
 -- Manage Hooks
 manageHook = composeAll [
   className =? "android-studio" --> doFloat
 , className =? "MPlayer" --> doFloat
 , className =? "Gimp" --> doFloat]
 , handleEventHook = fullscreenEventHook,
 -- Apply keys
 modMask = mod4Mask,
 XMonad.keys = \conf@(XConfig {XMonad.modMask = modm}) -> Data.Map.fromList $ [
  -- launch term
    ((modm, xK_t), spawn "alacritty")
  -- dmenu
  , ((modm, xK_x), spawn "dmenu_run -nb '#1e1e1e' -sf '#ffffff' -sb '#663399' -nf '#ffffff' -p 'run:'")
  -- dmenu status
  , ((modm, xK_d), spawn "~/bin/dmenustatus")
  -- cmus pause toggle
  , ((modm, xK_p), spawn "cmus-remote -u")
  -- close window
  , ((modm, xK_0), kill)
  -- rotate through layouts
  , ((modm, xK_space ), sendMessage NextLayout)
  -- send floating window to tiling
  , ((modm .|. shiftMask, xK_space), withFocused $ windows . XMonad.StackSet.sink)
  -- Move focus to  next window/workspace
  , ((modm, xK_o), windows XMonad.StackSet.focusDown)
  , ((modm, xK_b), nextWS)
  -- Swap  focused window with next window/to next workspace
  , ((modm .|. shiftMask, xK_o), windows XMonad.StackSet.swapDown)
  , ((modm .|. shiftMask, xK_b), shiftToNext >> nextWS)
  -- Expand/Shrink master area
  , ((modm, xK_m) , sendMessage Expand)
  , ((modm .|. shiftMask,xK_m), sendMessage Shrink)
  -- Increase/Deincrement windows master area
  , ((modm, xK_n ) , sendMessage (IncMasterN 1))
  , ((modm .|. shiftMask, xK_n) , sendMessage (IncMasterN (-1)))
  -- i3lock
  , ((modm , xK_z), spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  , ((modm  .|. shiftMask, xK_z), spawn "xset s 1; i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62; xset s 1000")  
  -- Quit/Restart xmonad
  , ((modm, xK_s) , spawn "xmonad --recompile; xmonad --restart")
  , ((modm .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]}
