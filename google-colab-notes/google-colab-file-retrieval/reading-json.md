```
import json


geojson = '/content/drive/My Drive/Colab Notebooks/Maps/new-york-counties.geojson'
with open(geojson) as f:
    geojson = json.load(f)
```

or

```
with urlopen('/content/drive/My Drive/Colab Notebooks/Maps/new-york-counties.geojson') as response:
  geojson = json.load(response)
```