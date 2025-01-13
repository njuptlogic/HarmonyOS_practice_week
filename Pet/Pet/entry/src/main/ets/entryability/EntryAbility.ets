import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import RdbUtils from '../utils/RdbUtils'
import CommonConstants from '../common/CommonConstants'
import {columnUserInfoInfoList, columnHealthInfoInfoList} from '../models/RdbColumnModel'

export default class EntryAbility extends UIAbility {
  async onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    RdbUtils.initDb(this.context, CommonConstants.RDB_NAME.dbName ? CommonConstants.RDB_NAME.dbName : '');
    await RdbUtils.createDb();

    RdbUtils.createTable(CommonConstants.USER_INFO.tableName ? CommonConstants.USER_INFO.tableName : '', columnUserInfoInfoList).then(() => {
    }).catch((err: Error) => {
    });

    RdbUtils.createTable(CommonConstants.HEALTH_INFO.tableName ? CommonConstants.HEALTH_INFO.tableName : '', columnHealthInfoInfoList).then(() => {
    }).catch((err: Error) => {
    });
  }
  // async onCreate(want:null, launchParam:null) {
  //   hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  //   RdbUtils.initDb(this.context, CommonConstants.RDB_NAME.dbName ? CommonConstants.RDB_NAME.dbName : '');
  //   await RdbUtils.createDb();
  //
  //   RdbUtils.createTable(CommonConstants.USER_INFO.tableName ? CommonConstants.USER_INFO.tableName : '', columnUserInfoInfoList).then(() => {
  //   }).catch((err: Error) => {
  //   });
  //
  //   RdbUtils.createTable(CommonConstants.HEALTH_INFO.tableName ? CommonConstants.HEALTH_INFO.tableName : '', columnHealthInfoInfoList).then(() => {
  //   }).catch((err: Error) => {
  //   });
  // }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
