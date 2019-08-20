import sys
import logging
import datetime
import time
import os
import uuid
import argparse 

from azure.eventhub import EventHubClient, Sender, EventData

logger = logging.getLogger("azure")

parser = argparse.ArgumentParser(description="Please supply eventhub name and access key.")
parser.add_argument('--eventhub')
parser.add_argument('--key')
args = parser.parse_args()

USER = "RootManageSharedAccessKey"
ADDRESS = "amqps://" + args.eventhub + ".servicebus.windows.net/hub001"
KEY = args.key

try:
    if not ADDRESS:
        raise ValueError("No EventHubs URL supplied.")

    # Create Event Hubs client
    client = EventHubClient(ADDRESS, debug=False, username=USER, password=KEY)
    sender = client.add_sender(partition="0")
    client.run()
    
    try:
        start_time = time.time()
        for i in range(50):
            print("Sending message: {}".format(i))
            id = str(uuid.uuid4())
            sender.send(EventData(str(id[:8])))
    except:
        raise
    finally:
        end_time = time.time()
        client.stop()
        run_time = end_time - start_time
        logger.info("Runtime: {} seconds".format(run_time))

except KeyboardInterrupt:
    pass