# Read Me

This application is using MVC architecture. This is a headless application with one REST-full route open.

# Setup

Docker:
 - docker pull ptsdocker16/interview-test-server
 - docker run --init -p 5000:5000 -it ptsdocker16/interview-test-server

To run The application you need to the following
 - install ruby and rails
 - git clone
 - bundle install
 - rails s

# API usage
 
 - hit the api using an API client or browser.
 - make a post request to https://localhost:3000/calculate
 with a payload definition like

```
 {
  "annual_income": 10000000000,
  "tax_year": 2019
 }
```
On successful request the following response is generated

```
{
    "info": {
        "annual_income": 10000000000,
        "tax_year": 2019,
        "rate": 0.33,
        "tax_estimate": 3300000000.0
    },
    "status": "Success"
}
```

# Testing API





# gems

 -HTTParty