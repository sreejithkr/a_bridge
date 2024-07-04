
# a_bridge

## Storyline
The Flutter plugin "a_bridge" was conceived to enhance Appium Flutter automation within iOS simulators. The plugin was build to solve a particular problem statement as part of the discussion defined in the storyline.

Its name, derived from "A Bridge", symbolizes its role in bridging functionalities across flutter runtime and native operating systems.The end outcome or theme would be to leverage these to bring operational  
scalability and efficiency in the development environment.

The idea emerged during a conversation between two tech enthusiasts—a QA specialist and an iOS developer—discussing challenges related to reading command line arguments passed to an application processes. The iOS developer highlighted the possibility to read these arguments via Swift APIs. The reasoning exchanged was the fundamental fact that as underneath every process  there is a entry-point function(main in case of ios) that act as the starting point of the application.

The initial purpose of the "a_bridge" Flutter plugin centers on extracting command line parameters, crucial for configuring ports in [Appium Flutter Server](https://pub.dev/packages/appium_flutter_server). This functionality serves as a foundational feature, with plans to expand its capabilities over time to add the feature from underlying operating system that which help development.

The plugin leverages Flutter's method channels to bridges to API's exposed native platforms.

## Note
####  Although currently centered on command line argument extraction, the "a_bridge" plugin is designed to evolve. It aims to bridge diverse OS functionalities, fostering operational efficiency and scalability for development operations.


# ABridge Class
The ABridge class provides a Flutter plugin interface for retrieving command line arguments from the native platform using Dart's Foreign Function Interface (FFI). This functionality is particularly useful for configuring ports and facilitating Appium Flutter Server used along with iOS.

## Usage
To use ABridge in your Flutter project:

### Installation

Add ABridge as a dependency in your pubspec.yaml file:
```  
 dependencies: a_bridge: ^0.0.1  
```  

### Import
import the a_bridge package in your Dart file:

 ```  
 import 'package:a_bridge/a_bridge.dart';
 ```  

### Retrieve Command Line Arguments

Use the ABridge class to retrieve command line arguments asynchronously:

```  
 void main() async {
   ABridge aBridge = ABridge(); 
   List<String>? arguments = await aBridge.getArgumentList(); 
   if (arguments != null) { 
	   print('Command line arguments: $arguments'); 
   } 
   else {
	   print('Failed to retrieve command line arguments.'); 
   } 
}
 ```  

### ABridge Class API


#### Public Functions
```
Future<List<String>?> getArgumentList()
```
Returns a Future that resolves to a list of arguments retrieved from the platform interface.

```
Future<Map<String, dynamic>?> getArgumentPair({String separator = "="})
```
Returns a Future that resolves to a map of arguments parsed from the argument list, where each key-value pair represents an argument and its corresponding value. The separator parameter specifies the character used to separate key-value pairs in the arguments.



Usage Example:

```  
 ABridge aBridge = ABridge();
 List<String>? arguments = await aBridge.getArgumentList(); 
 if (arguments != null) { 
	print('Command line arguments: $arguments'); 
 }
 else { 
	print('Failed to retrieve command line arguments.'); 
 }


 Map<String,dynamic>? mapArguments = aBridge.getArgumentPair(separator: '=');
  if (mapArguments != null) {
    print('Argument Map: $mapArguments');
    for (var key in mapArguments.keys) {
	 var value = mapArguments[key];
   	 print('Key: $key, Value: $value');
    }
  } else {
    print('Failed to retrieve argument map.');
  }

 ```  

### Contributing
Contributions to ABridge are welcome! If you encounter issues or have suggestions for improvements, please file an issue on GitHub
