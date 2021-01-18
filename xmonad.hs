-- Xmonad conf

-- Imports
import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Actions.CycleWS
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
 layoutHook = spacing 10 $ smartBorders Grid ||| noBorders Full,
 -- Workspaces
 XMonad.workspaces = ["Main", "Spare"],
 -- Manage Hooks
 manageHook = composeAll [
  className =? "android-studio" --> doFloat],
 -- Apply keys
 modMask = mod4Mask,
 XMonad.keys = \conf@(XConfig {XMonad.modMask = modm}) -> Data.Map.fromList $ [
  -- Launch term
    ((modm, xK_t), spawn "alacritty")
  -- Dmenu
  , ((modm, xK_x), spawn "dmenu_run -nb '#1e1e1e' -sf '#ffffff' -sb '#663399' -nf '#ffffff' -p 'run:'")
  -- Dmenu status
  , ((modm, xK_d), spawn "~/bin/dmenustatus")
  -- Cmus pause toggle
  , ((modm, xK_p), spawn "cmus-remote -u")
  -- Close window
  , ((modm, xK_0), kill)
  -- Switch between layouts
  , ((modm, xK_space ), sendMessage NextLayout)
  -- Send floating window to tiling
  , ((modm .|. shiftMask, xK_space), withFocused $ windows . XMonad.StackSet.sink)
  -- Move focus to   next window/workspace
  , ((modm, xK_o), windows XMonad.StackSet.focusDown)
  , ((modm, xK_b), nextWS)
  -- Swap  focused window with next window/to next workspace
  , ((modm .|. shiftMask, xK_o), windows XMonad.StackSet.swapDown)
  , ((modm .|. shiftMask, xK_b), shiftToNext >> nextWS)
  -- I3Lock
  , ((modm , xK_z), spawn "i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62")
  , ((modm  .|. shiftMask, xK_z), spawn "xset s 1; i3lock --blur=1 --color=111111 --insidevercolor=D8BFD8 --insidewrongcolor=8B7B8B --insidecolor=BF55EC --ringvercolor=E066FF --ringwrongcolor=816687 --ringcolor=663399 --keyhlcolor=8B3A62; xset s 1000")  
  -- Quit/Restart xmonad
  , ((modm, xK_s) , spawn "xmonad --recompile; xmonad --restart")
  , ((modm .|. shiftMask, xK_q) , io (exitWith ExitSuccess))]}
