#!/bin/bash
if [ -f ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi

if [ -f ~/.Xresources ]; then
	xrdb ~/.Xresources
fi
