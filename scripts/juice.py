#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math, subprocess

# Parse OS X dictionary and retrieve battery info

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

maximum = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
current = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

battery_max = float(maximum.rpartition('=')[-1].strip())
battery_cur = float(current.rpartition('=')[-1].strip())

ratio = battery_cur / battery_max
threshold = int(math.ceil(10 * ratio))

# Juice representation

total_slots, slots = 10, []
filled = int(math.ceil(threshold * (total_slots / 10.0))) * u'█'

empty = (total_slots - len(filled)) * u'░'

out = (filled + empty).encode('utf-8')
import sys

color_green = '[32m'
color_yellow = '[33m'
color_red = '[31m'
color_reset = '[00m'
color_out = (
    color_green if len(filled) > 6
    else color_yellow if len(filled) > 4
    else color_red
)

out = color_reset + color_out + out + color_reset + ' {0:.2f}% '.format(ratio * 100)
sys.stdout.write(out)

