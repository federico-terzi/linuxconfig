#!/usr/bin/python

from subprocess import check_output
import json, sys
from collections import defaultdict

out = check_output(["i3-msg","-t","get_workspaces"])
data = json.loads(out)

mws = defaultdict(list)
vws = {}
max_ws = 1

for workspace in data:
    mws[workspace["output"]].append(workspace["num"])
    if workspace["visible"]:
        vws[workspace["output"]] = workspace["num"]
    if int(workspace["num"]) > max_ws:
        max_ws = int(workspace["num"])

operation = sys.argv[1]
direction = 1
if operation == "prev":
    direction = -1

for mon, wsl in mws.items():
    target = wsl.index(vws[mon])+direction    
    print(target)
    if target >= 0:
        if target >= len(wsl):
            next_ws = max_ws + 1
            max_ws += 1
        else:
            next_ws = int(wsl[target])
        print(next_ws)
        check_output(["i3-msg", "workspace", str(vws[mon])])
        check_output(["i3-msg", "workspace", str(next_ws)])


