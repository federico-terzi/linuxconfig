#!/usr/bin/python

from subprocess import check_output
import json

out = check_output(["i3-msg","-t","get_workspaces"])
data = json.loads(out)

current_monitor = None
current_ws = None

for workspace in data:
    if workspace["focused"]:
        current_ws = workspace["name"]
        current_monitor = workspace["output"]

current_workspaces = []

for workspace in data:
    if workspace["output"] == current_monitor:
        current_workspaces.append(workspace["name"])

proc = current_workspaces + current_workspaces

next_ws = proc[proc.index(current_ws)+1]

check_output(["i3-msg", "workspace", next_ws])

