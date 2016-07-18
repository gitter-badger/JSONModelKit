[![Cocoapods Compatible](https://img.shields.io/badge/pod-v1.0-blue.svg)](https://cocoapods.org/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20tvos-lightgrey.svg)](https://github.com/AntonTheDev/JSONModelKit/)
[![License](https://img.shields.io/badge/license-MIT-343434.svg)](https://github.com/AntonTheDev/JSONModelKit/)

#JSONModelKit

##Introduction

JSONModelKit is an an extremely lightweight mapping framework that follows an API-Driven approach to stream line development. JSONModelKit differs from other frameworks by taking an API-first approach and mapping against the response up front, then generatting the model objects based on the definition, so there is one point of update anytime the API changes. 

By providing a single point of configuration, and driving the model definition against an API reponse, it makes it very easy to keep your model in sync with an API and streamline development.

##Features

- [X] Model Auto-Generation .json/.plists configuration files
- [X] String, Int, Double, Float, Bool, Array, Dictionary
- [X] Optional & Non-Optional Property Support:
	* Native Types: String, Int, Double, Float, Bool, Array, Dictionary
	* Collections Types: Array\<AnyObject\>, Dictionary\<String, AnyObject\>
	* Structs, Enums, Closures, Tuples via Transformations
- [X] Mapping Nested Values
- [X] Predefined Default Values

##Installation

* **Requirements** : XCode 7.3+, iOS 8.0+, OSX 10.9+, tvOS 9.0+
* [Installation Instructions](/documentation/installation.md)
* [Release Notes](/documentation/changelog.md)

##Communication

- If you **found a bug**, or **have a feature request**, open an issue.
- If you **need help** or a **general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/json-mapperkit). (tag 'json-mapperkit')
- If you **want to contribute**, review the [Contribution Guidelines](/Documentation/CONTRIBUTING.md), and submit a pull request. 


##Core Concept

![alt tag](/documentation/readme_assets/basic_concept_image.png?raw=true)

Past frameworks generally follow a pattern of manually creating the object model, then retrofitting a mapping framework to ingest the API. Keeping these two task contained and synchronized can become a task in it's own, and this is where JSONModelKit differs.

The simple example above demonstrates the inner workings of the JSONModelKit. In this example we will attemp to map a Person object returned in the form a dictionary. The first step is to manually generate a plist representing the data that is being returned. This plist defines properties, data types, the mapping keys associated with the response dictionary, and any transformation that needs to be applied. Once defined, a build-time script will generate two model object files representing the model mapping.

The first class generated in the diagram represents the internal `_Person.swift` class, which contains script-generated property definitions, along two initializers, one required, and one fail-able. The generated fail-able initializer takes in a `Dictionary<String, AnyObject>` input value which is parsed to the model. The internal files purpose is to support the framework by mapping the response data and should not be modified by the developer since the script will regenerate it every time the project is built.

The second class generated is the `Person.swift` which inherits from the internal `_Person.swift` class. This provides a means for developer to append any custom logic, properties, or implementations of protocols as needed during the development process. This class is only generated once, and will never be overwritten during the build task. Thus updating the model mapping will not affect any logic defined in the external class.

##Basic Use

####Initialization with Dictionary

Once configured per the [Installation](/documentation/installation.md) instructions:

1. Create a plist model mapping and place it in the mapping folder defined during installation.
2. Build the target, navigate to the output directory defined during the installation process, and add the generated files to the project.
3. Map the data to an instance, call the fail-able initializer generated by JSONModelKit with the `Dictionary<String, AnyObject>` data to parse.

	```
let newInstance = TestModelObject(dataDictionary)
	```

####Update with Dictionary

Once an instance has been initialized, we can pass a new dictionary with values to update for the current instance by calling `updateWithDictionary(dictionary : Dictionary<String, AnyObject>?)`. Note that only the values which are being passed within will be updated, defaults values are ignored unline the initialization

```
let instance = TestModelObject(dataDictionary)
let newValuesDictionary = [... : ...]

// Updates the current values only with the new values received, defaults in mapping are ignored
instance.updateWithDictionary(newValuesDictionary)

```

####Examples 

Below is a list of examples for the supported features by JSONModelKit. Each provides an overall view on how to setup the model mapping file, and short examples of the outputs generated by pre-packaged script within the framework.

* [Optional Types](/documentation/optional_value_types.md)
* [Non-Optional Types](/documentation/non_optional_value_types.md) 
* [Collection Types](/documentation/collection_types.md)
* [Complex Types](/documentation/complex_value_types.md)
* [Default Value Definitions](/documentation/default_values.md)
* [Mapping Against Nested Values](/documentation/nested_mapping.md)
* [Custom Transformations](/documentation/custom_transforms.md)
* [Structs Mapping](/documentation/custom_transforms_struct.md)
* [Enum Mapping](/documentation/custom_transforms_enums.md)
* [Closures Mapping](/documentation/custom_transforms_closures.md)
* [Tuples Mapping](/documentation/custom_transforms_tuples.md)
* [Enabling Debug Mode](/documentation/enable_debug_mode.md)

## License

*JSONModelKit is released under the MIT license. See [License](/LICENSE.md) for details.*
