#!/usr/bin/env bash

sudo virsh list | grep i\- | awk '{print $2}' | wc -l | bc

