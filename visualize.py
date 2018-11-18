import csv
import folium
import random

latitudes = []
longitudes = []
thiccness = []

with open('Data/volcano-min-header.csv') as csvfile:
     reader = csv.DictReader(csvfile)
     for row in reader:
         latitudes.append(float(row['Latitude']))
         longitudes.append(float(row['Longitude']))
         thiccness.append(random.randint(20, 40))

m = folium.Map(location=[20,0], tiles="Mapbox Bright", zoom_start=2)

for i in range(0,len(latitudes)):
    folium.CircleMarker(
            location = [latitudes[i], longitudes[i]],
            radius = thiccness[i],
            color = 'crimson',
            fill = True,
            fill_color = 'crimson'
            ).add_to(m)

m.save("mymap.html")
