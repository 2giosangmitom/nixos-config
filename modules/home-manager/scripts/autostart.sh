#!/usr/bin/env bash

# Start ibus daemon
ibus-daemon -rRd

# Wait for ibus-daemon to be ready
while ! pgrep ibus-daemon; do
	sleep 0.01
done

# Set ibus engine
ibus engine BambooUs

# Wait for ibus engine to be ready
while [[ $(ibus engine) != "BambooUs" ]]; do
	sleep 0.01
done

# Start waybar
waybar
