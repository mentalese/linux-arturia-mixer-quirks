# ALSA Mixer Quirks for Arturia AudioFuse Rev2

This repository provides custom mixer_quirks for the Arturia AudioFuse Rev2 audio interface.

Due to a hardware failure, the physical buttons for 48V phantom power and main speaker mute toggle are no longer functional. This patch allows control of those features via alsamixer.

The implementation is based on reverse engineering the behavior of the Arturia Control Center on Windows.
