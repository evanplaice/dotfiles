#!/usr/bin/env bash

# arg for specifying a dry run
if [[ $* == *--dry* ]]
then
	DRY=true
else 
	DRY=false
fi

###############################################################################
# Setup                                                                       #
###############################################################################

pre() {
	# remove leftover files from dry run
	[[ -d ".temp" ]] && rm -rf .temp
	
	# create dir to hold dry run files
	mkdir .temp

	if [[ $DRY = false ]]
	then
		[[ -s "errors.log" ]] && rm errors.log
		[[ -s "install.log" ]] && rm install.log
	fi
}

setup() {
	cat setup.sh > .temp/setup.sh
	find ./applications -name .setup | sort | xargs -I {} bash -c \
	"echo '# {}' >> .temp/setup.sh; \
	cat {} >> .temp/setup.sh; \
	printf '\n\n' >> .temp/setup.sh"

	if [[ $DRY = false ]]
	then
		. .temp/setup.sh > >(tee -a install.log) 2> >(tee -a errors.log >&2)
	fi
}

exports() {
	cat .exports > ".temp/.exports"
	find ./applications -name .exports | sort | xargs -I {} bash -c \
	"echo '# {}' >> .temp/.exports; \
	cat {} >> .temp/.exports; \
	printf '\n\n' >> .temp/.exports"

	if [[ $DRY = false ]]
	then
		cp -f ".temp/.exports" "$HOME/.exports"
	fi
}

aliases() {
	cat .aliases > ".temp/.aliases"
	find ./applications -name .aliases | sort | xargs -I {} bash -c \
	  "echo '# {}' >> .temp/.aliases; \
		cat {} >> .temp/.aliases; \
		printf '\n\n' >> .temp/.aliases"

	if [[ $DRY = false ]]
	then
		cp -f ".temp/.aliases" "$HOME/.aliases"
	fi
}

profile() {
	if [[ $DRY = false ]]
	then
		cp -f .profile "$HOME/.profile"
		. "$HOME/.profile"
	else
		cp .profile .temp/.profile
		. .profile
	fi
}

config() {
	cat config.sh > .temp/config.sh
	find ./applications -name .config | sort | xargs -I {} bash -c \
	"echo '# {}' >> .temp/config.sh; \
	cat {} >> .temp/config.sh; \
	printf '\n\n' >> .temp/config.sh"

	if [[ $DRY = false ]]
	then
		. .temp/config.sh > >(tee -a install.log) 2> >(tee -a errors.log >&2)
	fi
}

post() {
	if [[ $DRY = false ]]
	then
		rm -rf .temp

		# remove unused packages
		sudo apt-get autoremove

		# clean up install files
		sudo apt-get autoclean
	fi
}

pre
setup
exports
aliases
profile
config
post
