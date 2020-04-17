# Read after /etc/zshenv and before anything else

###############################################################################
## PATH
# Set PATH for homebrew
if [[ -d "/usr/local/sbin" ]]
then
	PATH="${PATH}:/usr/local/sbin"
fi


# Set PATH for gemrepo
if [[ -d "${HOME}/gemrepo" ]]
then
	export GEM_HOME=${HOME}/gemrepo
	PATH=${PATH}:${HOME}/gemrepo/bin
fi


# Set PATH for users own bin
if [[ -d "${HOME}/bin" ]]
then
	PATH="${HOME}/bin:${PATH}"
fi


# Set PATH for users python scripts
if [[ -d "/usr/local/share/python" ]]
then
	PATH="/usr/local/share/python:${PATH}"
fi


# Set PATH if TexLive is mounted
if [[ -d "/Volumes/TeXLive2009" ]]
then
	PATH="${PATH}:/Volumes/TeXLive2009/bin/universal-darwin"
	export MANPATH="${MANPATH}:/Volumes/TeXLive2009/texmf/doc/man"
	export INFOPATH="${INFOPATH}:/Volumes/TeXLive2009/texmf/doc/info"
	export TEXMFCNF="/usr/local/texlive/2009/texmf-var/web2c"
	export TEXMFLOCAL="/usr/local/texlive/texmf-local"
	export TEXMFSYSVAR="/usr/local/texlive/2009/texmf-var"
fi

# Enforce that these directories are in front of PATH
for p in '/usr/local/sbin' '/usr/local/bin'
do
    PATH="${p}:${PATH}"
done


# Remove duplicate entries
typeset -U path

export PATH

###############################################################################
## Directories
IOSFRAMEWORKSPATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks"
FRAMEWORKDEST="${HOME}/iOS-Frameworks"
if [[ -d ${IOSFRAMEWORKSPATH} ]] && [[ ! -d ${FRAMEWORKDEST} ]]
then
  ln -s "${IOSFRAMEWORKSPATH}" "${FRAMEWORKDEST}"
fi

###############################################################################
## LANGUAGE
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LANG="en_US.UTF-8"

###############################################################################
## UNIX TOOLS
# Tabstops in /usr/bin/less
export LESS="-x4 -R"

###############################################################################
## XCODE SETTINGS
export DEVELOPER_DIR=`xcode-select --print-path`

###############################################################################
## RBENV SETTINGS
if command -v rbenv >/dev/null 2>&1
then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
