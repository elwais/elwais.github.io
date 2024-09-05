---
title: "calnext"
---

```python
#!/opt/homebrew/bin/python3
# Script that "intelligently" lists next deadlines for one-line displays.

from time import localtime, strptime, struct_time, mktime
from subprocess import check_output, CalledProcessError, DEVNULL
from os import environ
import argparse
import pickle
agenda_t = list[list[str]]
item_t = list[str]

# # Example of an agenda_t.
# # FORMAT: [startDay, startTime, stopDay, stopTime, title, desc]
# someAgenda: agenda_t = [
#     ['2024-05-21', '23:55', '2024-05-21', '23:55', 'HW1', 'None'],
#     ['2024-05-26', '23:55', '2024-05-26', '23:55', 'HW2', '✅']
# ]
#
# # An item_t is simply a single element of agenda_t.
# someItem: item_t = someAgenda[0]

# CLI parser
parser = argparse.ArgumentParser(
    description="Wrapper around gcalcli to print next deadlines in a single line",
)

# Check if output must be silent (solely to populate cache)
parser.add_argument("-s", "--silent", action="store_true")

# Print deadlines in reverse order
# Useful when right-aligning events and needing to place pressing items on the
# right side, which is away from the central notch of some of the MacBooks.
parser.add_argument("-r", "--reversed", action="store_true")

# Cache file
try:
    config_dir: str = f"{environ['XDG_CONFIG_HOME']}"
except KeyError:  # When unset
    config_dir: str = "/Users/elwais/.config"

parser.add_argument("-c", "--cache_file", type=str,
                    default=f"{config_dir}/gcalcli/calnext_cache")

# Number of complete events
parser.add_argument("-n", "--num", type=int)

# How many of the completed events must be rendered in full
parser.add_argument("-f", "--full", type=int)

args = parser.parse_args()


###############################################################################


def deltaTime(firstTime: struct_time, laterTime: struct_time) -> tuple[int]:
    """Returns a tuple of days, hours, and minutes between two `struct_time`s."""
    # Get seconds since epoch, then floor divide
    raw_delta = (mktime(laterTime) - mktime(firstTime))
    delta_days = int(raw_delta // (60*60*24))
    delta_hours = int(raw_delta % (60*60*24) // (60*60))
    delta_mins = int(raw_delta % (60*60*24) % (60*60) // 60)
    return (delta_days, delta_hours, delta_mins)


# Renders a base24 version of a provided number
def base24enc(decimal: int | float) -> str:
    """Convert an integer-like value between 0 and 23 into a base-24 representation."""
    # First confirm that decimal is in [0,23] and doesn't have decimal values
    if (decimal < 0) or (decimal > 23) or (int(decimal) != decimal):
        raise ValueError(f"base24enc() argument of {
                         decimal} isn't integer-like")
    # Case statement to return a string
    match int(decimal):
        case 16: return 'G'
        case 17: return 'H'
        case 18: return 'I'
        case 19: return 'J'
        case 20: return 'K'
        case 21: return 'L'
        case 22: return 'M'
        case 23: return 'N'
        case _: return f'{decimal:X}'


def item2struct(itemTime: str) -> struct_time:
    return strptime(itemTime, '%Y-%m-%d %H:%M')


###############################################################################


class Deadline:
    """A collection of member variables that hold details of arbitrary deadlines."""

    def __str__(self):
        return f'{self.agendaItem}'

    def __init__(self, agendaItem: item_t):
        self.agendaItem: item_t = agendaItem
        self.start: struct_time
        self.stop: struct_time  # Typically the same as self.start
        self.title: str
        self.desc: str

        # Generate start and stop time from mapping string format into
        # a struct_time object
        self.start: struct_time = item2struct(
            self.agendaItem[0] + ' ' + self.agendaItem[1])
        self.stop: struct_time = item2struct(
            self.agendaItem[0] + ' ' + self.agendaItem[1])

        # Takes the title string as-is
        self.title: str = self.agendaItem[4]

        # Checks if the checkbox exists somewhere in the description
        self.desc = self.agendaItem[5]
        self.isDone: bool = True if '✅' in self.desc else False

    # Uses above function to get time difference between now and event
    def dhm(self) -> list[int, int, int]:
        """Use deltaTime to return the days, hours, and minutes between the deadline and `localtime()`."""
        return deltaTime(localtime(), self.start)

###############################################################################


DeadlineList_t = list[Deadline]


def makeDeadlineList(data: agenda_t | DeadlineList_t = [], directDeadlineList: bool = False):
    """Instantiate a list of deadlines and deduplicate"""
    # Manual process, or take in deadlines as-is
    deadlines: list[Deadline]
    if not directDeadlineList:
        deadlines = []
        for i in data:
            deadlines.append(Deadline(i))
        else:
            pass
    else:
        deadlines = data

    # Confirm that each deadline time is the same, down to the minute.
    deduped_days: set = set([i.dhm()[0] for i in deadlines])
    deduped_hours: set = set([i.dhm()[1] for i in deadlines])
    deduped_minutes: set = set([i.dhm()[2]
                                for i in deadlines])
    if (len(deduped_days) > 1 or len(deduped_hours) > 1 or
            len(deduped_minutes) > 1):
        raise ValueError(
            f"Non duplicate deadlines detected. Days: {
                deduped_days
            }. Hours: {
                deduped_minutes
            }. Minutes: {
                deduped_minutes
            }."
        )
    # targetTime = deadlines[0].start
    return deadlines


def summary(deadlines: list[Deadline], isShort: bool = False, ld: str = '「', rd: str = '」') -> str:
    """Return a string that summarizes a list of deadlines

    Parameters
    =========
    isShort : Determines whether the entire event or just the time gets
        displayed.
    ld : The right delimiter of the displayed message.
    rd : The left delimiter of the displayed message.
    """

    # First event; "head" of the set that isn't complete
    headEvent = deadlines[0]

    # Generate timeAway string with custom padding based on numerical values
    timeAway: str = ''
    for i, j in enumerate(headEvent.dhm()):
        if i > 9:
            timeAway += f"{i}"
        elif i > 0:
            timeAway += f"_{i}"
        else:
            timeAway += "__"
        timeAway += ':' if j < 2 else ''
    timeAway: str = ('%2d:%2d:%2d' % headEvent.dhm()).replace(' ', '_')

    # Index past the entire subject by going 5 steps past the first space
    firstCharInd = headEvent.title.index(" ") + 5

    # Generate count
    count = 0
    for i in deadlines:
        if not i.isDone:
            count += 1

    # Variations of display, dependent on count of completed events
    if isShort is False:
        if count == 0:
            return f'{ld}{timeAway}⋆{headEvent.title[firstCharInd:]}{rd}'
        elif count == 1:
            return f'{ld}{timeAway} {headEvent.title[firstCharInd:]}{rd}'
        else:
            assert count > 0
            return f'{ld}{timeAway} {headEvent.title[firstCharInd:]} +{count-1}{rd}'
    else:
        if count == 0:
            return f'{ld}{timeAway}⋆{rd}'
        elif count == 1:
            return f'{ld}{timeAway}{rd}'
        else:
            assert count > 0
            return f'{ld}{timeAway} +{count-1}{rd}'


###############################################################################


if __name__ == "__main__":
    AGENDA_RAW: bytes  # The raw output of check_output

    try:  # Default behavior: load agenda from the internet
        AGENDA_RAW = check_output('''gcalcli \
            --default-calendar "2-2 Due Dates" \
            agenda 'now' 'next year' \
            --details description \
            --military \
            --tsv
            ''', shell=True, stderr=DEVNULL)
        with open(args.cache_file, "wb") as cacheFile:
            pickle.dump(AGENDA_RAW, cacheFile)

    except CalledProcessError:  # When disconnected, load the cache instead
        with open(args.cache_file, "rb") as cacheFile:
            AGENDA_RAW = pickle.load(cacheFile)

AGENDA: agenda_t = [
    i.split('\t') for i in AGENDA_RAW.decode('utf-8').split('\n')[:-1]
][1:]  # Removes header from --tsv

# This block may be removed if Deadline classes are done well
# Grab the month-time pair of each entry in AGENDA
TIMES: agenda_t = [i[:2] for i in AGENDA]

# Deduplication of time entries using a while loop to allow for lack of
# incrementation when deleting entries
iter: int = 0
while iter <= len(TIMES) - 1:
    if iter == 0:  # Nothing prior; keep it moving
        iter += 1
        continue
    elif TIMES[iter] == TIMES[iter-1]:  # Dupe detected; pop the current and hold
        _ = TIMES.pop(iter)
    else:  # No dupe; keep it moving
        iter += 1
del iter  # We're done with the while loop

# Group deadlines into a collection of DeadlineSets
deadlinesPend: list[DeadlineList_t] = []
deadlinesDone: list[DeadlineList_t] = []
for time in TIMES:  # Grab unique times
    # for item in AGENDA:  # Group events that fall on the same time

    matches_pend: agenda_t = list(filter(
        lambda x: x[:2] == time and 'DONE' not in x[5], AGENDA))
    matches_done: agenda_t = list(filter(
        lambda x: x[:2] == time and 'DONE' in x[5], AGENDA))

    if len(matches_pend) > 0:
        deadlinesPend.append(makeDeadlineList(matches_pend))
    if len(matches_done) > 0:
        deadlinesDone.append(makeDeadlineList(matches_done))

# How many deadlines to display
deadlineDisplayCount: int = len(
    deadlinesPend) if args.num is None else args.num

# How many deadlines to display in full
shortBound: int = len(deadlinesPend) if args.full is None else args.full

# Reverse list if applicable
if args.reversed:
    deadlinesPend = deadlinesPend[::-1]

for groups in deadlinesPend:
    pass

# Build summary
statusMessage: str = ''
iter: int = 0
while iter < deadlineDisplayCount:
    if iter < len(deadlinesPend):
        statusMessage += summary(deadlinesPend[iter],
                                 isShort=False if iter < shortBound else True)
        iter += 1
    else:
        break


# Print status message if silence wasn't requested
if not args.silent:
    print(statusMessage)
```
