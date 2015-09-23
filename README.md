# questionnaire-react
This is a sample questionnaire/survey application built with ReactJs and Rails 4.2.3

## Database Schema

Answer

Column        | Type
------------- | -------------
id            | ID
label         | string
disabled      | string


Question

Column        | Type
------------- | -------------
id            | ID
label         | string
disabled      | string

Survey

Column        | Type
------------- | -------------
id            | ID
user_email    | string
result_id     | Result Id

Result

Column        | Type
------------- | -------------
id            | ID
label         | string
description   | Result Id
