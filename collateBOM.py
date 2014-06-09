import csv
import sys
import re


def makeRefString(ref_list):
    suffixes = []
    prefix = None
    for ref in ref_list:
        ref_re = re.search('^(?P<prefix>[A-Z]+)(?P<suffix>[0-9]+)$', ref)
        if ref_re == None or (prefix != None and ref_re.group('prefix') != prefix):
            return ';'.join(sorted(ref_list))
        prefix = ref_re.group('prefix')
        suffixes.append(int(ref_re.group('suffix')))

    refstring = ''
    
    suffixes.sort()
    run_start = suffixes[0]
    last_suffix = suffixes[0]
    suffixes.append(None)
    for suffix in suffixes[1:]:
        if suffix != last_suffix + 1:
            if refstring != '':
                refstring += ';'
            if last_suffix == run_start:
                refstring += '{}{}'.format(prefix, last_suffix)
            else:
                refstring += '{}{}-{}'.format(prefix, run_start, last_suffix)
            run_start = suffix
        
        last_suffix = suffix

    return refstring
    

if len(sys.argv) != 4:
    sys.stderr.write('Usage: collateBOM.py <in.csv> <supplier name> <out.csv>\n')
    sys.exit(1)

incsv = csv.reader(open(sys.argv[1]))
outcsv = csv.writer(open(sys.argv[3], 'w', newline = ''))
supplier_name = sys.argv[2]

header = [x.strip() for x in next(incsv)]

parts = {}

for line in incsv:
    linedata = dict(zip(header, [x.strip() for x in line]))
    supplier_part_id = linedata[supplier_name]
    if supplier_part_id == '':
        continue
    value = linedata['Value']
    reference = linedata['Reference']
    footprint = linedata['Footprint']
    datasheet = linedata['Datasheet']
    quantity = int(linedata['Quantity'])
    if supplier_part_id not in parts:
        parts[supplier_part_id] = [[reference], footprint, datasheet, quantity, value]
    else:
        if datasheet != '' and parts[supplier_part_id][2] == '':
            parts[supplier_part_id][2] = datasheet
        parts[supplier_part_id][0].append(reference)
        parts[supplier_part_id][3] += quantity

outcsv.writerow(['Reference', 'Value', 'Footprint', 'Datasheet', supplier_name, 'Quantity'])
for supplier_part_id, part_data in parts.items():
    reference_string = makeRefString(part_data[0])
    outcsv.writerow([reference_string, part_data[4], part_data[1], part_data[2], supplier_part_id, part_data[3]])

