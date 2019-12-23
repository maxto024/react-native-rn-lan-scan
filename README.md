
# react-native-rn-lan-scan

## Getting started

`$ npm install react-native-rn-lan-scan --save`

### Mostly automatic installation

`$ react-native link react-native-rn-lan-scan`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-rn-lan-scan` and add `RNRnLanScan.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNRnLanScan.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNRnLanScanPackage;` to the imports at the top of the file
  - Add `new RNRnLanScanPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-rn-lan-scan'
  	project(':react-native-rn-lan-scan').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-rn-lan-scan/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-rn-lan-scan')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNRnLanScan.sln` in `node_modules/react-native-rn-lan-scan/windows/RNRnLanScan.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Rn.Lan.Scan.RNRnLanScan;` to the usings at the top of the file
  - Add `new RNRnLanScanPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNRnLanScan from 'react-native-rn-lan-scan';

// TODO: What to do with the module?
RNRnLanScan;
```
  