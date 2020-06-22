import { NativeModules, ToastAndroid, Platform } from 'react-native'

var RNTAiToast = Platform.OS === 'android' ? ToastAndroid : NativeModules.RNTAiToast

var AiToast = {
  // Toast duration constants
  SHORT: RNTAiToast.SHORT,
  LONG: RNTAiToast.LONG,

  // Toast gravity constants
  TOP: RNTAiToast.TOP,
  BOTTOM: RNTAiToast.BOTTOM,
  CENTER: RNTAiToast.CENTER,

  show: function (
    message,
    duration
  ) {
    RNTAiToast.show(message, duration === undefined ? this.SHORT : duration)
  },

  showWithGravity: function (
    message,
    duration,
    gravity
  ) {
    RNTAiToast.showWithGravity(message, duration === undefined ? this.SHORT : duration, gravity)
  }
}

export default AiToast
