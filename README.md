
## Diagram
![alt text](https://github.com/dedihartono801/product-svc/blob/master/diagram.png)

## Description

[Microservices with Go, gRPC and TLS server side, API Gateway, and Authentication]

## Repositories

- https://github.com/dedihartono801/product-svc - Product SVC (gRPC)
- https://github.com/dedihartono801/order-svc - Order SVC (gRPC)
- https://github.com/dedihartono801/auth-svc - Authentication SVC (gRPC)
- https://github.com/dedihartono801/api-gateway - API Gateway (HTTP)
- https://github.com/dedihartono801/protobuf - Proto file
- https://github.com/dedihartono801/ssl - For generate your ssl each service

## Create database auth_svc,product_svc,order_svc

## Installation

```bash
#clone all repo services
#create folder "ssl" in each services (auth-svc,order-svc,product-svc,api-gateway) 
#go to your ssl repo and generate ssl with command below:
$ ./run.sh
#and then ssl generated, copy all folders (auth-svc,order-svc,product-svc,api-gateway) in ssl repo to "ssl folder" that you have made before
```

## Running the app

```bash
$ make server
```

## Generate protobuf

```bash
#go to your protobuf repo and run command below:
$ ./generator.sh
```

## API

```bash
#register
curl --location --request POST 'http://localhost:3000/auth/register' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "dapur-ngebul@pt.com",
    "password": "12345678"
}'
```

```bash
#login
curl --location --request POST 'http://localhost:3000/auth/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "dapur-ngebul@pt.com",
    "password": "12345678"
}'
```

```bash
#add product
curl --location --request POST 'http://localhost:3000/product' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDM5MTk3MTgsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJkYXB1ci1uZ2VidWxAcHQuY29tIn0.wY_1gRNJV0U7_nP23-dxazRwXCPl1Ad2Who4xXfTj3I' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Product A",
    "stock": 20,
    "price": 15000
}'
```

```bash
#find product
curl --location --request GET 'http://localhost:3000/product/1' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDM5MTk3MTgsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJkYXB1ci1uZ2VidWxAcHQuY29tIn0.wY_1gRNJV0U7_nP23-dxazRwXCPl1Ad2Who4xXfTj3I'
```

```bash
#create order
curl --location --request POST 'http://localhost:3000/order' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDM5MTk3MTgsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MSwiRW1haWwiOiJkYXB1ci1uZ2VidWxAcHQuY29tIn0.wY_1gRNJV0U7_nP23-dxazRwXCPl1Ad2Who4xXfTj3I' \
--header 'Content-Type: application/json' \
--data-raw '{
 "productId": 15,
 "quantity": 11
}'
```



