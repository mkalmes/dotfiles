# Read after $ZDOTDIR/.zshenv

###############################################################################
## Completions

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Set fpath
fpath=(${HOME}/.zsh-functions ${fpath})
autoload -U ${HOME}/.zsh-functions/*(:t)
autoload -Uz compinit
compinit
# End of lines added by compinstall

## determine in which order the names (files) should be
## listed and completed when using menu completion.
## `size' to sort them by the size of the file
## `links' to sort them by the number of links to the file
## `modification' or `time' or `date' to sort them by the last modification time
## `access' to sort them by the last access time
## `inode' or `change' to sort them by the last inode change time
## `reverse' to sort in decreasing order
## If the style is set to any other value, or is unset, files will be
## sorted by reverse access time.
## kudos to cypher (https://github.com/cypher/dotfiles/blob/master/zshrc)
zstyle ':completion:*' file-sort reverse access

## vcs_info support
## kudos http://michael-prokop.at/blog/2008/12/15/mikas-advent-calendar-day-15-zsh-vcs_info/
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats		'[%b|%a]%u%c '
zstyle ':vcs_info:*' formats			'[%b]%u%c '
zstyle ':vcs_info:*' check-for-changes	true
zstyle ':vcs_info:*' unstagedstr		'↯' # U+21AF

precmd () {
	 vcs_info
}

###############################################################################
## Options

setopt APPEND_HISTORY			# Append history instead of overwriting it
setopt SHARE_HISTORY			# import and appended typed commands to the
								# history file
setopt HIST_IGNORE_ALL_DUPS		# Remove older command from history

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt AUTO_PUSHD				# make cd push the dir to a stack
setopt PUSHD_IGNORE_DUPS		# Don't push the same dir twice
DIRSTACKSIZE=10					# Max. size of the stack befor it gets
								# truncated
setopt INTERACTIVE_COMMENTS		# Allow comments in interactive shell

setopt PROMPT_SUBST				# Turn on command substitution

unsetopt nomatch				# Turn of error handling for a bad pattern
								# to work around rvm.
								# see https://github.com/robbyrussell/oh-my-zsh/issues/449

# Based on cypher's PROMPT (https://github.com/cypher/dotfiles/blob/master/zshrc)
PS1='%n@%m:%2~ ${vcs_info_msg_0_}%B>%b '
RPROMPT="[%t]"

# Report CPU usage for commands running longer than 10 seconds
# http://nuclearsquid.com/writings/reporttime-in-zsh/
REPORTTIME=10

###############################################################################
## Colors

export COLORTERM=yes
# export CLICOLOR=1
# unset LSCOLORS
# LS_COLORS='no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.jpg=1;32:*.jpeg=1;32:*.JPG=1;32:*.gif=1;32:*.png=1;32:*.jpeg=1;32:*.ppm=1;32:*.pgm=1;32:*.pbm=1;32:*.c=1;33:*.C=1;33:*.h=1;33:*.cc=1;33:*.awk=1;33:*.pl=1;33:*.bz2=1;35:*.gz=1;31:*.tar=1;31:*.zip=1;31:*.lha=1;31:*.lzh=1;31:*.arj=1;31:*.tgz=1;31:*.taz=1;31:*.html=1;34:*.htm=1;34:*.doc=1;34:*.txt=1;34:*.o=1;36:*.a=1;36:*.php3=1;31'


###############################################################################
## Editor
if command -v mate >/dev/null 2>&1
then
    export VISUAL="mate -w"
    alias m='mate'
    alias m.='mate .'
else
    export VISUAL="vim -f"
fi

export EDITOR=$VISUAL
export SVN_EDITOR=$VISUAL


###############################################################################
## Alias
alias ll='ls -lA'
alias la='ls -la'

alias d='dirs -v'

alias g='git'

alias o='open'
alias o.='open .'

# Show current airport status
# Kudos to cypher (https://github.com/cypher/dotfiles/blob/master/zshrc)
alias apinfo='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I'

# openssl magic
alias sha1='openssl dgst -sha1'
alias sha256='openssl dgst -sha256'
alias sha512='openssl dgst -sha512'

# 'clean' Xcode DerivedData folder
alias cdd='setopt rmstarsilent;rm -rf ${HOME}/Library/Developer/Xcode/DerivedData/*;unsetopt rmstarsilent'

# Open Xcode projects and workspaces
alias -s xcodeproj="open -a Xcode"
alias -s xcworkspace="open -a Xcode"
