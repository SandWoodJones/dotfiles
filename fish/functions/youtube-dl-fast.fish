# Defined via `source`
function youtube-dl-fast --wraps='youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_fast' --description 'alias youtube-dl-fast=youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_fast'
  youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_fast $argv; 
end
