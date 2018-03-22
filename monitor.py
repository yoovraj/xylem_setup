import csv
from flask import Flask, request
from flask_restful import Resource, Api
from flask_restful.utils import cors
from flask_jsonpify import jsonify
from flask_cors import CORS
from json import dumps

from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

# measure of data usage per coin
# units in octet-seconds per xnt
PROVIDER_RATE = 1000*1000

class Router(Resource):
    @cors.crossdomain(origin='*')
    def get(self):
        print("Fetching data")
        connected_devices = []
        with open('data.csv') as csvFile:
            reader = csv.reader(csvFile)
            for device_data in reader:
                device = {}
                device["mac_address"]         = device_data[0]
                device["ip_address"]          = device_data[1]
                device["chilli_state"]        = device_data[2]
                device["session_id"]          = device_data[3]
                device["authenticated_status"]= device_data[4]
                device["user_name"]           = device_data[5]
                device["duration_ratio"]      = device_data[6]
                device["idle_time_ratio"]     = device_data[7]
                device["input_octets_ratio"]  = device_data[8].split("/")[0]
                device["output_octets_ratio"] = device_data[9].split("/")[0]
                device["max_total_octets"]    = device_data[10]
                device["status_of_operation"] = device_data[11]
                device["swap_octets"]         = device_data[12]
                device["bandwidth_limitation"]= device_data[13]
                device["original_url"]        = device_data[14]

                device_stats = {}
                device_stats["user_name"] = device["user_name"]
                #device_stats[""]
                input_octets = int(device["input_octets_ratio"].split("/")[0])
                output_octets = int(device["output_octets_ratio"].split("/")[0])
                duration = int(device["duration_ratio"].split("/")[0])
                idle_time = int(device["idle_time_ratio"].split("/")[0])
                total_octet_secs = (input_octets + output_octets) * (duration - idle_time)
                data_cost = total_octet_secs/PROVIDER_RATE
                device_stats["data_cost"] = data_cost
                # todo recharge this cost by some xnts
                connected_devices.append(device_stats)

        return jsonify({"devices":connected_devices})

api.add_resource(Router, '/router', endpoint="router")

if __name__ == '__main__':
     app.run()
