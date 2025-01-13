
import HealthApi from '../database/HealthApi';



import { Logger } from '../utils/Logger';
import HealthInfo from './HealthInfo';





/**
 * @description Get all task status
 * @return object[] Database query results
 */
export const getHealthInfo = () => {
  return new Promise<HealthInfo[]>((resolve) => {
    HealthApi.query((res: HealthInfo[]) => {
      if (res?.length === 0) {
        Logger.warn('loginInfo', 'has no data!!');
        resolve(res ?? []);
      }
      Logger.info('loginInfo', 'task size }' + res.length);
      resolve(res);
    })
  });
}

/**
 * @param params:TaskInfo
 */
export const addHealth = (healthInfo: HealthInfo) => {
  console.log('aaa', '执行了addUser');
  if (!healthInfo) {
    Logger.error('addTask', 'params is null!');
    return new Promise<string>((resolve) => {
      resolve('-1');
    });
  }
  return new Promise<string>(async (resolve, reject) => {
    Logger.info('TaskViewModel', 'addTask');

    HealthApi.insertData(healthInfo, (isDone: string) => {
      Logger.error('TaskViewModel', isDone)
      resolve(isDone)
      if (isDone) {
        Logger.info('AppStart', 'Insert taskInfo success: ' + JSON.stringify(healthInfo));
      }
    });
  });
}


/**
 * @description Returns the timestamp of today's selected time
 * @param currentTime
 * @return timestamp
 */
export function returnTimeStamp(currentTime: string) {
  const timeString = `${new Date().toDateString()} ${currentTime}`;
  return new Date(timeString).getTime();
}




