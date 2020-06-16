# react-native-ai-toast

## Getting started

`$ npm install react-native-ai-toast --save`

### Mostly automatic installation

`$ react-native link react-native-ai-toast`

## Usage
```javascript
import AiToast from 'react-native-ai-toast';

// TODO: What to do with the module?
AiToast;
```
import Toast from 'react-native-toast-native';
 const style={
                             backgroundColor: "#4ADDFB",
                             width: 300,
                             height: Platform.OS === ("ios") ? 50 : 100,
                             color: "#ffffff",
                             fontSize: 15,
                             lineHeight: 2,
                             lines: 4,
                             borderRadius: 15,
                             fontWeight: "bold",
                             yOffset: 40
                         };
 
Toast.show('This is a long toast.',Toast.SHORT,Toast.TOP,style); 
styles 
android:
{
              width,
              height,
              backgroundColor,
              color,
              borderWidth,
              paddingLeft,
              paddingRight,
              paddingBottom,
              paddingTop,
              fontSize,
              lineHeight,
              xOffset,
              yOffset,
              letterSpacing,
              fontWeight
}
Ios:

  {
                  width,
                  height,
                  backgroundColor,
                  color,
                  borderWidth,
                  borderColor,
                  borderRadius
  }
  