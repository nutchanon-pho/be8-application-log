# Beryl8 Application Log

This repository contains a service for using with any general purpose logging. For example, web serivce integration logging for requests and responses between Salesforce and external systems.

### Supported Features
- Debug Levels with configurable switch to turn on/off any levels
- Attachment support for keeping raw request or response within each Application Log
- Configurable email alert using workflow
- Include stack trace
- Include origin class and function name

### Fields
- Class: The Apex Class name that originated this Application Log.
- Function: The originating function in the class (e.g. UpdateDivision() ).
- Endpoint: The target endpoint of a web service log.
- Debug Level: Debug Level of the Application Log.
- Reference Id: The related record id(s).
- Reference Information: The related record info (e.g. Apex Batch Job Id, Contact etc).

### Debug Levels
Debug Level of the Application Log which could be:
- Info: logged for additional information
- Debug: logged for debug purpose
- Warning: logged to capture problem in the system but is not regarded as an error
- Error: logged to capture problem in the system but is regarded as an error

The Debug Level is controlled by a custom setting to dictate which Debug Level will be logged.