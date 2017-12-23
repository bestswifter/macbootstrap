r"""Command-line tool to validate and pretty-print JSON
Usage::
    $ echo '{"json":"obj"}' | python -m json.tool
    {
        "json": "obj"
    }
    $ echo '{ 1.2:3.4}' | python -m json.tool
    Expecting property name: line 1 column 2 (char 2)
"""
import sys
import json
import codecs

def main():
    if len(sys.argv) == 1:
        infile = sys.stdin
        outfile = sys.stdout
    elif len(sys.argv) == 2:
        infile = open(sys.argv[1], 'rb')
        outfile = sys.stdout
    elif len(sys.argv) == 3:
        infile = open(sys.argv[1], 'rb')
        outfile = open(sys.argv[2], 'wb')
    else:
        raise SystemExit(sys.argv[0] + " [infile [outfile]]")
    try:
        obj = json.load(infile)
    except ValueError, e:
        raise SystemExit(e)
    s = json.dumps(obj, sort_keys=True, indent=4, ensure_ascii=False)
    outfile.write(codecs.encode(s, 'utf-8'))
    outfile.write('\n')


if __name__ == '__main__':
    main()
