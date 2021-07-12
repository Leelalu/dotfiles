### Gdb ###
###########

# Exit if successful return of program
set $_exitcode = -999
set height 0
handle SIGTERM nostop print pass
handle SIGPIPE nostop
define hook-stop
    if $_exitcode != -999
        quit
    else
        shell echo | mail -s "NOTICE: app has stopped on unhandled signal" root
    end
end

# Disable confirmation on exit
set confirm off
