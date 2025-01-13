

import dataRdb from '@ohos.data.relationalStore';
import CommonConstants from '../common/CommonConstants';
import { Logger } from '../utils/Logger';
import RdbUtils from '../utils/RdbUtils';
import UserInfo from '../viewmodel/UserInfo';




class LoginApi {
  /**
   * insert taskInfo
   *
   * @param taskInfo
   * @param callback
   */
  insertData(userInfo: UserInfo, callback: Function): void {
    const valueBucket = generateBucket(userInfo);
    RdbUtils.insert('userInfo', valueBucket).then(result => {
      callback(result);
    });
    Logger.info('UserInfoTable', `Insert userInfo {${userInfo.username}:${userInfo.password}} finished.`);
  }

  updateDataById(userInfo: UserInfo, callback: Function): void {
    const valueBucket = generateBucket(userInfo);
    let tableName = CommonConstants.USER_INFO.tableName;
    if (!tableName) {
      return;
    }
    let predicates = new dataRdb.RdbPredicates(tableName);
    predicates.equalTo('username', userInfo.username);
    RdbUtils.update(valueBucket, predicates).then((result: number) => {
      callback(result);
    });
    Logger.info('UserInfoTable', `Update data {${userInfo.username}:${userInfo.password}} finished.`);
  }


  /**
   * query taskInfo
   *
   * @param date
   * @param callback
   */
  query(username:string, callback: Function): void {
    let tableName = CommonConstants.USER_INFO.tableName;
    if (!tableName) {
      return;
    }
    let predicates = new dataRdb.RdbPredicates(tableName);
    predicates.orderByDesc('createTime');
    predicates.equalTo('username', username)
    RdbUtils.query(predicates).then(resultSet => {
      let count = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        Logger.error('UserInfoTable', `query no results!`);
        const result: UserInfo[] = [];
        callback(result);
      } else {
        resultSet.goToFirstRow();
        const result: UserInfo[] = [];
        for (let i = 0; i < count; i++) {
          let tmp = new UserInfo(0, 0, '', '');
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
          tmp.createTime = resultSet.getLong(resultSet.getColumnIndex('createTime'));
          tmp.username = resultSet.getString(resultSet.getColumnIndex('username'));
          tmp.password = resultSet.getString(resultSet.getColumnIndex('password'));
          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }
}

function generateBucket(userInfo: UserInfo): dataRdb.ValuesBucket {
  let valueBucket = {} as dataRdb.ValuesBucket;
  CommonConstants.USER_INFO.columns?.forEach((item: string) => {
    if (item !== 'id') {
      switch (item) {
        case 'createTime':
          valueBucket[item] = userInfo.createTime;
          break;
        case 'username':
          valueBucket[item] = userInfo.username;
          break;
        case 'password':
          valueBucket[item] = userInfo.password;
          break;

        default:
          break;
      }
    }
  });
  return valueBucket;
}

let loginApi = new LoginApi();

export default loginApi as LoginApi;