import csv
from flask import Flask, request
from flask_restful import Resource, Api
from flask_jsonpify import jsonify
from json import dumps

from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Router(Resource):
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
                device["input_octets_ratio"]  = device_data[8]
                device["output_octets_ratio"] = device_data[9]
                device["max_total_octets"]    = device_data[10]
                device["status_of_operation"] = device_data[11]
                device["swap_octets"]         = device_data[12]
                device["bandwidth_limitation"]= device_data[13]
                device["original_url"]        = device_data[14]
                connected_devices.append(device)
                # purposely adding 2
                connected_devices.append(device)

        return jsonify(connected_devices[0])

api.add_resource(Router, '/router', endpoint="router")

if __name__ == '__main__':
     app.run()
