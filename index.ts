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
  show: function (
    message: string,
    duration: Duration = Duration.SHORT
  ): void  {
    RNTAiToast.show(message, duration)
  },

  showWithGravity: function (
    message: string,
    duration: Duration = Duration.SHORT,
    gravity: Postion = Postion.BOTTOM
  ): void  {
    RNTAiToast.showWithGravity(message, duration, gravity)
  },
  showWithGravityAndOffset: function(
    message: string,
    duration: Duration = Duration.SHORT,
    gravity: Postion = Postion.BOTTOM,
    xOffset: number ,
    yOffset: number = 40,
  ): void {
    RNTAiToast.showWithGravityAndOffset(message, duration, gravity, xOffset, yOffset);
  },
}


export default AiToast
