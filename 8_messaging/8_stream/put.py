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
put_messages_response = streaming_client.put_messages(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q",
    put_messages_details=oci.streaming.models.PutMessagesDetails(
        messages=[
            oci.streaming.models.PutMessagesDetailsEntry(
                value="YmFuYW5h",
                key="a2V5Mg==")])
    )

# Get the data from response
print(put_messages_response.data)
