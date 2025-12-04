library(aws.signature)
library(aws.s3)

# Set up your AWS env vars using your AWS credentials file
aws.signature::use_credentials(profile = "myprofile")
mybucket <- "mybucket"

# Read a SAS file from the s3 bucket
mysas <- s3read_using(
  object="path/to/my/sasfile.sas7bdat",
  bucket=mybucket,
  FUN=haven::read_sas
)

# Read a CSV file from the s3 bucket
mycsv <- s3read_using(
  object="path/to/my/sasfile.csv",
  bucket=mybucket,
  FUN=readr::read_csv
)
