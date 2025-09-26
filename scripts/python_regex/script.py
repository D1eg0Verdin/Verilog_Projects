import re
from collections import Counter, defaultdict
import sys

CELL_PATTERN = re.compile(
    r'''
    (?P<cell>\\\S+|[A-Za-z0-9_$]+)   # cell name: either escaped (\... ) or plain id
    \s+                               # some whitespace
    (?P<inst>\\\S+|[A-Za-z0-9_$]+)    # instance name: escaped or plain
    (?:\s*/\*.*?\*/\s*)?              # C-style comment /* ... */
    \(\s*                             # opening parenthesis for port list
    (?P<ports>.*?)                    # non-greedy capture of everything inside parentheses
    \s*\)\s*;                         # close paren and semicolon
    ''',
    re.VERBOSE | re.DOTALL
)

PORT_PATTERN = re.compile(
    r'''
    \.(?P<port>\w+)          # .PORT
    \s*\(                    # whitespace then '('
    \s*(?P<net>[^)\s]+)      # capture net name (anything up to whitespace or ')')
    \s*\)                    # closing ')'
    \s*,?                    # optional trailing comma
    ''',
    re.VERBOSE | re.DOTALL
)

def parse_netlist_text(text, debug=False):
    cells = Counter()
    nets = defaultdict(list)

    for m in CELL_PATTERN.finditer(text):
        cell = m.group('cell')
        inst = m.group('inst')
        ports_block = m.group('ports')

        cells[cell] += 1
        if debug:
            print("FOUND CELL:", cell, "INST:", inst)
            print("PORT BLOCK:\n", ports_block)

        for pm in PORT_PATTERN.finditer(ports_block):
            port = pm.group('port')
            net  = pm.group('net')
            nets[net].append((inst, port))
            if debug:
                print("  PORT MATCH:", port, "->", net)

    return cells, nets

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 netlist_parser.py <netlist.v>")
        sys.exit(1)
    fname = sys.argv[1]
    text = open(fname, 'r', encoding='utf-8').read()
    cells, nets = parse_netlist_text(text, debug=True)
    print("\nCell counts:")
    for k,v in cells.items():
        print(f"  {k}: {v}")
    print("\nSome nets:")
    for net,conns in list(nets.items())[:10]:
        print(f"  {net}: {conns}")
