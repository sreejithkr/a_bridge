# a_bridge_example

Demonstrates how to use the a_bridge plugin.

## Context

The project shows the invocation of the functionality in the a_bridge plugin.
```
getArgumentList
```
The method return the list of commandline argument as array which is displayed in the list. 

Install the application on simulator and running the below command would show the param list passed via commandline

```
 xcrun simctl launch booted com.skr.aBridgeExample --args test1 --port=1729
```

Note: Application should not be running/active state while executing the command 



