# react-native-aitoast

## Getting started

`$ npm install react-native-aitoast --save`
or
`$ yarn add react-native-aitoast --save`


### Mostly automatic installation

`$ cd ios & pod install`

## Usage
```javascript
import * as AiToast from 'react-native-aitoast';
import AiToast,{Duration, Postion} from 'react-native-aitoast';

AiToast.show('msg', Duration.SHORT, Postion.BOTTOM)
```