# Defined via `source`
function youtube-dl-mp3 --wraps=youtube-dl --wraps='youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_mp3' --description 'alias youtube-dl-mp3=youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_mp3'
  youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_mp3 $argv; 
end
