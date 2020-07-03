import { NativeModules, ToastAndroid, Platform } from 'react-native'

const RNTAiToast = Platform.OS === 'android' ? ToastAndroid : NativeModules.RNTAiToast

export enum Duration {
  SHORT = RNTAiToast.SHORT,
  LONG = RNTAiToast.LONG
}
export enum Postion {
  TOP = RNTAiToast.TOP,
  CENTER = RNTAiToast.CENTER,
  BOTTOM = RNTAiToast.BOTTOM
}
const AiToast = {
  show: (
    message: string,
    duration: Duration
  ) => {
    RNTAiToast.show(message, duration || Duration.SHORT)
  },

  showWithGravity: (
    message: string,
    duration?: Duration ,
    gravity?: Postion
  ) => {
    RNTAiToast.showWithGravity(message, duration || Duration.SHORT, gravity || Postion.BOTTOM)
  },
  showWithGravityAndOffset: (
    message: string,
    duration?: Duration ,
    gravity?: Postion ,
    xOffset?: number ,
    yOffset?: number ,
  ) => {
    RNTAiToast.showWithGravityAndOffset(message,duration || Duration.SHORT, gravity || Postion.BOTTOM, xOffset || 0, yOffset || 40);
  },
}


export default AiToast
