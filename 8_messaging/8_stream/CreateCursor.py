from datetime import datetime
import oci

# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()


# Initialize service client with default config file
streaming_client = oci.streaming.StreamClient(
    config, "https://cell-1.streaming.us-ashburn-1.oci.oraclecloud.com")


# Send the request to service, some parameters are not required, see API
# doc for more info
create_cursor_response = streaming_client.create_cursor(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q",
    create_cursor_details=oci.streaming.models.CreateCursorDetails(
        partition="0",
        type="TRIM_HORIZON"
    )
)

# Get the data from response
print(create_cursor_response.data)
