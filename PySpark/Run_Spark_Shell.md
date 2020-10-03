### To run Spark:
C:\Spark\spark-3.0.1-bin-hadoop2.7\bin\spark-shell


### import findspark
```
findspark.init('C:\\Spark\\spark-3.0.1-bin-hadoop2.7')
```

```
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType
from pyspark.sql.types import IntegerType
from pyspark.sql.functions import desc
from pyspark.sql.functions import asc
from pyspark.sql.functions import sum as Fsum
```

```
spark = SparkSession \
        .builder \
        .appName("Wrangling Data") \
        .getOrCreate()
```