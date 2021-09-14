# PRODUCT SERVICE
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Product(Resource):
    def get(self):
        return {
            'products': ['Coca-cola',
                        'Cake',
                        'Biscuits',
                        'Potato chip']
        }

api.add_resource(Product, '/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)