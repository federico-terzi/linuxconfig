#!/usr/bin/python

from subprocess import check_output
import json

out = check_output(["i3-msg","-t","get_workspaces"])
data = json.loads(out)

current_monitor = None
current_ws = None
max_workspace = 1

for workspace in data:
    if workspace["focused"]:
        current_ws = workspace["name"]
        current_monitor = workspace["output"]
    if int(workspace["num"]) > max_workspace:
        max_workspace = int(workspace["num"])

last_workspace = max_workspace

next_ws = str(last_workspace+1)
print(next_ws)
check_output(["i3-msg", "workspace", next_ws])

