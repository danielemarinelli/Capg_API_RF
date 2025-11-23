This framework performs user modul CRUD calls of petsore, under URL https://petstore.swagger.io/

It's implemented with Robot Framework folowing Page Object Model.

Three folders are present:
- tests contains the TCs (positive and negative scenarios)
- resources contains UserAPI robot file that is a resource with the business logic
- variables that contains env_variables robot file with data to send to payload and common baseURL

Install Python and Robot Framework. The library neede are RequestsLibrary and Collections. 

To run navigate to project folder /tests and run the following command:
robot tests

Reports and logs will be generated as .html files
