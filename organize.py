import os
import csv

if not os.path.exists('data'):
    os.makedirs('data')

# Create sort_by_lap and sort_by_heading directories
sort_by_lap_dir = os.path.join('data', 'sort_by_lap')
sort_by_heading_dir = os.path.join('data', 'sort_by_heading')

if not os.path.exists(sort_by_lap_dir):
    os.makedirs(sort_by_lap_dir)

if not os.path.exists(sort_by_heading_dir):
    os.makedirs(sort_by_heading_dir)

curr = [f for f in os.listdir('.') if f.endswith('.csv')]
n_laps = [int(f.split('_lap')[-1].split('.')[0]) for f in curr]
headings = list(set([f.split('_')[0] for f in curr]))
# Create directory structure for sort_by_lap
for lap_num in n_laps:
    for heading in headings:
        lap_dir = f'{sort_by_lap_dir}/lap_{lap_num}'
        heading_dir = f'{lap_dir}/{heading}'
        if not os.path.exists(heading_dir):
            os.makedirs(heading_dir)

# Create directory structure for sort_by_heading
for heading in headings:
    for lap_num in n_laps:
        heading_dir = f'{sort_by_heading_dir}/{heading}'
        lap_dir = f'{heading_dir}/lap_{lap_num}'
        if not os.path.exists(lap_dir):
            os.makedirs(lap_dir)

for f in curr:
    heading = f.split('_')[0]
    lap_num = int(f.split('_lap')[-1].split('.')[0])
    filename = '_'.join(f.split('_')[1:])
    
    with open(f, 'r') as r:
        reader = csv.reader(r)
        data = list(reader)
        
    # Save to sort_by_lap structure
    lap_path = f'{sort_by_lap_dir}/lap_{lap_num}/{heading}/{filename}'
    with open(lap_path, 'w') as w:
        writer = csv.writer(w)
        writer.writerows(data)
        
    # Save to sort_by_heading structure
    heading_path = f'{sort_by_heading_dir}/{heading}/lap_{lap_num}/{filename}'
    with open(heading_path, 'w') as w:
        writer = csv.writer(w)
        writer.writerows(data)