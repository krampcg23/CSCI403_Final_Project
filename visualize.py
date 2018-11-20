# Authors: Alex DeGroat, Clayton Kramp, Jeffrey Stenerson, Allee Zarrini

import csv
import folium
setOfFiles = ['volcano', 'earthquake', 'tsunami']
colorOfFile = ['green', 'brown', 'blue']
multiplier = [5, 1, 1]

m = folium.Map(location=[20,0], tiles="Mapbox Bright", zoom_start=2)

for k in range(0,len(setOfFiles)):
    latitudes = []
    longitudes = []
    magnitude = []
    directory = 'Data/' + setOfFiles[k] + 'QueryMag.csv'
    with open(directory) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            latitudes.append(float(row['latitude']))
            longitudes.append(float(row['longitude']))
            magnitude.append(float(row['magnitude']))


    for i in range(0,len(latitudes)):
        folium.CircleMarker(
                location = [latitudes[i], longitudes[i]],
                radius = magnitude[i] * multiplier [k],
                color = colorOfFile[k],
                fill = True,
                fill_color = colorOfFile[k]
                ).add_to(m)

m.save("mymap.html")
