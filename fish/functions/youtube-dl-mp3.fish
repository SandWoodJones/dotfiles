function youtube-dl-mp3 --wraps youtube-dl --description 'Downloads the audio from a youtube video'
	command youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/config_mp3 $argv
end
