import os
import csv

if not os.path.exists('data'):
    os.makedirs('data')

curr = [f for f in os.listdir('.') if f.endswith('.csv')]
n_laps = [int(f.split('_lap')[-1].split('.')[0]) for f in curr]
headings = list(set([f.split('_')[0] for f in curr]))
for lap_num in n_laps:
    for heading in headings:
        if not os.path.exists(f'data/lap_{lap_num}/{heading}'):
            os.makedirs(f'data/lap_{lap_num}/{heading}')

for f in curr:
    heading = f.split('_')[0]
    lap_num = int(f.split('_lap')[-1].split('.')[0])
    filename = '_'.join(f.split('_')[1:])
    
    with open(f, 'r') as r:
        reader = csv.reader(r)
        data = list(reader)
        
    with open(f'data/lap_{lap_num}/{heading}/{filename}', 'w') as w:
        writer = csv.writer(w)
        writer.writerows(data)