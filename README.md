# Vapor-API

### Base URL

```
https://marketprices-api.fly.dev/
```

### Endpoints

1. Get products

**Endpoint**: /products
**Method**: GET
**Description**: Fetch all the products that exist in the database
**Parameters**: None
**Example Request**:
```
curl -X GET "https://marketprices-api.fly.dev/products" 
```
**Example Response**:
```
[{"name":"Bread","price":9000,"id":"0727E105-E448-417F-A9E4-B10C59A9E2D2","description":"Bag"}]
```

2. Create product

**Endpoint**: /products
**Method**: POST
**Description**: Create a product in the products table.
**Parameters**: data (required)
     Type: JSON Object
     Description: The data to create the entity.   
**Example Request**: 
```
curl -X POST "https://marketprices-api.fly.dev/products" \
     -H 'Content-Type: application/json'  \
     -d '{"name":"Apple","price": 5000, "description": "Fruit"}'
```
**Example Response**:
```
{"name":"Apple","description":"Fruit","id":"5EFBB302-68DE-47F3-85B2-6E87943C3AB3","price":5000}
```

3. Update product

**Endpoint**: /products
**Method**: PUT
**Description**: Update an existing product.
**Parameters**: data (required)
     Type: JSON Object
     Description: The data to update the entity.
**Example Request**:
```
curl -X PUT "https://marketprices-api.fly.dev/products" \
     -H 'Content-Type: application/json'  \
     -d '{"id":"5EFBB302-68DE-47F3-85B2-6E87943C3AB3", "name":"Apple","price": 5000, "description": "Fruit"}'
```
**Example Response**:
```
HTTP Status: 200 OK
```

4. Delete product

**Endpoint**: /products/{productID}
**Method**: DELETE
**Description**: Delete an existing product by ID.
**Parameters**: productID (required)
**Example Request**:
```
curl -X DELETE "https://marketprices-api.fly.dev/products/5EFBB302-68DE-47F3-85B2-6E87943C3AB3"
```
**Example Response**:
```
HTTP Status: 200 OK
```
