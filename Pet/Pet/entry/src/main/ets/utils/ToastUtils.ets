import promptAction from '@ohos.promptAction'


export default function showToast(message: Resource|string, duration: number = 2000) {
  try {
    promptAction.showToast({
      message: message,
      duration: duration,
      bottom: 30,
    })
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  }
}
