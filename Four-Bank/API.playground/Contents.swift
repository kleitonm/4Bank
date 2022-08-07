import UIKit

import UIKit



func postApiEvandro() {

let params = [

"account": "23459",

"agency": "8855",

"bank": "FourBank",

"city": "Carapicuíba",

"state": "São Paulo",

"accountBalance": 4500,

"name": "Luiza",

"birthDate": "0000",

"cpf": "48371027544",

"rg": "",

"email": "lu@gmail.com",

"password": "232425",

"street": "Rua Álvaro de Almeida",

"number": "98",

"cep": "06923812",

"neighborhood": "Conjunto Habitacional",

"cellphoneNumber": "11943210651",

"cpfPix": "48371027544",

"emailPix": "lu@gmail.com",

"cellphonePix": "11943210651",

"randowKeyPix": "8293jsdjias98JSUHD09238snud",

"cvv": 755,

"value": 0330,

"cardNumber": 8230194856201293

] as [String : Any]

guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account1/2") else {

fatalError("typicode URL not working")

}

var request = URLRequest(url: url)

request.httpMethod = "DELETE"
request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])

let session = URLSession.shared.dataTask(with: request) { data, response, error in

if let error = error {

print("The error was: \(error.localizedDescription)")

} else {

print(response)

print(url)

let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])

print("Response json is: \(jsonRes)")

}

}.resume()
}
postApiEvandro()
