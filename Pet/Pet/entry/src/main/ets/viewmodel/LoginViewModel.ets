
import LoginApi from '../database/LoginApi';


import { Logger } from '../utils/Logger';
import UserInfo from './UserInfo';




/**
 * @description Get all task status
 * @return object[] Database query results
 */
export const getLoginInfo = (username: string) => {
  return new Promise<UserInfo[]>((resolve) => {
    LoginApi.query(username, (res: UserInfo[]) => {
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
export const addUser = (userInfo: UserInfo) => {
  console.log('aaa', '执行了addUser');
  if (!userInfo) {
    Logger.error('addTask', 'params is null!');
    return new Promise<string>((resolve) => {
      resolve('-1');
    });
  }
  return new Promise<string>(async (resolve, reject) => {
    Logger.info('TaskViewModel', 'addTask');

    LoginApi.insertData(userInfo, (isDone: string) => {
      Logger.error('TaskViewModel', isDone)
      resolve(isDone)
      if (isDone) {
        Logger.info('AppStart', 'Insert taskInfo success: ' + JSON.stringify(userInfo));
      }
    });
  });
}

export const updateUser = (userInfo: UserInfo) => {
  if (!userInfo) {
    Logger.error('updateTask', 'params is null!');
    return new Promise<number>((resolve) => {
      resolve(-1);
    });
  }
  return new Promise<number>(async (resolve, reject) => {
    Logger.info('TaskViewModel', 'updateTask');

    LoginApi.updateDataById(userInfo, (isDone: number) => {
      resolve(isDone)
      if (isDone) {
        Logger.info('AppStart', 'update taskInfo success: ' + JSON.stringify(userInfo));
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




