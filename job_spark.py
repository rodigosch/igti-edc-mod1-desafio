from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("ExcerciseSpark")
    .getOrCreate()
)

# Lê dados do enem
enem = (
    spark.read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://datalake-rodrigo-igti-473297513108/raw-data/enem/")
)

(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-rodrigo-igti-473297513108/staging/enem")
)