library(daapr)

# Make sure GitHub PAT is set as env var
Sys.getenv("GITHUB_PAT") != ""
# Set AWS env vars using AWS profile secrets file
aws.signature::use_credentials(profile="myprofile")

# Use config from the daap repo
config <- dpconf_get(project_path = ".")
s3_daap_board <- dp_connect(board_params = config$board_params, creds = config$creds)

# Or set up board creds manually
my_creds <- creds_set_aws(
  key=Sys.getenv("AWS_ACCESS_KEY_ID"),
  secret=Sys.getenv("AWS_SECRET_ACCESS_KEY")
)
my_board_params <- board_params_set_s3(
  bucket_name="mybucket",
  region="us-east-1"
)
s3_daap_board <- dp_connect(board_params = my_board_params, creds = mycreds)

# List what's available
dplyr::glimpse(dp_list(s3_daap_board))

available_dps <- dpi::dp_list(s3_daap_board) %>% arrange(desc(last_deployed))
DT::datatable(available_dps)

my_daap <- dp_get(s3_daap_board, data_name = available_dps$dp_name[1])
names(my_daap)
names(my_daap$output)
