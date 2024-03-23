import io
import json
import logging

from fdk import response

#{“locate”: “US”}を受け取った際に、{“message”: “Hello”}を返す
#入力がない場合は、{“message”: “こんにちは”}を返す

def handler(ctx, data: io.BytesIO = None):
    name = "こんにちは"
    try:
        body = json.loads(data.getvalue())
        locate = body.get("locate")
        #if分追加
        if locate == "US" :
            name = "Hello"
    except (Exception, ValueError) as ex:
        logging.getLogger().info('error parsing json payload: ' + str(ex))

    logging.getLogger().info("Inside Python Hello World function")
    
    return response.Response(
        ctx, response_data=json.dumps(
            {"message": "{0}".format(name)}),
        headers={"Content-Type": "application/json"}
    )
