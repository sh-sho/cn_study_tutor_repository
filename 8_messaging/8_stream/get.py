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
get_messages_response = streaming_client.get_messages(
    stream_id="ocid1.stream.oc1.iad.amaaaaaassl65iqamk3yooiyn2kb674qxj2yo2dunwws3l7qeuz3ggg77i6q",
    cursor="eyJjdXJzb3JUeXBlIjoicGFydGl0aW9uIiwidHlwZSI6IlRyaW1Ib3Jpem9uIiwib2Zmc2V0IjpudWxsLCJ0aW1lIjpudWxsLCJwYXJ0aXRpb24iOiIwIiwic3RyZWFtSWQiOiJvY2lkMS5zdHJlYW0ub2MxLmlhZC5hbWFhYWFhYXNzbDY1aXFhbWszeW9vaXluMmtiNjc0cXhqMnlvMmR1bnd3czNsN3FldXozZ2dnNzdpNnEiLCJleHBpcmF0aW9uIjoxNzE2MTY2NzgzMzEzLCJjdXJzb3JUeXBlIjoicGFydGl0aW9uIn0=",
    limit=8824
    )

# Get the data from response
print(get_messages_response.data)
