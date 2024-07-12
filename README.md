# Application Code Assignment

We do not expect you to spend more than 4 hours on this. Feel free to spend more if you enjoy the exercise. It is perfectly fine to leave many rough edges or even parts untouched!

Feel free to take any decision and think up somewhat realistic practical scenario. Please explain your decisions and scenario, either as comments in the code or in a README.

### Web service
Create a tiny REST web service in Ruby, Node.js, Python or Go using a framework (e.g. Sinatra or similar) that is runnable with docker. 
The API should have two concepts: company and owner.

A company has the following attributes:
- Company Name
- Country
- Phone Number (optional)
- One or more owners

An owner has the following attributes:
- Name
- Social Security Number 

The API *may* support:
- Create new company
- Get a list of all companies
- Get details about a company
- Update a company
- Add an owner of the company
- Check Social Security Number

Simulate a backend that can check the Social Security Number by randomly returning "valid/invalid".

The API should define at least two access groups; e.g. one that will not be able to read the Social Security Number. You do not need consider the security of authenticating to the web service, but propose a protocol/method and justify your choice.


### README

Write a good README in Markdown, Restructered Text or alike. 

The README should explain how to
- setup and run the service using docker
- query the API using cURL


### Considerations
- How can the service be made redundant? What considerations should you do?
- Is the service scalable? What changes could be made to improve scalability?
- Can the API be made idempotent?
- What changes should be made to support multiple backends for checking the Social Security Number?

### CodeSubmit

Please organize, design, test and document your code as if it were going into production - then push your changes to the master branch. After you have pushed your code, you may 
submit the assignment on the assignment page.

All the best and happy coding,
