---
title: "calmod"
---

```python
#!/opt/homebrew/bin/python3
# Script to shorthand adding deadlines to Google Calendar.

from sys import argv
from os import system
import argparse

parser = argparse.ArgumentParser(
    description='Modify events in Google Calendar in a single line',
)
parser.add_argument("mode", metavar="MODE", choices=["add", "del", "edit"])
parser.add_argument("subject", metavar="SUBJECT")
parser.add_argument("title", metavar="DEADLINE")

# Hack to conditionally enforce required positional
if argv[1] == "add":
    parser.add_argument("when", metavar="WHEN")
    parser.add_argument('-d', '--desc', required=False)

if argv[1] == "del":
    parser.add_argument('-D', '--delete', required=False,
                        action='store_true')


# Controls whether or not to run calnext after to update cache
parser.add_argument('-u', '--update', required=False)

args = parser.parse_args()

# Subject parsing
match args.subject.upper():
    case '14': subject = 'ICS 314'
    case '42': subject = 'ECE 342'
    case '43': subject = 'ECE 343'
    case _: subject = args.subject

# Changing command based on selected mode
if args.mode == "add":
    cmd = f'''\
        gcalcli add --calendar "Due Dates" --title "{subject} {args.title}" \
        --when "{args.when}" --reminder 2d --reminder 1d \
        --description "{args.desc}" --where "" --duration 0 \
        --default-calendar "2-2 Due Dates"\
    '''
elif args.mode == "del":
    cmd = f'''
        gcalcli delete --military \
        {"--iamaexpert" if args.delete else ""} \
        '{subject} {args.title}' now \
    '''
elif args.mode == "edit":
    cmd = f'''
        gcalcli edit --military \
        '{subject} {args.title}' now \
    '''
else:
    assert False  # We should never go here thanks to argparse

system(cmd)

if args.update:
    system("calnext -s")  # Run calnext to update cache
```
