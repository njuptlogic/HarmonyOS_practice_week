

import dataRdb from '@ohos.data.relationalStore';
import CommonConstants from '../common/CommonConstants';
import { Logger } from '../utils/Logger';
import RdbUtils from '../utils/RdbUtils';
import HealthInfo from '../viewmodel/HealthInfo';





class HealthApi {
  /**
   * insert taskInfo
   *
   * @param taskInfo
   * @param callback
   */
  insertData(healthInfo: HealthInfo, callback: Function): void {
    const valueBucket = generateBucket(healthInfo);
    RdbUtils.insert('healthInfo', valueBucket).then(result => {
      callback(result);
    });
    Logger.info('UserInfoTable', `Insert userInfo {${healthInfo.id}:${healthInfo.createTime}} finished.`);
  }

  /**
   * query taskInfo
   *
   * @param date
   * @param callback
   */
  query(callback: Function): void {
    let tableName = CommonConstants.HEALTH_INFO.tableName;
    if (!tableName) {
      return;
    }
    let predicates = new dataRdb.RdbPredicates(tableName);
    predicates.orderByDesc('createTime');
    RdbUtils.query(predicates).then(resultSet => {
      let count = resultSet.rowCount;
      if (count === 0 || typeof count === 'string') {
        Logger.error('UserInfoTable', `query no results!`);
        const result: HealthInfo[] = [];
        callback(result);
      } else {
        resultSet.goToFirstRow();
        const result: HealthInfo[] = [];
        for (let i = 0; i < count; i++) {
          let tmp = new HealthInfo(0, 0, '', '','', '', '', '');
          tmp.id = resultSet.getDouble(resultSet.getColumnIndex('id'));
          tmp.createTime = resultSet.getLong(resultSet.getColumnIndex('createTime'));
          tmp.heartRateAlive = resultSet.getString(resultSet.getColumnIndex('heartRateAlive'));
          tmp.bloodPressure = resultSet.getString(resultSet.getColumnIndex('bloodPressure'));
          tmp.sleepTime = resultSet.getString(resultSet.getColumnIndex('sleepTime'));
          tmp.heartRateMax = resultSet.getString(resultSet.getColumnIndex('heartRateMax'));
          tmp.heartRateQuite = resultSet.getString(resultSet.getColumnIndex('heartRateQuite'));
          tmp.heartRateSour = resultSet.getString(resultSet.getColumnIndex('heartRateSour'));
          result[i] = tmp;
          resultSet.goToNextRow();
        }
        callback(result);
      }
    });
  }
}

function generateBucket(healthInfo: HealthInfo): dataRdb.ValuesBucket {
  let valueBucket = {} as dataRdb.ValuesBucket;
  CommonConstants.HEALTH_INFO.columns?.forEach((item: string) => {
    if (item !== 'id') {
      switch (item) {
        case 'createTime':
          valueBucket[item] = healthInfo.createTime;
          break;
        case 'heartRateAlive':
          valueBucket[item] = healthInfo.heartRateAlive;
          break;
        case 'bloodPressure':
          valueBucket[item] = healthInfo.bloodPressure;
          break;
        case 'sleepTime':
          valueBucket[item] = healthInfo.sleepTime;
          break;
        case 'heartRateMax':
          valueBucket[item] = healthInfo.heartRateMax;
          break;
        case 'heartRateQuite':
          valueBucket[item] = healthInfo.heartRateQuite;
          break;
        case 'heartRateSour':
          valueBucket[item] = healthInfo.heartRateSour;
          break;


        default:
          break;
      }
    }
  });
  return valueBucket;
}

let healthApi = new HealthApi();

export default healthApi as HealthApi;