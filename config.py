### Qutebrowser ###
###################

######################################
### Disable loading an auto config ###
######################################
config.load_autoconfig()

#########################
### Setup colors vars ###
#########################
DarkPur="#5F00AF"
DarkAltPur="#440099"
DarkerPur="#300077"
LightPur="#AF5FFF"
LightAltPur="#885FBB"
White="#FFFFFF"
Black="#111111"
Grey="#666666"

#############################
### Browser ui arangement ###
#############################
# Tabbar to bottom
c.tabs.position = "bottom"
# Downloads to bottom
c.downloads.position = "bottom"

####################
### Apply colors ###
####################
# Set dark them for website default
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
# Tabs
## Tab Selection
c.colors.tabs.even.bg=LightPur
c.colors.tabs.odd.bg=LightAltPur
c.colors.tabs.selected.odd.bg=DarkPur
c.colors.tabs.selected.even.bg=DarkPur
## Tab State
c.colors.tabs.indicator.error=Black
c.colors.tabs.indicator.start=Grey
c.colors.tabs.indicator.stop=White
# Downloads bar
c.colors.downloads.bar.bg=DarkPur
c.colors.downloads.start.bg=LightPur
c.colors.downloads.stop.bg=DarkerPur
# Bottom Bar
## Weblink
c.colors.statusbar.url.success.http.fg=White
c.colors.statusbar.url.success.https.fg=White
## Different Modes
c.colors.statusbar.insert.bg=DarkPur
c.colors.statusbar.normal.bg=DarkPur
c.colors.statusbar.command.bg=DarkPur
