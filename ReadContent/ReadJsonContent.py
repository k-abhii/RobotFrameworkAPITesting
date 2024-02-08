import json
def read_request_jsoncontent():
    file = open("C:/Users/hp/PycharmProjects/API_Student_Management_System/TestCases/RequestJson.json")
    jsonfile = file.read()
    json_content = json.loads(jsonfile)
    return json_content
# x=read_request_jsoncontent()
# print(x)